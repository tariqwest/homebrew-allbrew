class AuthsecBridge < Formula
  include Language::Python::Virtualenv

  desc "Install authsec-bridge"
  homepage "https://github.com/authsec-ai/authsec-bridge"
  head "https://github.com/authsec-ai/authsec-bridge.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install_and_link(buildpath)
    primary = Dir[libexec/"bin/*"].max_by { |p| File.basename(p).length }
    bin.install_symlink primary => name if primary
  end

  test do
    assert_match /usage|Usage/i, shell_output("#{bin}/authsec-bridge --help")
  end
end
