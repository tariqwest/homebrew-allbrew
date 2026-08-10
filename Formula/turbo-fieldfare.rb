class TurboFieldfare < Formula
  desc "Gemma 4 26B-A4B inference in ~2 GB of RAM on any M-series MacBook"
  homepage "https://github.com/drumih/turbo-fieldfare"
  license "Apache-2.0"
  url "https://api.github.com/repos/drumih/turbo-fieldfare/tarball/0.4.1"
  sha256 "99fb9d4f21cc3caa0f944fc3cc5f971ffccf7c8b3397103812a70d14a120a5cd"
  head "https://github.com/drumih/turbo-fieldfare.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  depends_on "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/TurboFieldfareCLI", ".build/release/TurboFieldfareRepack", ".build/release/TurboFieldfareMac", ".build/release/TurboFieldfareDecodeService", ".build/release/TurboFieldfareServer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/TurboFieldfareCLI --version")
  end
end
