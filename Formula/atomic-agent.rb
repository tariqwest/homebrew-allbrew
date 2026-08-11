class AtomicAgent < Formula
  desc "Local First Ai Agent. Optimized for Local Ai models. Long context window. Proper tools callings. Runs privately on your device."
  homepage "https://atomicagent.io"
  license "MIT"
  version "0.1.72"

  on_macos do
    on_arm do
      url "https://github.com/AtomicBot-ai/atomic-agent/releases/download/v#{version}/atomic-agent-darwin-arm64.tar.gz"
      sha256 "c2ab437ed9ef113644d05226b37dda681ca01a7fda19a5af0ce7bd09eb4f606a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AtomicBot-ai/atomic-agent/releases/download/v#{version}/atomic-agent-linux-arm64.tar.gz"
      sha256 "63720575175dd13d4040005b39b9de121ad78568fce4eac7953d4d01d1cbc43b"
    end
    on_intel do
      url "https://github.com/AtomicBot-ai/atomic-agent/releases/download/v#{version}/atomic-agent-linux-x64.tar.gz"
      sha256 "93cc790b7e1d9f0da30d8e5c645322c70544cff60b1d1161aa2072981f18e471"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"atomic-agent" => "atomic-agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atomic-agent --version")
  end
end
