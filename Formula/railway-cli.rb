class RailwayCli < Formula
  desc "Install from https://raw.githubusercontent.com/railwayapp/cli/master/install.sh"
  homepage "https://raw.githubusercontent.com/railwayapp/cli/master/install.sh"
  url "https://raw.githubusercontent.com/railwayapp/cli/master/install.sh"
  version "5.35.0"
  sha256 "20f26ce00344fb5a0d853fddad067f269c4c95e3423db3cc6d29d02bcd6e57a9"

  livecheck do
    url "https://raw.githubusercontent.com/railwayapp/cli/master/install.sh"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  def install
    ENV["PREFIX"] = prefix.to_s
    ENV["DESTDIR"] = prefix.to_s
    # Many vendor installers honor PREFIX/DESTDIR; others ignore them and write under $HOME
    # (commonly ~/.local/bin). Sandbox HOME so those paths stay inside the buildpath.
    ENV["HOME"] = buildpath.to_s
    # Common generic override accepted by some installers.
    ENV["BIN_DIR"] = (buildpath/"bin").to_s
    system "bash", cached_download.to_s

    candidates = [
      buildpath/"bin",
      buildpath/".local/bin",
      buildpath/"usr/local/bin",
      Pathname.new(ENV.fetch("PREFIX"))/"bin",
    ].uniq
    installed = false
    candidates.each do |dir|
      next unless dir.directory?
      bins = Dir[dir/"*"].select { |f| File.file?(f) && File.executable?(f) }
      next if bins.empty?
      bin.install bins
      installed = true
      break
    end
    unless installed
      bins = Dir[buildpath/"**/*"].select do |f|
        File.file?(f) && File.executable?(f) && !File.basename(f).start_with?(".")
      end
      odie "install script produced no executable binaries under buildpath" if bins.empty?
      bin.install bins
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/railway-cli --version")
  end
end
