class MuseCode < Formula
  include Language::Python::Virtualenv

  desc "Inference code for Llama models"
  homepage "https://github.com/meta-llama/llama"
  license "NOASSERTION"
  head "https://github.com/meta-llama/llama.git", branch: "main"

  livecheck do
    url :head
    strategy :github_latest
  end

  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", "-v", "--no-deps", "--ignore-installed", "."
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/muse-code --version")
  end
end
