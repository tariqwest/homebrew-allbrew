class Gitnexus < Formula
  desc "Graph-powered code intelligence for AI agents"
  homepage "https://github.com/abhigyanpatwari/GitNexus\#readme"
  url "https://registry.npmjs.org/gitnexus/-/gitnexus-1.6.9.tgz"
  sha256 "43292fbeedd5b57b6259a03ac1ec24d672b5ccfeb94558ed02aec874aa825db3"
  license "PolyForm-Noncommercial-1.0.0"

  livecheck do
    url "https://registry.npmjs.org/gitnexus/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gitnexus --version")
  end
end
