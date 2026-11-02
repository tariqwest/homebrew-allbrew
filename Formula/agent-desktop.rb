class AgentDesktop < Formula
  desc "Agent Desktop gives any agent reliable computer use on the desktop. Built with Rust, it sees any app's real UI structure through OS accessibility trees and operates it — refs stay stable and actions stay safe to retry, instead of guessing from pixels."
  homepage "https://agent-browser.dev/desktop"
  license "Apache-2.0"
  version "1.0.2"

  on_macos do
    on_arm do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7bee385196d7b478de80cf05ca4304aaa38f0eba593b3406ad3c247c1773be19"
    end
    on_intel do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8edda6df17eafc042395502a823dbb8415bc8ac14835a6731e4d8becc9cb4121"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "864cb782e0afc8bf0df19622016b24bdbd1a83fc7749f784ee82aa49a7f845eb"
    end
    on_intel do
      url "https://github.com/vercel-labs/agent-desktop/releases/download/v#{version}/agent-desktop-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad661b7a3fd8f990a769243f4889a240ca0e2c8dab3ef5bddd6019086c71e0b4"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"agent-desktop" => "agent-desktop"
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
