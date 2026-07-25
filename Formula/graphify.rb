class Graphify < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant skill that turns any folder of code, docs, papers, or images into a queryable knowledge graph"
  homepage "https://pypi.org/project/graphifyy/"
  url "https://files.pythonhosted.org/packages/13/67/3650dccac4feb5353d554a08f3ce7580aeda99d2d9324d267b24d002c757/graphifyy-0.9.26-py3-none-any.whl"
  sha256 "2184c5891b71f6b9cea127eb0e92fdd33ab8ee5c254c99312227fc6c5af3ada5"

  livecheck do
    url "https://pypi.org/pypi/graphifyy/json"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "python@3.13"

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/9e/c9/b2622292ea83fbb4ec318f5b9ab867d0a28ab43c5717bb85b0a5f6b3b0a4/networkx-3.6.1-py3-none-any.whl"
    sha256 "d47fbf302e7d9cbbb9e2555a0d267983d2aa476bac30e90dfbe5669bd57f3762"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/ab/ab/ddb499fc4f8780354395face5b65c7fd107bcd6e1d667a5f07d046956f6f/numpy-2.5.1-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "30b44a6b53a7ae63c54c089a8726e5563ed302716c5b7ccc85afade40b0e7ff6"
  end

  resource "rapidfuzz" do
    url "https://files.pythonhosted.org/packages/ea/59/b2afd98e41af9cd54554a4c1c423d84cdd60e6b1c0a09496f033b55f60ec/rapidfuzz-3.14.5-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "6737b35d5af7479c5bf9710f7b17edd9d2c43128d974d25fb4ea653e42c64609"
  end

  resource "tree-sitter" do
    url "https://files.pythonhosted.org/packages/a1/ec/19d093e854b45e807fecfdd26105c266f43aeecc39c4dc97992a7074ad5a/tree_sitter-0.26.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "6189c6c340c7384357711e3d92645e96bfb79f7a502f86de1ebdb23eb43f7dab"
  end

  resource "tree-sitter-python" do
    url "https://files.pythonhosted.org/packages/e6/1d/60d8c2a0cc63d6ec4ba4e99ce61b802d2e39ef9db799bdf2a8f932a6cd4b/tree_sitter_python-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "480c21dbd995b7fe44813e741d71fed10ba695e7caab627fb034e3828469d762"
  end

  resource "tree-sitter-javascript" do
    url "https://files.pythonhosted.org/packages/b1/8f/6b4b2bc90d8ab3955856ce852cc9d1e82c81d7ab9646385f0e75ffd5b5d3/tree_sitter_javascript-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "8264a996b8845cfce06965152a013b5d9cbb7d199bc3503e12b5682e62bb1de1"
  end

  resource "tree-sitter-typescript" do
    url "https://files.pythonhosted.org/packages/8f/2f/1f36fda564518d84593f2740d5905ac127d590baf5c5753cef2a88a89c15/tree_sitter_typescript-0.23.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "c7cc1b0ff5d91bac863b0e38b1578d5505e718156c9db577c8baea2557f66de8"
  end

  resource "tree-sitter-go" do
    url "https://files.pythonhosted.org/packages/32/16/dd4cb124b35e99239ab3624225da07d4cb8da4d8564ed81d03fcb3a6ba9f/tree_sitter_go-0.25.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "503b81a2b4c31e302869a1de3a352ad0912ccab3df9ac9950197b0a9ceeabd8f"
  end

  resource "tree-sitter-rust" do
    url "https://files.pythonhosted.org/packages/78/2a/cf39f881a545360b5a86bb1accba1f4acc713daab01fb9edd35b6e84f473/tree_sitter_rust-0.24.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "01a46622735498493f29f3e628a90de95c96a07bfbeb88996243eb986b1cee36"
  end

  resource "tree-sitter-java" do
    url "https://files.pythonhosted.org/packages/57/ef/6406b444e2a93bc72a04e802f4107e9ecf04b8de4a5528830726d210599c/tree_sitter_java-0.23.5-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "24acd59c4720dedad80d548fe4237e43ef2b7a4e94c8549b0ca6e4c4d7bf6e69"
  end

  resource "tree-sitter-groovy" do
    url "https://files.pythonhosted.org/packages/26/17/a1fbf1fb2b13a3bdb1bc5d57cde77aaaa64f005eb25cacff50bf21148719/tree_sitter_groovy-0.1.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "db35a5bdceb826382c7f52d33db0b2075217473f698daf77eb8d4e557a161d51"
  end

  resource "tree-sitter-c" do
    url "https://files.pythonhosted.org/packages/c1/1c/1140db75e7e375cda3c68792a33826c4fd40b5b98c3259d93c75f6c8368f/tree_sitter_c-0.24.2-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "97bc80a224d48215d4e6e6376bf30d114f4c317b8145ff1b02afe785d4ba7bdd"
  end

  resource "tree-sitter-cpp" do
    url "https://files.pythonhosted.org/packages/12/1c/0337c016bdc00a77a3326d12f10ee836401dd28f27db6fd5b7734bfb21ed/tree_sitter_cpp-0.23.4-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "bc3c404d9f0cbd87951213a85440afbf4c31e718f8d907fa9ee12bea4b8d276f"
  end

  resource "tree-sitter-ruby" do
    url "https://files.pythonhosted.org/packages/e7/38/c41ecf7692b8ecccd26861d3293a88150a4a52fc081abe60f837030d7315/tree_sitter_ruby-0.23.1-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "aa4ee7433bd42fac22e2dad4a3c0f332292ecf482e610316828c711a0bb7f794"
  end

  resource "tree-sitter-c-sharp" do
    url "https://files.pythonhosted.org/packages/c8/13/593c8603f834eaf15082b81e079289fc9f062b4c0ab5b9489134084eec06/tree_sitter_c_sharp-0.23.5-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "a75994a11f6fed3f5b8c36ad6a00e5dc43205bd912c43af3a2a54fdf649664eb"
  end

  resource "tree-sitter-kotlin" do
    url "https://files.pythonhosted.org/packages/7d/20/66105b6e94d062440955d374e64d030c3173cf4f592f6a6a3c426b3c94d0/tree_sitter_kotlin-1.1.0-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "910b41a580dae00d319e555075f3886a41386d1067931b14c7de504eeae3ae2a"
  end

  resource "tree-sitter-scala" do
    url "https://files.pythonhosted.org/packages/cc/8a/87fbf40fc87bcb61c06860e95a75b425d5678eda786dea6ae46616e04f07/tree_sitter_scala-0.26.0-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "7829245c660902148d06e6c9e36255d60b0feb47974c87a1d09dd2cbdbba12c8"
  end

  resource "tree-sitter-php" do
    url "https://files.pythonhosted.org/packages/ab/5e/b52f2599acb29f6899470f7137d3d491c752b88df3950fb7408aea57ddca/tree_sitter_php-0.24.1-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "29759c67d4c27a68c227ed82c0b7e4699617b1bd23757d50c081f81a12b4f80d"
  end

  resource "tree-sitter-swift" do
    url "https://files.pythonhosted.org/packages/5d/37/84e2bc7826eb9007c531f47e5557461c5a48fd14bd3ea82424afa3d06b5f/tree_sitter_swift-0.7.3-cp38-abi3-macosx_11_0_arm64.whl"
    sha256 "ee627e027d0868c552beca13dcdfa9944662b126f642464c5038ee3204e68340"
  end

  resource "tree-sitter-lua" do
    url "https://files.pythonhosted.org/packages/de/0c/6bc3228d01419e8b5af664bf328d174b02a64736ffa23a335c778c8cda68/tree_sitter_lua-0.5.0-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "c14714ad395c4166566f3e4dd0cc0979411684cbcd23702e3c631c3e6eae84fd"
  end

  resource "tree-sitter-zig" do
    url "https://files.pythonhosted.org/packages/5a/78/93d32fea98b3b031bc0fbec44e27f2b8cc1a1a8ff5a99dfb1a8f85b11d43/tree_sitter_zig-1.1.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "daa2cdd7c1a2d278f2a917c85993adb6e84d37778bfc350ee9e342872e7f8be2"
  end

  resource "tree-sitter-powershell" do
    url "https://files.pythonhosted.org/packages/7f/53/486a2495d336d4f67031d759590223e4121fcc7da79afe989f29a1157c2f/tree_sitter_powershell-0.26.4-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "b5dde429c9de55b75906e240d6db1cf85417e2fc0a56d7b321810c2cd4cf3f98"
  end

  resource "tree-sitter-elixir" do
    url "https://files.pythonhosted.org/packages/7e/d7/f0ad3de0b359a8a1f694268855bb34134c88774fa2276cb33413163c0403/tree_sitter_elixir-0.3.5-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "015f537731af690cfa238b0fb76a8af4f0d1a2c54a38563f159926d2967ce650"
  end

  resource "tree-sitter-objc" do
    url "https://files.pythonhosted.org/packages/32/11/051f22252ee02ac3d0ca00ebcd99476da586b5d916390dc2f251e610ca7c/tree_sitter_objc-3.0.2-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "9fa8b1221d2651a51cf42e1551c0804e9f48707da70f41f3195910c599b5522b"
  end

  resource "tree-sitter-julia" do
    url "https://files.pythonhosted.org/packages/ef/d6/7049e567a9d3be58449717e7af22424ee22afa43667e8e309ec0a3603fea/tree_sitter_julia-0.23.1-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "8197c8d9b0cb51421aa2832f3fb539504d7b514cbb1fc79130bb1445c0b4a457"
  end

  resource "tree-sitter-verilog" do
    url "https://files.pythonhosted.org/packages/b5/bb/865ef41dafc4e94513f0f186360a840104d0ec6fde3d60d9b432a36dfb02/tree_sitter_verilog-1.0.3-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "5b9d70d86cf6913abc08766b6180e285d72848c7491a3f3f8e7bb8d8c440049d"
  end

  resource "tree-sitter-fortran" do
    url "https://files.pythonhosted.org/packages/b2/83/c93d2959030ff858f97a5cebedd1281341c6d69d240bb616c6fa7fb86538/tree_sitter_fortran-0.6.0-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "a0fe5929fd91d245aba5a3b414399a296fb9924942a549190cee226e5b1ec96c"
  end

  resource "tree-sitter-bash" do
    url "https://files.pythonhosted.org/packages/23/bb/2d2cfbb1f89aaeb1ec892624f069d92d058d06bb66f16b9ec9fb5873ab60/tree_sitter_bash-0.25.1-cp310-abi3-macosx_11_0_arm64.whl"
    sha256 "f4a34a6504c7c5b2a9b8c5c4065531dea19ca2c35026e706cf2eeeebe2c92512"
  end

  resource "tree-sitter-json" do
    url "https://files.pythonhosted.org/packages/5c/31/102c15948d97b135611d6a995c97a3933c0e9745f25737723977f58e142c/tree_sitter_json-0.24.8-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "62b4c45b561db31436a81a3f037f71ec29049f4fc9bf5269b6ec3ebaaa35a1cd"
  end

  def install
    venv = virtualenv_create(libexec, "python3.13")
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
    assert_match version.to_s, shell_output("#{bin}/graphify --version")
  end
end
