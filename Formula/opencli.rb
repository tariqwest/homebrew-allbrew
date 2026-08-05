class Opencli < Formula
  desc "Make Any Website into CLI & Use your logged-in browser by AI agent. "
  homepage "https://github.com/jackwener/opencli\#readme"
  url "https://registry.npmjs.org/@jackwener/opencli/-/opencli-1.8.6.tgz"
  sha256 "d271cf3ebab40dfd85c77d328592c8c34d6df20ff2aee9b641f984740d3c6670"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/%40jackwener%2Fopencli/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age=0"
    bin.install_symlink libexec.glob("bin/*")

    return unless OS.mac?

    mach_o = Utils.safe_popen_read(
      "/usr/bin/find", libexec.to_s, "-type", "f", "-perm", "+111", "-print0"
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
    assert_match version.to_s, shell_output("#{bin}/opencli --version")
  end
end
