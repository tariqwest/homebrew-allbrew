class Cline < Formula
  desc "Autonomous coding agent as an SDK, IDE extension, or CLI assistant."
  homepage "https://cline.bot"
  url "https://registry.npmjs.org/cline/-/cline-3.0.48.tgz"
  sha256 "bfc5f7391d9923e4121e55edf8f80d5f96a6a1abd7299321b75aba796c51c6f8"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/cline/latest"
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
    assert_match version.to_s, shell_output("#{bin}/cline --version")
  end
end
