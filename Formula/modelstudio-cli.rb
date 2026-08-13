class ModelstudioCli < Formula
  desc "Official Model Studio CLI（阿里云百炼 CLI）built for AI Agent frameworks, exposing models, search, multimodal, and workflow capabilities as structured tool calls."
  homepage "https://bailian.console.aliyun.com/cli"
  license "Apache-2.0"
  version "1.14.3"

  on_macos do
    on_arm do
      url "https://github.com/modelstudioai/cli/releases/download/v#{version}/bl-#{version}-darwin-arm64.zip"
      sha256 "1b324b0c5e0e34bdbfda7196855c9dffcd41ae7af90d7cfe4e85634a6e87a38d"
    end
    on_intel do
      url "https://github.com/modelstudioai/cli/releases/download/v#{version}/bl-#{version}-darwin-x64.zip"
      sha256 "2a1631b7e27c54506aa0c229219a3a15756c9e8da9578b9a7aa9a6ccf532750e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/modelstudioai/cli/releases/download/v#{version}/bl-#{version}-linux-x64.zip"
      sha256 "12d338ac5358deba942526d13c7b4757039fd70064c40094d04fcc5c4cf9025b"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bl-1.14.3-darwin-arm64" => "bl"
    bin.install_symlink libexec/"bl-1.14.3-darwin-arm64" => "bl-1.14.3-darwin-arm64"
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
    assert_match version.to_s, shell_output("#{bin}/bl --version")
  end
end
