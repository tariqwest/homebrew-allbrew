class TraeAgent < Formula
  desc "Trae Agent is an LLM-based agent for general purpose software engineering tasks."
  homepage "https://www.trae.ai/"
  license "MIT"
  head "https://github.com/bytedance/trae-agent.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trae-agent --version")
  end
end
