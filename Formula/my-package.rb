class MyPackage < Formula
  desc "Install from https://github.com/anomalyco/opencode/releases/download/v1.18.19/opencode-darwin-arm64.zip"
  homepage "https://github.com/anomalyco/opencode/releases/download/v1.18.19/opencode-darwin-arm64.zip"
  url "https://github.com/anomalyco/opencode/releases/download/v1.18.19/opencode-darwin-arm64.zip"
  sha256 "0026326bd77a3277ab3726be237410b19389f7829e8bb3c82dfaf9044162067c"

  livecheck do
    url "https://github.com/anomalyco/opencode/releases/download/v1.18.19/opencode-darwin-arm64.zip"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  def install
    bin.install "opencode"

    return unless OS.mac?

    search_paths = [libexec.to_s, bin.to_s].select { |d| File.directory?(d) }
    return if search_paths.empty?

    mach_o = Utils.safe_popen_read(
      "/usr/bin/find", *search_paths, "-type", "f", "-perm", "+111", "-print0"
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
    assert_match version.to_s, shell_output("#{bin}/opencode --version")
  end
end
