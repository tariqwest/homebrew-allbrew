class CommandCode < Formula
  desc "Command Code AI"
  homepage "https://commandcode.ai"
  url "https://registry.npmjs.org/command-code/-/command-code-1.4.1.tgz"
  sha256 "b0ea868c85bfba38e3e4675c60e0f71c1e1048fbcd0ac41719bd711f51369dd1"
  license "UNLICENSED"

  livecheck do
    url "https://registry.npmjs.org/command-code/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/command-code --version")
  end
end
