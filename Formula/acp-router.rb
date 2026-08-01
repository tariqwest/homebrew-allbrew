class AcpRouter < Formula
  desc "Install acp-router"
  homepage "https://github.com/nulrouter/acp-router"
  license "MIT"
  head "https://github.com/nulrouter/acp-router.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acp-router --version")
  end
end
