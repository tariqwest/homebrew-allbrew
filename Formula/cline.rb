class Cline < Formula
  desc "Autonomous coding agent as an SDK, IDE extension, or CLI assistant."
  homepage "https://cline.bot"
  url "https://registry.npmjs.org/cline/-/cline-3.0.46.tgz"
  sha256 "204b57a67239be217cb26410c1c94940263ccb5402886f61bdc591aa0fc3de04"
  license "Apache-2.0"

  livecheck do
    url "https://registry.npmjs.org/cline/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cline --version")
  end
end
