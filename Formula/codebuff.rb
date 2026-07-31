class Codebuff < Formula
  desc "AI coding agent"
  homepage "https://freebuff.com"
  url "https://registry.npmjs.org/freebuff/-/freebuff-0.0.134.tgz"
  sha256 "35c393576cd71eef2d09c522411becf0725e7fba034b2781b903196bc2aaf64f"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/freebuff/latest"
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

  service do
    run "Run"
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/freebuff --version")
  end
end
