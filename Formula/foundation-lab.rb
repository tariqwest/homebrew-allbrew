class FoundationLab < Formula
  desc "A practical lab for building, testing, and evaluating apps with Apple's Foundation Models framework."
  homepage "https://github.com/rudrankriyam/Foundation-Models-Framework-Lab"
  license "MIT"
  url "https://api.github.com/repos/rudrankriyam/Foundation-Models-Framework-Lab/tarball/1.2.0"
  sha256 "4775f2c9e4bfa8f7a773a82fc717dd7a11a39eb3d39de593f21b1ad237a8435b"
  head "https://github.com/rudrankriyam/Foundation-Models-Framework-Lab.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  depends_on "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/Foundation-Models-Framework-Lab"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/Foundation-Models-Framework-Lab --version")
  end
end
