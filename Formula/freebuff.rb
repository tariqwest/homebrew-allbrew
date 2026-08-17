class Freebuff < Formula
  desc "The free coding agent"
  homepage "https://freebuff.com"
  # allbrew: using prerelease tag v1.0.420-beta.185 (no stable GitHub /releases/latest)
  license "Apache-2.0"
  version "1.0.420-beta.185"

  on_macos do
    on_arm do
      url "https://github.com/CodebuffAI/freebuff/releases/download/v#{version}/codecane-darwin-arm64.tar.gz"
      sha256 "888639299ecfb3b27f70892c83b3d7a4079efa80929a2cf0b3e5c7cc084d354e"
    end
    on_intel do
      url "https://github.com/CodebuffAI/freebuff/releases/download/v#{version}/codecane-darwin-x64.tar.gz"
      sha256 "95a8cf2b8e4835e532aa4bc041135cc18905e9e2bd483f2d25bacb2b299f4b0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CodebuffAI/freebuff/releases/download/v#{version}/codecane-linux-arm64.tar.gz"
      sha256 "1ca9ce66bb987c3a0be9e0d2d0786be1829826a7773157ab73cf950a6a695c60"
    end
    on_intel do
      url "https://github.com/CodebuffAI/freebuff/releases/download/v#{version}/codecane-linux-x64.tar.gz"
      sha256 "40132392657a509aa5fdde253c7fc79162065db8e28a5af7c79b8a239d04bf54"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"codecane" => "freebuff"
    bin.install_symlink libexec/"codecane" => "codecane"
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
    assert_match version.to_s, shell_output("#{bin}/freebuff --version")
  end
end
