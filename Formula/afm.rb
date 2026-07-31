class Afm < Formula
  desc "Command-line tool for Apple's Foundation Models framework."
  homepage "https://github.com/rudrankriyam/Foundation-Models-Framework-CLI"
  license "MIT"
  url "https://api.github.com/repos/rudrankriyam/Foundation-Models-Framework-CLI/tarball/0.1.0"
  sha256 "ecd3c98040807965cc7b724211e021ee759ace7091bb8c611eef619a87388254"
  head "https://github.com/rudrankriyam/Foundation-Models-Framework-CLI.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  service do
    run [opt_bin/"afm", "serve"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afm --version")
  end
end
