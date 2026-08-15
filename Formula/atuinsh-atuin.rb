class AtuinshAtuin < Formula
  desc "✨ Making your shell magical"
  homepage "https://atuin.sh"
  license "MIT"
  version "18.19.0"

  on_macos do
    on_arm do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-server-aarch64-apple-darwin.tar.gz"
      sha256 "44a5974b87c35dc9f7c254541a7e8a307e35fbd25597aabe0bfd3887332b313c"
    end
    on_intel do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-x86_64-apple-darwin.tar.gz"
      sha256 "63bc85c87be38b8876de6935370b29978848c2b52575f4ace79e565c6a7206a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-server-aarch64-unknown-linux-musl.tar.gz"
      sha256 "77be07949b97f30e450cf0c81789a5f7cf2554fdb96a917ff122a9a93ffa5d1c"
    end
    on_intel do
      url "https://github.com/atuinsh/atuin/releases/download/v#{version}/atuin-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a2cd1f7bba0e45cf620683833a6414b9dd74a0c446e4d819258b6717109bc0fd"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"atuin-server" => "atuin"
    bin.install_symlink libexec/"atuin-server" => "atuin-server"
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
