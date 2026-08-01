class TurboFieldfare < Formula
  desc "Gemma 4 26B-A4B inference in ~2 GB of RAM on any M-series MacBook"
  homepage "https://github.com/drumih/turbo-fieldfare"
  license "Apache-2.0"
  url "https://api.github.com/repos/drumih/turbo-fieldfare/tarball/0.3"
  sha256 "3ee9a60f6e51abff5151527b35c5bab90829194489b7ea9212a9618c1e7128fd"
  head "https://github.com/drumih/turbo-fieldfare.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  depends_on "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/turbo-fieldfare"
  end

  service do
    run ["-", "[Local", "OpenAI-compatible", "server](docs/OPENAI_SERVER.md)"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/turbo-fieldfare --version")
  end
end
