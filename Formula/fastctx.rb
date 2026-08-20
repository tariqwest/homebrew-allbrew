class Fastctx < Formula
  desc "Fast, context-efficient repository tools for AI agents (MCP)"
  homepage "https://github.com/yc-duan/fastctx"
  license "Apache-2.0"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/yc-duan/fastctx/releases/download/v#{version}/fastctx-aarch64-apple-darwin.tar.gz"
      sha256 "dd862e22bb8770601c29ebcb30e5849e75aba284130dac69dc0c66a1820a1b61"
    end
    on_intel do
      url "https://github.com/yc-duan/fastctx/releases/download/v#{version}/fastctx-x86_64-apple-darwin.tar.gz"
      sha256 "09d94b4b3c161cbd83593651e6723d762d88050721bd114dc161ca8eef275d98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/yc-duan/fastctx/releases/download/v#{version}/fastctx-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3841e6f0555e5b81c368a0bec3a352d621694b133542797c1bdd38c7f259a367"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"fastctx" => "fastctx"
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
    assert_match version.to_s, shell_output("#{bin}/fastctx --version")
  end
end
