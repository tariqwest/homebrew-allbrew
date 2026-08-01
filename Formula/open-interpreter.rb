class OpenInterpreter < Formula
  desc "A coding agent for open models like Kimi K3"
  homepage "http://openinterpreter.com/"
  license "Apache-2.0"
  version "0.0.34"

  on_macos do
    on_arm do
      url "https://github.com/openinterpreter/openinterpreter/releases/download/rust-v#{version}/open-interpreter-package-aarch64-apple-darwin.tar.gz"
      sha256 "78f1b18e1fa1cdb72938dc78c9f6c0204bccfce1e1f0c969fb83df6789dbd411"
    end
    on_intel do
      url "https://github.com/openinterpreter/openinterpreter/releases/download/rust-v#{version}/open-interpreter-package-x86_64-apple-darwin.tar.gz"
      sha256 "1d1909e50c93c343f5b039ce50149857e372c6f0db222a8d70c78af1b679a715"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/openinterpreter/openinterpreter/releases/download/rust-v#{version}/open-interpreter-package-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1619f274522a08b550a572ee818697e46f04d58cac4b1177fc03c933c7b1e0e3"
    end
    on_intel do
      url "https://github.com/openinterpreter/openinterpreter/releases/download/rust-v#{version}/open-interpreter-package-x86_64-unknown-linux-musl.tar.gz"
      sha256 "267c8a71df020cab3adffd5cc8121a8e525549f6f95a916b093e19e1c2252b8f"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/interpreter" => "open-interpreter"
    bin.install_symlink libexec/"bin/interpreter" => "interpreter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/open-interpreter --version")
  end
end
