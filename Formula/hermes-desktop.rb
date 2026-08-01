class HermesDesktop < Formula
  desc "Install from https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh"
  homepage "https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh"
  url "https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh"
  sha256 "f493957fc9700b8f05470fc620efade5122595ebdba0df455a8b5ebaa0558128"

  livecheck do
    url "https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  def install
    ENV["PREFIX"] = prefix.to_s
    ENV["DESTDIR"] = prefix.to_s
    ENV["HOME"] = buildpath.to_s
    system "bash", cached_download.to_s
    bin.install Dir[buildpath/"bin/*"] if (buildpath/"bin").exist?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hermes-desktop --version")
  end
end
