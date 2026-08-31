class Hister < Formula
  desc "Your own search engine"
  homepage "https://hister.org/"
  license "AGPL-3.0"
  version "0.18.0"

  on_macos do
    on_arm do
      url "https://github.com/asciimoo/hister/releases/download/v#{version}/hister_#{version}_darwin_arm64"
      sha256 "ec8e6d9a4bf7e85ee03702a12f992d4b57f20d7ce21d1046b12a8489f2b38386"
    end
    on_intel do
      url "https://github.com/asciimoo/hister/releases/download/v#{version}/hister_#{version}_darwin_amd64"
      sha256 "fc5c2245f415f516a75e49345732cc7df4a317175a13213e40a1ef98abbca64c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/asciimoo/hister/releases/download/v#{version}/hister_#{version}_linux_arm64"
      sha256 "71f11f4c711fcc4ecd2dc320545d12cafccd7d5f33734686cf1d85ba56fbc902"
    end
    on_intel do
      url "https://github.com/asciimoo/hister/releases/download/v#{version}/hister_#{version}_linux_amd64"
      sha256 "c9d7c0fbab4b7fe52b12f971e8e6a3e2e99b4b2642def03d6027dd4803f5c1aa"
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
    bin.install bin_path => "hister"
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

  service do
    run [opt_bin/"hister", "listen"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hister --version")
  end
end
