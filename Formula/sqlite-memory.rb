class SqliteMemory < Formula
  desc "Markdown based AI agent memory with semantic search, hybrid retrieval, and offline-first sync between agents."
  homepage "https://sqlite.ai"
  license "Apache-2.0"
  version "1.3.6"

  on_macos do
    on_arm do
      url "https://github.com/sqliteai/sqlite-memory/releases/download/#{version}/memory-macos-full-#{version}.tar.gz"
      sha256 "a6ac0c4a2e02db995923c9c64bfbee108e4317188ad002be96791ad93e731e15"
    end
    on_intel do
      url "https://github.com/sqliteai/sqlite-memory/releases/download/#{version}/memory-macos-full-#{version}.tar.gz"
      sha256 "a6ac0c4a2e02db995923c9c64bfbee108e4317188ad002be96791ad93e731e15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sqliteai/sqlite-memory/releases/download/#{version}/memory-linux-arm64-full-#{version}.tar.gz"
      sha256 "4a2cffd80e5d9a32c3210654b6a1a49701a3cdabc113bad9b71dac2a2fc6c19c"
    end
    on_intel do
      url "https://github.com/sqliteai/sqlite-memory/releases/download/#{version}/memory-linux-musl-x86_64-full-#{version}.tar.gz"
      sha256 "871736a92b61c8f8792577998a507ea18b174be4835bbaaf1ea06c313d75e451"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "sqlite-memory"
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
    assert_match version.to_s, shell_output("#{bin}/sqlite-memory --version")
  end
end
