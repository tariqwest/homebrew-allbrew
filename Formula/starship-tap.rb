class StarshipTap < Formula
  desc "Install from https://starship.rs/install.sh"
  homepage "https://starship.rs/install.sh"
  url "https://starship.rs/install.sh"
  version "1.26.0"
  sha256 "52c64f14a558034ebeb1907ea9364e802b32474576fd3e68265f73bc33cc8fbb"

  livecheck do
    url "https://starship.rs/install.sh"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  def install
    ENV["PREFIX"] = prefix.to_s
    ENV["DESTDIR"] = prefix.to_s
    # Many vendor installers honor PREFIX/DESTDIR; others ignore them and write under $HOME
    # (commonly ~/.local/bin or ~/.<tool>/bin). Sandbox HOME so those paths stay inside buildpath.
    ENV["HOME"] = buildpath.to_s
    # Common generic override accepted by some installers.
    ENV["BIN_DIR"] = (buildpath/"bin").to_s
    ENV["INSTALL_DIR"] = (buildpath/"bin").to_s
    # Skip shell profile edits inside the sandbox; app-specific *_NO_MODIFY_PATH may override.
    ENV["NO_MODIFY_PATH"] = "1"
    # Warp Agent CLI honors WARP_TUI_* (defaults to $HOME/.warp and $HOME/.local/bin);
    # point them inside buildpath so the versioned layout is discoverable.
    ENV["WARP_TUI_INSTALL_DIR"] = (buildpath/"warp-tui").to_s
    ENV["WARP_TUI_BIN_DIR"] = (buildpath/"bin").to_s
    ENV["FORCE"] = "1"
    ENV["YES"] = "1"
    ENV["BIN_DIR"] = (buildpath/"bin").to_s
    system "mkdir", "-p", ENV.fetch("BIN_DIR")
    system "sh", cached_download.to_s, "--yes", "--force", "--version", version.to_s, "--bin-dir", (buildpath/"bin").to_s

    # Warp Agent CLI uses a versioned layout: $WARP_TUI_INSTALL_DIR/warp-tui/versions/<version>/warp-tui-stable
    # with a symlink $WARP_TUI_BIN_DIR/warp -> .../current/warp-tui-stable. The symlink target
    # is under buildpath and would be broken after install, so install the real binary directly.
    warp_bin = Dir[buildpath/"warp-tui"/"versions"/"*"/"warp-tui-*"].select { |f| File.file?(f) && File.executable?(f) }.first
    if warp_bin
      bin.install warp_bin => "warp"
      # Also ensure the versioned layout's resources are available if needed (optional)
      # The installer already staged everything under warp-tui/ — Homebrew only needs the binary.
      return
    end

    candidates = [
      buildpath/"bin",
      buildpath/".local/bin",
      buildpath/"usr/local/bin",
    ].uniq
    # Add any dot-prefixed tool home bin/ directories the installer created (e.g. ~/.volta/bin).
    Dir.glob(File.join(buildpath, ".*", "bin")).each do |d|
      base = File.basename(File.dirname(d))
      next if base == "." || base == ".."
      candidates << Pathname.new(d)
    end
    candidates.uniq!
    installed = false
    candidates.each do |dir|
      next unless dir.directory?
      bins = Dir[dir/"*"].select { |f| File.file?(f) && File.executable?(f) }
      next if bins.empty?
      # If the only bin is a broken symlink (warp -> warp-tui/...), resolve to the real binary.
      # Homebrew's bin.install would copy the symlink as-is, leaving a broken link.
      # For warp, the real binary is already handled above; for others, install as-is.
      bin.install bins
      installed = true
      break
    end
    unless installed
      # FNM_DOTMATCH so files under ~/.<tool>/... are found (Dir.glob skips dotdirs by default).
      bins = Dir.glob(File.join(buildpath, "**", "*"), File::FNM_DOTMATCH).select do |f|
        base = File.basename(f)
        next false if base == "." || base == ".."
        File.file?(f) && File.executable?(f) && !base.start_with?(".")
      end
      odie "install script produced no executable binaries under buildpath" if bins.empty?
      bin.install bins
    end
    return unless OS.mac?

    search_dirs = [libexec, bin].select { |d| d.respond_to?(:directory?) ? d.directory? : Dir.exist?(d.to_s) }.map(&:to_s)
    return if search_dirs.empty?

    mach_o = Utils.safe_popen_read(
      "/usr/bin/find", *search_dirs, "-type", "f", "-perm", "+111", "-print0"
    ).split("\0").reject(&:empty?).select do |path|
      Utils.safe_popen_read("/usr/bin/file", "-b", path).include?("Mach-O")
    rescue
      false
    end

    mach_o.each do |path|
      system "/usr/bin/xattr", "-cr", path
      system "/usr/bin/codesign", "--force", "--sign", "-", path
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/starship --version")
  end
end
