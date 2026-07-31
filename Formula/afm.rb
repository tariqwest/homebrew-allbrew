class Afm < Formula
  desc "Command-line tool for Apple's Foundation Models framework."
  homepage "https://github.com/rudrankriyam/Foundation-Models-Framework-CLI"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/rudrankriyam/Foundation-Models-Framework-CLI/releases/download/#{version}/afm_#{version}_macOS_universal"
      sha256 "476555de227aab44042874b4b928f6f0907ef65805de4ebef74d1f0fa0e0953e"
    end
    on_intel do
      url "https://github.com/rudrankriyam/Foundation-Models-Framework-CLI/releases/download/#{version}/afm_#{version}_macOS_universal"
      sha256 "476555de227aab44042874b4b928f6f0907ef65805de4ebef74d1f0fa0e0953e"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin_path = Dir["*"].find { |f| File.file?(f) && File.executable?(f) }
    bin_path ||= Dir["*"].find { |f| File.file?(f) && !f.end_with?(".txt", ".sha256", ".sig", ".asc") }
    odie "No binary found in download" unless bin_path
    bin.install bin_path => "afm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/afm --version")
  end
end
