class Fmpy < Formula
  include Language::Python::Virtualenv

  desc "Simulate Functional Mock-up Units (FMUs) in Python"
  homepage "https://pypi.org/project/FMPy/"
  url "https://files.pythonhosted.org/packages/9c/79/5f711ff09832548ffa8ea316f0df39c415d96a1b8f7774552acfa904e04d/fmpy-0.3.30-py3-none-any.whl"
  sha256 "c2e2e4fb2b78dafcb5c9773f8946fce29f02f5d0f2c61699c249cf0fe8391f93"
  license "NOASSERTION"

  livecheck do
    url "https://pypi.org/pypi/fmpy/json"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "python@3.13"

  # Native wheels (jiter, pydantic-core, …) ship dylib IDs like
  # @rpath/foo.so. Homebrew's fix_dynamic_linkage expands those to long
  # Cellar paths that do not fit the Mach-O header. Preserve @rpath IDs.
  preserve_rpath

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/64/b4/17d4b0b2a2dc85a6df63d1157e028ed19f90d4cd97c36717afef2bc2f395/attrs-26.1.0-py3-none-any.whl"
    sha256 "c647aa4a12dfbad9333ca4e71fe62ddc36f4e63b2d260a37a8b83d2f043ac309"
  end

  resource "cmake" do
    url "https://files.pythonhosted.org/packages/50/21/9e97957b80e548f44277753f369bfcb9a997333380d5adb9f4dcf8cc6790/cmake-4.4.0-py3-none-macosx_10_10_universal2.whl"
    sha256 "3068d219f21dde2c757fc65bf6fa1f11e892ddba1a00f2bc87276529d9c95f9a"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/62/a1/3d680cbfd5f4b8f15abc1d571870c5fc3e594bb582bc3b64ea099db13e56/jinja2-3.1.6-py3-none-any.whl"
    sha256 "85ece4451f492d0c13c5dd7c13a64681a86afae63a5f347908daf103ce6d2f67"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/9c/d9/5f7756922cdd676869eca1c4e3c0cd0df60ed30199ffd775e319089cb3ed/markupsafe-3.0.3-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "116bb52f642a37c115f517494ea5feb03889e04df47eeff5b130b1808ce7c219"
  end

  resource "lark" do
    url "https://files.pythonhosted.org/packages/82/3d/14ce75ef66813643812f3093ab17e46d3a206942ce7376d31ec2d36229e7/lark-1.3.1-py3-none-any.whl"
    sha256 "c629b661023a014c37da873b4ff58a817398d12635d3bbb2c5a03be7fe5d1e12"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/a5/eb/7e6f37c5584ccbb2ff267f56fd0339016938c1c8684cfefab9b33ffc2f36/lxml-6.1.1-cp313-cp313-macosx_10_13_universal2.whl"
    sha256 "68a9198d0fc122d14bb76837de9aa80cf84caed990b5b237f532ed87d3706736"
  end

  resource "msgpack" do
    url "https://files.pythonhosted.org/packages/64/71/fbcfa83a1d6a9c6091942d1cfd070962244664b87427a9a49a6897b1b219/msgpack-1.2.1-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "491cc39455ca765fad51fb451bf2915eb2cf41192ab5801ce8d67c1d614fe056"
  end

  resource "nbformat" do
    url "https://files.pythonhosted.org/packages/a9/82/0340caa499416c78e5d8f5f05947ae4bc3cba53c9f038ab6e9ed964e22f1/nbformat-5.10.4-py3-none-any.whl"
    sha256 "3b48d6c8fbca4b299bf3982ea7db1af21580e4fec269ad087b9e81588891200b"
  end

  resource "fastjsonschema" do
    url "https://files.pythonhosted.org/packages/17/e1/62cc96341f01bdff2ba967441939178fcd1900d11ce7e6554d9954a5d7ec/fastjsonschema-2.22.1-py3-none-any.whl"
    sha256 "cf377ff5c9a6f4f3125fb35f75a2c5767bd824ffbcf62c209a93cd48d1453999"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/69/90/f63fb5873511e014207a475e2bb4e8b2e570d655b00ac19a9a0ca0a385ee/jsonschema-4.26.0-py3-none-any.whl"
    sha256 "d489f15263b8d200f8387e64b4c3a75f06629559fb73deb8fdfb525f2dab50ce"
  end

  resource "jsonschema-specifications" do
    url "https://files.pythonhosted.org/packages/41/45/1a4ed80516f02155c51f51e8cedb3c1902296743db0bbc66608a0db2814f/jsonschema_specifications-2025.9.1-py3-none-any.whl"
    sha256 "98802fee3a11ee76ecaca44429fda8a41bff98b00a0f2838151b113f210cc6fe"
  end

  resource "referencing" do
    url "https://files.pythonhosted.org/packages/2c/58/ca301544e1fa93ed4f80d724bf5b194f6e4b945841c5bfd555878eea9fcb/referencing-0.37.0-py3-none-any.whl"
    sha256 "381329a9f99628c9069361716891d34ad94af76e461dcb0335825aecc7692231"
  end

  resource "rpds-py" do
    url "https://files.pythonhosted.org/packages/f3/6b/686d9dc4359a8f163cfbbf89ee0b4e586431de22fe8248edb63a8cf50d49/rpds_py-2026.6.3-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "f4d78253f6996be4901669ad25319f842f740eccf4d58e3c7f3dd39e6dde1d8f"
  end

  resource "jupyter-core" do
    url "https://files.pythonhosted.org/packages/e7/e7/80988e32bf6f73919a113473a604f5a8f09094de312b9d52b79c2df7612b/jupyter_core-5.9.1-py3-none-any.whl"
    sha256 "ebf87fdc6073d142e114c72c9e29a9d7ca03fad818c5d300ce2adc1fb0743407"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/7d/68/d8d58938dfb1370b266a1a729e6d77a985be23689a0496498ee17b2cbf90/platformdirs-4.11.0-py3-none-any.whl"
    sha256 "360ccded2b7fce0af0ff80cc8f5942a1c5d99b0e856033acb030bfc634709e74"
  end

  resource "traitlets" do
    url "https://files.pythonhosted.org/packages/01/bd/f8607e908605262e4926cbfd2560094bc5d04ef7f8aff1340e7fff503016/traitlets-5.16.0-py3-none-any.whl"
    sha256 "94a9967ba45e89e837cf9934029c8d019bea9149cfffa115ed8c1900f679beba"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/ab/ab/ddb499fc4f8780354395face5b65c7fd107bcd6e1d667a5f07d046956f6f/numpy-2.5.1-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "30b44a6b53a7ae63c54c089a8726e5563ed302716c5b7ccc85afade40b0e7ff6"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
    # Homebrew python@3.13 venvs may inherit system site-packages. Isolate so
    # formula resources cannot resolve against /opt/homebrew/lib/python*.
    pyvenv_cfg = libexec/"pyvenv.cfg"
    if pyvenv_cfg.exist?
      lines = pyvenv_cfg.read.lines
      replaced = false
      lines.map! do |line|
        if line.start_with?("include-system-site-packages")
          replaced = true
          "include-system-site-packages = false\n"
        else
          line
        end
      end
      lines << "include-system-site-packages = false\n" unless replaced
      pyvenv_cfg.atomic_write(lines.join)
    end
    resources.each { |r| pip_install_dist(venv, r) }
    pip_install_main(venv)
  end

  def pip_install_dist(venv, dist)
    url = dist.url.to_s
    if url.include?(".whl")
      dist.fetch unless dist.downloaded?
      path = URI(url).path.to_s
      basename = File.basename(path.empty? ? url : path)
      whl = buildpath/basename
      rm_f whl
      ln_sf dist.cached_download, whl
      venv.pip_install whl
    else
      venv.pip_install dist
    end
  end

  def pip_install_main(venv)
    url = stable.url.to_s
    if url.include?(".whl")
      path = URI(url).path.to_s
      basename = File.basename(path.empty? ? url : path)
      whl = buildpath/basename
      rm_f whl
      ln_sf cached_download, whl
      venv.pip_install_and_link whl
    else
      venv.pip_install_and_link buildpath
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fmpy --version")
  end
end
