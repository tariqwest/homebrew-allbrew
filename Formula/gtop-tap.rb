class GtopTap < Formula
  desc "graphic top"
  homepage "https://github.com/aksakalli/gtop\#readme"
  url "https://registry.npmjs.org/gtop/-/gtop-1.1.5.tgz"
  sha256 "a8e90b828e33160c6a0ac4fb11231f292496e8049c0dac814e46fdd0c90817c1"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/gtop/latest"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--min-release-age=0"
    bin.install_symlink libexec.glob("bin/*").select { |f| f.file? || f.symlink? }
    return unless OS.mac?

    search_dirs = [libexec].select { |d| d.respond_to?(:directory?) ? d.directory? : Dir.exist?(d.to_s) }.map(&:to_s)
    return if search_dirs.empty?

    mach_o = Utils.safe_popen_read(
      "/usr/bin/find", *search_dirs, "-type", "f", "-perm", "+111", "-print0"
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
    assert_path_exists bin/"gtop"
  end
end
