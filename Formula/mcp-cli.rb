class McpCli < Formula
  desc "Lighweight CLI to interact with MCP servers"
  homepage "https://github.com/philschmid/mcp-cli"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/philschmid/mcp-cli/releases/download/v#{version}/mcp-cli-darwin-arm64"
      sha256 "be991df0a125e1cf9a022fe6ffce236605522fd1382435ce58ffdf9aba6642f2"
    end
    on_intel do
      url "https://github.com/philschmid/mcp-cli/releases/download/v#{version}/mcp-cli-darwin-x64"
      sha256 "f0e890a666268335005bbba199253ff8f6e6afae76d0adf34fbda708b26acc2e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/philschmid/mcp-cli/releases/download/v#{version}/mcp-cli-linux-x64"
      sha256 "76772f290edaa856cbec967d12c33cb9bf49cff014f55a30d04245cf8970817c"
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
    bin.install bin_path => "mcp-cli"
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
    assert_match version.to_s, shell_output("#{bin}/mcp-cli --version")
  end
end
