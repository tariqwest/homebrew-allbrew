class Codewhale < Formula
  desc "Open-source, community-driven agent harness"
  homepage "https://codewhale.net/"
  license "MIT"
  version "0.9.8"

  on_macos do
    on_arm do
      url "https://github.com/Hmbown/CodeWhale/releases/download/v#{version}/codewhale-macos-arm64"
      sha256 "5fc3f01d3c412ba00475b16e4a60695c54e5b1f11f4ef1918d5b97835f7516ad"
    end
    on_intel do
      url "https://github.com/Hmbown/CodeWhale/releases/download/v#{version}/codewhale-macos-x64"
      sha256 "61cae935b41ca4e49607969f469ca0eeb6d7983533bbe5054b7d7f5c8c44e0cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Hmbown/CodeWhale/releases/download/v#{version}/codewhale-linux-arm64"
      sha256 "af4f0c917a49056c5965addc74369cbfd6f9cd276197f028f6fd9301425c5db4"
    end
    on_intel do
      url "https://github.com/Hmbown/CodeWhale/releases/download/v#{version}/codewhale-linux-x64"
      sha256 "f3a035de438b5904e9f032d330990987bbd19843ae1cb5c1e37d8b1b782ec1ea"
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
    bin.install bin_path => "codewhale"
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
    assert_match version.to_s, shell_output("#{bin}/codewhale --version")
  end
end
