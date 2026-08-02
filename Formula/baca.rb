class Baca < Formula
  include Language::Python::Virtualenv

  desc "TUI Ebook Reader"
  homepage "https://pypi.org/project/baca/"
  url "https://files.pythonhosted.org/packages/bf/3f/0713b3f4e14ad4831235b4c65f9a815a22f897ca42db7528c6dcf236227f/baca-0.1.17-py3-none-any.whl"
  sha256 "8a8da0848794bd03cab69a19051cfae8c9400be7dbcbedee0e3d96c5201494e7"
  license "GPL-3.0-only"

  livecheck do
    url "https://pypi.org/pypi/baca/json"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "python@3.13"

  # Native wheels (jiter, pydantic-core, …) ship dylib IDs like
  # @rpath/foo.so. Homebrew's fix_dynamic_linkage expands those to long
  # Cellar paths that do not fit the Mach-O header. Preserve @rpath IDs.
  preserve_rpath

  resource "textual" do
    url "https://files.pythonhosted.org/packages/ae/50/03f7de49c64cfbe32932548321015dec11ecaed0fed6744f4aa359a25202/textual-0.16.0-py3-none-any.whl"
    sha256 "27955f8c5dc0244892d372aad656287abb08b7457dc8ad60df02e367472b0fb6"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/82/3b/64d4899d73f91ba49a8c18a8ff3f0ea8f1c1d75481760df8c68ef5235bf5/rich-15.0.0-py3-none-any.whl"
    sha256 "33bd4ef74232fb73fe9279a257718407f169c09b78a87ad3d296f548e27de0bb"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/b3/81/4da04ced5a082363ecfa159c010d200ecbd959ae410c10c0264a38cac0f5/markdown_it_py-4.2.0-py3-none-any.whl"
    sha256 "9f7ebbcd14fe59494226453aed97c1070d83f8d24b6fc3a3bcf9a38092641c4a"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/b3/38/89ba8ad64ae25be8de66a6d463314cf1eb366222074cfda9ee839c56a4b4/mdurl-0.1.2-py3-none-any.whl"
    sha256 "84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/f4/7e/a72dd26f3b0f4f2bf1dd8923c85f7ceb43172af56d63c7383eb62b332364/pygments-2.20.0-py3-none-any.whl"
    sha256 "81a9e26dd42fd28a23a2d169d86d7ac03b46e2f8b59ed4698fb4785f946d0176"
  end

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/b4/de/88b3be5c31b22333b3ca2f6ff1de4e863d8fe45aaea7485f591970ec1d3e/linkify_it_py-2.1.0-py3-none-any.whl"
    sha256 "0d252c1594ecba2ecedc444053db5d3a9b7ec1b0dd929c8f1d74dce89f86c05e"
  end

  resource "uc-micro-py" do
    url "https://files.pythonhosted.org/packages/61/73/d21edf5b204d1467e06500080a50f79d49ef2b997c79123a536d4a17d97c/uc_micro_py-2.0.0-py3-none-any.whl"
    sha256 "3603a3859af53e5a39bc7677713c78ea6589ff188d70f4fee165db88e22b242c"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/a5/69/6da5581c6a7fede7dc261bf4e67d6adca4196f176b43288b55b3db395b6e/mdit_py_plugins-0.6.1-py3-none-any.whl"
    sha256 "214c82fb2ac524472ab6a5bcab1de80f73b50443e187f401bfd77efbc7c6481d"
  end

  resource "importlib-metadata" do
    url "https://files.pythonhosted.org/packages/d0/98/c277899f5aa21f6e6946e1c83f2af650cbfee982763ffb91db07ff7d3a13/importlib_metadata-4.13.0-py3-none-any.whl"
    sha256 "8a8a81bcf996e74fee46f0d16bd3eaa382a7eb20fd82445c3ad11f4090334116"
  end

  resource "zipp" do
    url "https://files.pythonhosted.org/packages/3a/13/547360d81e6d88d58492968ffda9f9542854f11310ee556fef14260cc886/zipp-4.1.0-py3-none-any.whl"
    sha256 "25ad4e16390cd314347dd8f1de67a2ac538ae658ed4ab9db16029c07c188e97f"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/49/d3/b8441a820a491ddfc024b0b0cf0393375b75ea13866d9c66727e54c2fc80/typing_extensions-4.16.0-py3-none-any.whl"
    sha256 "481caa481374e813c1b176ada14e97f1f67a4539ce9cfeb3f350d78d6370c2e8"
  end

  resource "mkdocs-exclude" do
    url "https://files.pythonhosted.org/packages/54/b5/3a8e289282c9e8d7003f8a2f53d673d4fdaa81d493dc6966092d9985b6fc/mkdocs-exclude-1.0.2.tar.gz"
    sha256 "ba6fab3c80ddbe3fd31d3e579861fd3124513708271180a5f81846da8c7e2a51"
  end

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/88/c6/92fcd42f1ba33e1184263f25bfabf3d27c383410470f169e4b8163bf9c17/beautifulsoup4-4.15.0-py3-none-any.whl"
    sha256 "d6f88de62e1d4e38ecb1077eb9724cd0eff29d2a08ca16a401e9b9e93f117cf9"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/0f/2c/437fe806897c2d6cfdc3ee43a18da8bf8e568530a4ae9bac781541ca9896/soupsieve-2.9.1-py3-none-any.whl"
    sha256 "4f4477399246b7a0c720a88ca2454b11cd6bb9ae4c9d170140786e916776c14c"
  end

  resource "markdownify" do
    url "https://files.pythonhosted.org/packages/d3/06/015371318ac726442672e1b570f5199cb861a5762e7d288af92d8e357327/markdownify-0.11.6-py3-none-any.whl"
    sha256 "ba35fe289d5e9073bcd7d2cad629278fe25f1a93741fcdc0bfb4f009076d8324"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/b7/ce/149a00dd41f10bc29e5921b496af8b574d8413afcd5e30dfa0ed46c2cc5e/six-1.17.0-py2.py3-none-any.whl"
    sha256 "4721f391ed90541fddacab5acf947aa0d3dc7d27b2e1e8eda2be8970586c3274"
  end

  resource "appdirs" do
    url "https://files.pythonhosted.org/packages/3b/00/2344469e2084fb287c2e0b57b72910309874c3245463acd6cf5e3db69324/appdirs-1.4.4-py2.py3-none-any.whl"
    sha256 "a841dacd6b99318a741b166adb07e19ee71a274450e68237b4650ca1055ab128"
  end

  resource "peewee" do
    url "https://files.pythonhosted.org/packages/1a/41/19c65578ef9a54b3083253c68a607f099642747168fe00f3a2bceb7c3a34/peewee-3.19.0-py3-none-any.whl"
    sha256 "de220b94766e6008c466e00ce4ba5299b9a832117d9eb36d45d0062f3cfd7417"
  end

  resource "fuzzywuzzy" do
    url "https://files.pythonhosted.org/packages/43/ff/74f23998ad2f93b945c0309f825be92e04e0348e062026998b5eefef4c33/fuzzywuzzy-0.18.0-py2.py3-none-any.whl"
    sha256 "928244b28db720d1e0ee7587acf660ea49d7e4c632569cad4f1cd7e68a5f0993"
  end

  resource "climage" do
    url "https://files.pythonhosted.org/packages/84/d4/6080fb8fdba671ac2e8b542746c0ea7039eb288459a648fa3be3cf2e7b20/climage-0.2.2-py3-none-any.whl"
    sha256 "0a820c7e9c51aa0f720dd3039247848db3c42ebf62475407ec33442e7919b6ab"
  end

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/10/76/8803c13605b763d33d156c4678fc77f8443389c0c51c8aef707bb02015f4/pillow-12.3.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "d69141514cc30b774ceea5e3ed3a6635c8d8a96edf664689b890f4089111fb35"
  end

  resource "kdtree" do
    url "https://files.pythonhosted.org/packages/00/3d/bd727d025b1706798aae14da3f69fc7d5a8639dc9e0eba37c7dcd43eb03e/kdtree-0.16-py2.py3-none-any.whl"
    sha256 "083945db69bc3cf0d349d8d0efe66c056de28d1c2f1e81f762dc5ce46f0dcf0a"
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
    assert_match version.to_s, shell_output("#{bin}/baca --version")
  end
end
