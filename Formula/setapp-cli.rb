class SetappCli < Formula
  desc "Unofficial Setapp CLI tool. Install and manage your Setapp apps from the command line!"
  homepage "https://github.com/maximlevey/setapp-cli"
  license "MIT"
  version "2.1.0"

  on_macos do
    on_arm do
      url "https://github.com/maximlevey/setapp-cli/releases/download/v#{version}/setapp-cli-v#{version}-macos-universal.tar.gz"
      sha256 "8e29de9db98d5420468fa905ee13bc8868d0a368714253c10dcbecdbb4ac9e98"
    end
    on_intel do
      url "https://github.com/maximlevey/setapp-cli/releases/download/v#{version}/setapp-cli-v#{version}-macos-universal.tar.gz"
      sha256 "8e29de9db98d5420468fa905ee13bc8868d0a368714253c10dcbecdbb4ac9e98"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    ensure_setapp!
    libexec.install Dir["*"]
    bin.install_symlink libexec/"setapp-cli" => "setapp-cli"
  end

  def ensure_setapp!
    return if setapp_installed?

    ohai "Setapp is required — installing via Homebrew cask"
    setapp = Cask::CaskLoader.load("setapp")
    setapp.install
  end

  def setapp_installed?
    [
      Pathname.new("/Applications/Setapp.app"),
      Pathname.new(Dir.home)/"Applications"/"Setapp.app",
    ].any?(&:directory?)
  end

  def caveats
    <<~EOS
      setapp-cli requires Setapp.app. An existing install (including a direct
      download) is used when present; otherwise the setapp cask is installed.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/setapp-cli --version")
  end
end
