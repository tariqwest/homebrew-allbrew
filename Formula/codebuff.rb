class Codebuff < Formula
  desc "AI coding agent"
  homepage "https://codebuff.com"
  url "https://registry.npmjs.org/codebuff/-/codebuff-1.0.684.tgz"
  sha256 "d408c16a629e98fb649da052c6c5f267fbc7aecb0959c381189ede75998107b3"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/codebuff/latest"
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
    assert_match version.to_s, shell_output("#{bin}/codebuff --version")
  end
end
