class Deepagents < Formula
  desc "The batteries included agent harness."
  homepage "https://github.com/langchain-ai/deepagentsjs\#readme"
  url "https://registry.npmjs.org/deepagents/-/deepagents-1.16.5.tgz"
  sha256 "1e4582ac29bf095dc1dab4c552e6be16a534c246b09f5fb38e7985e10d7af3dc"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/deepagents/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age=0"
    bin.install_symlink libexec.glob("bin/*").select { |f| f.file? || f.symlink? }
    return unless OS.mac?

    search_paths = [libexec.to_s].select { |d| File.directory?(d) }
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
    assert_match version.to_s, shell_output("#{bin}/deepagents --version")
  end
end
