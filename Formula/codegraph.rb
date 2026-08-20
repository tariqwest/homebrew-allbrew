class Codegraph < Formula
  desc "Pre-indexed code knowledge graph, auto syncs on code changes, for Claude Code, Codex, Gemini, Cursor, OpenCode, AntiGravity, Kiro, and Hermes Agent — fewer tokens, fewer tool calls, 100% local"
  homepage "https://colbymchenry.github.io/codegraph/"
  license "MIT"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/colbymchenry/codegraph/releases/download/v#{version}/codegraph-darwin-arm64.tar.gz"
      sha256 "cf5ee435a6e44d097b2f98f2b7b8b9422bb1094844404efed82519c5da1af2cf"
    end
    on_intel do
      url "https://github.com/colbymchenry/codegraph/releases/download/v#{version}/codegraph-darwin-x64.tar.gz"
      sha256 "0a0ccc29bf7da9d10be1458d89d7e15c55927ae24cd95e9fa3de4bdfea059dde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/colbymchenry/codegraph/releases/download/v#{version}/codegraph-linux-arm64.tar.gz"
      sha256 "9f17750aedf45d51f68caae39ed21d6e2a7290b2326e5c53f95a165918ebd1d8"
    end
    on_intel do
      url "https://github.com/colbymchenry/codegraph/releases/download/v#{version}/codegraph-linux-x64.tar.gz"
      sha256 "2ba65e87a1210b706bb1e67d5e48b5fc4a1935e43dbb3fb5f31c5597840d2e58"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/codegraph" => "codegraph"
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
    assert_match version.to_s, shell_output("#{bin}/codegraph --version")
  end
end
