class AtuinshAtuin < Formula
  desc "✨ Making your shell magical"
  homepage "https://atuin.sh"
  license "MIT"
  version "18.19.0"

  on_macos do
    on_arm do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-aarch64-apple-darwin.tar.gz"
      sha256 "40c8eb1fc12c0f5174fd4f20bc791310f19e58a31791f20d14d72f15661f19f1"
    end
    on_intel do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-x86_64-apple-darwin.tar.gz"
      sha256 "63bc85c87be38b8876de6935370b29978848c2b52575f4ace79e565c6a7206a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61bf95ee819d1b1ed8f2cea2333c7ca26289f4f0755df24f9ac209f2ba5d0014"
    end
    on_intel do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d7559ada42407ee8ddc62349acf134dd297568d032c45a746a7aef8a6860648"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"atuin" => "atuin"
    return unless OS.mac?

    mach_o = Utils.safe_popen_read(
      "/usr/bin/find", libexec.to_s, bin.to_s, "-type", "f", "-perm", "+111", "-print0"
    ).split("\0").reject(&:empty?).select do |path|
      Utils.safe_popen_read("/usr/bin/file", "-b", path).include?("Mach-O")
    rescue
      false
    end

    mach_o.each do |path|
      system "/usr/bin/xattr", "-cr", path
      system "/usr/bin/codesign", "--force", "--sign", "-", path
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atuin --version")
  end
end
