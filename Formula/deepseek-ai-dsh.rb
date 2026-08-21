class DeepseekAiDsh < Formula
  desc "dsh CLI: profile boot, plugin management, and the browser UI alias"
  homepage "https://github.com/deepseek-ai/deepseek-harness\#readme"
  url "https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-0.1.1-rc.1.tgz"
  sha256 "c58c1e358419c8907cbb6adb43065c3c1e824042489ab0ad917e95e0a0418056"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/%40deepseek-ai%2Fdsh/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age=0"
    bin.install_symlink libexec.glob("bin/*")
    return unless OS.mac?

    search_paths = [libexec.to_s].select { |d| File.directory?(d) }
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
    assert_match version.to_s, shell_output("#{bin}/dsh --version")
  end
end
