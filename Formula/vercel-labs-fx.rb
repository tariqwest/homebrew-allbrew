class VercelLabsFx < Formula
  desc "Unix like coding agent"
  homepage "https://fx.sh"
  license "Apache-2.0"
  version "0.0.16"

  on_macos do
    on_arm do
      url "https://github.com/vercel-labs/fx/releases/download/v#{version}/fx-macos-aarch64.tar.gz"
      sha256 "2158a8d42e77457a774400d225d9802bb6c0e60a0bb0674a1116bc31252490d6"
    end
    on_intel do
      url "https://github.com/vercel-labs/fx/releases/download/v#{version}/fx-macos-x86_64.tar.gz"
      sha256 "b287974f97a0879f50b4439c46537fcd44b83326c11a230d87f596073f8d8d9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/vercel-labs/fx/releases/download/v#{version}/fx-linux-aarch64.tar.gz"
      sha256 "ca9441b104357e2105039dbfd4c2eaf0d6ee65a84085f23f51e880c95cbf46af"
    end
    on_intel do
      url "https://github.com/vercel-labs/fx/releases/download/v#{version}/fx-linux-x86_64.tar.gz"
      sha256 "f0fb822c7be546c80bcc89d50521bc1454435e0c6f586e8420c4e2b84fa80599"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"fx" => "vercel-labs-fx"
    bin.install_symlink libexec/"fx" => "fx"
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
    assert_match version.to_s, shell_output("#{bin}/vercel-labs-fx --version")
  end
end
