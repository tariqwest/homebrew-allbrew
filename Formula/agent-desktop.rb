class AgentDesktop < Formula
  desc "Agent Desktop gives any agent reliable computer use on the desktop. Built with Rust, it sees any app's real UI structure through OS accessibility trees and operates it — refs stay stable and actions stay safe to retry, instead of guessing from pixels."
  homepage "https://agent-browser.dev/desktop"
  license "Apache-2.0"
  version "1.0.2"

  on_macos do
    on_arm do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "495a76b557650af4191d3d23bdf1313489bd42eb622c52b7bf0c1ea6de7e69b4"
    end
    on_intel do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "182c984d03d919580a554f3d449adf21ae8a473bdee511cb70729b8c03a8cfb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "236273ae211ca8d5c77a597b44ff1460856d8e4cd1300776859952476bb76332"
    end
    on_intel do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4f57bb0a8e86c96b2e3dff96c2875d56cb737dc2dccc177784cf520eefa6310"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"SHA256SUMS" => "agent-desktop"
    bin.install_symlink libexec/"SHA256SUMS" => "SHA256SUMS"
    return unless OS.mac?

    search_paths = [libexec.to_s, bin.to_s].select { |d| File.directory?(d) }
    return if search_paths.empty?

    mach_o = Utils.safe_popen_read(
      "/usr/bin/find", *search_paths, "-type", "f", "-perm", "+111", "-print0"
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
    assert_match version.to_s, shell_output("#{bin}/agent-desktop --version")
  end
end
