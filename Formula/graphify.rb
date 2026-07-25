class Graphify < Formula
  include Language::Python::Virtualenv

  desc "AI coding assistant skill that turns any folder of code, docs, papers, or images into a queryable knowledge graph"
  homepage "https://pypi.org/project/graphifyy/"
  url "https://files.pythonhosted.org/packages/02/27/fd91a31898594363e683864d1e983ce7d77a8a41b990665f8535fb8ac2b3/graphifyy-0.9.26.tar.gz"
  sha256 "cd0f4917a2ffe1842964be3dd07af67e2a66c97e140dc0f8283301ff2867f854"

  livecheck do
    url "https://pypi.org/pypi/graphifyy/json"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "python@3.13"

  resource "networkx" do
    url "https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512/networkx-3.6.1.tar.gz"
    sha256 "26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509"
  end

  resource "numpy" do
    url "https://files.pythonhosted.org/packages/22/fd/89965aa4ac08c74998539fcbf24fa3540f3e15237fbeb6bcf9c908f4aade/numpy-2.5.1.tar.gz"
    sha256 "a48a113e6afea91f5608793bafa7ef2ad481fefbda87ec5069f483de61cb9fa3"
  end

  resource "rapidfuzz" do
    url "https://files.pythonhosted.org/packages/2c/21/ef6157213316e85790041254259907eb722e00b03480256c0545d98acd33/rapidfuzz-3.14.5.tar.gz"
    sha256 "ba10ac57884ce82112f7ed910b67e7fb6072d8ef2c06e30dc63c0f604a112e0e"
  end

  resource "tree-sitter" do
    url "https://files.pythonhosted.org/packages/f7/03/5600b84aff2e6c4fe80cfebb4063fe2f50299521befe5f6092ab8c082f4a/tree_sitter-0.26.0.tar.gz"
    sha256 "b40c219edccc4564530c96f8f1556f6202b37cda964d1cbd7bd2b7e68b40a245"
  end

  resource "tree-sitter-python" do
    url "https://files.pythonhosted.org/packages/b8/8b/c992ff0e768cb6768d5c96234579bf8842b3a633db641455d86dd30d5dac/tree_sitter_python-0.25.0.tar.gz"
    sha256 "b13e090f725f5b9c86aa455a268553c65cadf325471ad5b65cd29cac8a1a68ac"
  end

  resource "tree-sitter-javascript" do
    url "https://files.pythonhosted.org/packages/59/e0/e63103c72a9d3dfd89a31e02e660263ad84b7438e5f44ee82e443e65bbde/tree_sitter_javascript-0.25.0.tar.gz"
    sha256 "329b5414874f0588a98f1c291f1b28138286617aa907746ffe55adfdcf963f38"
  end

  resource "tree-sitter-typescript" do
    url "https://files.pythonhosted.org/packages/1e/fc/bb52958f7e399250aee093751e9373a6311cadbe76b6e0d109b853757f35/tree_sitter_typescript-0.23.2.tar.gz"
    sha256 "7b167b5827c882261cb7a50dfa0fb567975f9b315e87ed87ad0a0a3aedb3834d"
  end

  resource "tree-sitter-go" do
    url "https://files.pythonhosted.org/packages/01/05/727308adbbc79bcb1c92fc0ea10556a735f9d0f0a5435a18f59d40f7fd77/tree_sitter_go-0.25.0.tar.gz"
    sha256 "a7466e9b8d94dda94cae8d91629f26edb2d26166fd454d4831c3bf6dfa2e8d68"
  end

  resource "tree-sitter-rust" do
    url "https://files.pythonhosted.org/packages/b7/87/75cbd22b927267d310f76cca1ab3c1d9d41035dfa3eb9cc95f96ee199440/tree_sitter_rust-0.24.2.tar.gz"
    sha256 "54fb02a5911e345308b405174465112479f56dc39e3f1e7744d7568595f00db9"
  end

  resource "tree-sitter-java" do
    url "https://files.pythonhosted.org/packages/fa/dc/eb9c8f96304e5d8ae1663126d89967a622a80937ad2909903569ccb7ec8f/tree_sitter_java-0.23.5.tar.gz"
    sha256 "f5cd57b8f1270a7f0438878750d02ccc79421d45cca65ff284f1527e9ef02e38"
  end

  resource "tree-sitter-groovy" do
    url "https://files.pythonhosted.org/packages/e8/1f/400d296618ea95932e6a3d299eababda0d138f4b0cfeaacdf50601c40ca9/tree_sitter_groovy-0.1.2.tar.gz"
    sha256 "49b004c4ae946d3f01a602f325cd8996423e034e5b3ad36fc34a1d1e42afa8da"
  end

  resource "tree-sitter-c" do
    url "https://files.pythonhosted.org/packages/a6/c9/3834f3d9278251aea7312274971bc4c45b17aec2490fd4b884d93bd7019a/tree_sitter_c-0.24.2.tar.gz"
    sha256 "1628584df0299b5a340aa63f8e67b6c97c91517f52fa7e7a4c557e40adb330a9"
  end

  resource "tree-sitter-cpp" do
    url "https://files.pythonhosted.org/packages/20/2c/4dd63d705a8933543cad9b92ff31be849b164fec91a6eb63475ebc9ce668/tree_sitter_cpp-0.23.4.tar.gz"
    sha256 "6a59c4cebb1ad1dc2e8d586cf8a72b39d21b8108b7b139d089719e81a339e41d"
  end

  resource "tree-sitter-ruby" do
    url "https://files.pythonhosted.org/packages/09/5b/6d24be4fde4743481bd8e3fd24b434870cb6612238c8544b71fe129ed850/tree_sitter_ruby-0.23.1.tar.gz"
    sha256 "886ed200bfd1f3ca7628bf1c9fefd42421bbdba70c627363abda67f662caa21e"
  end

  resource "tree-sitter-c-sharp" do
    url "https://files.pythonhosted.org/packages/9f/fb/7e2962bc1901daf264e7ce263b168e0139304a5f8f66c9b2baf20e550f87/tree_sitter_c_sharp-0.23.5.tar.gz"
    sha256 "2635c7d5ec93e59f2e831b571bed99c4cc68a5d183a0994020aa769e1b990a71"
  end

  resource "tree-sitter-kotlin" do
    url "https://files.pythonhosted.org/packages/58/bb/bdab3665eeca21246130eec79c76e42456cfa72d59606266ecdbf37f9a96/tree_sitter_kotlin-1.1.0.tar.gz"
    sha256 "322a35bdae75e25ae64dae6027be609c5422fab282084117816c4ebcda6168da"
  end

  resource "tree-sitter-scala" do
    url "https://files.pythonhosted.org/packages/39/cd/993b418057ad5a8aae67fa895905634a418e3c7bd176452c6f97be8bd6d4/tree_sitter_scala-0.26.0.tar.gz"
    sha256 "7f768094afbed10c07e60c202e275efc683418eeae4bdeff2c16f2ea0744939f"
  end

  resource "tree-sitter-php" do
    url "https://files.pythonhosted.org/packages/a4/c8/1a499038cb4036bea1d560ffbc807a6fb940261aa22296bd49a62ed8bcba/tree_sitter_php-0.24.1-cp310-abi3-macosx_10_9_x86_64.whl"
    sha256 "d56e2dcf025450f84a2cdbf4b18a09e6cb88b92e9e6858e63de3d4133ab2e43e"
  end

  resource "tree-sitter-swift" do
    url "https://files.pythonhosted.org/packages/fa/aa/8e7b789bb74ad7b9efb784bfb7d42bbcf064288d7716a72b68211ac6c3d4/tree_sitter_swift-0.7.3.tar.gz"
    sha256 "a87f1dba3050a346ee3442aad8d727afd74555dea258e31c71c7934d8c04af9b"
  end

  resource "tree-sitter-lua" do
    url "https://files.pythonhosted.org/packages/94/07/98d7c5f60c9a79a1d40f85e59b7c25a0102d2eebcc5a83608c7c308edf22/tree_sitter_lua-0.5.0.tar.gz"
    sha256 "0e46356038ccb8ce1049289104c56230003448309a335f2e353f1edc7b373552"
  end

  resource "tree-sitter-zig" do
    url "https://files.pythonhosted.org/packages/5c/97/75967b81460e0ce999de4736b9ac189dcd5ad1c85aabcc398ba529f4838e/tree_sitter_zig-1.1.2.tar.gz"
    sha256 "da24db16df92f7fcfa34448e06a14b637b1ff985f7ce2ee19183c489e187a92e"
  end

  resource "tree-sitter-powershell" do
    url "https://files.pythonhosted.org/packages/05/59/e1806757895926cec99a71a73ac5252add3dd739c34b3e21b60f74182cbd/tree_sitter_powershell-0.26.4.tar.gz"
    sha256 "ffc7f7526420fe335cb78823b38bc8b0c27453eb974ca6056779e4cfefffa605"
  end

  resource "tree-sitter-elixir" do
    url "https://files.pythonhosted.org/packages/e8/83/0501ee426bcd40cf5f765ce66ff2e7136d438ff4e65aeb08991f9826d4e5/tree_sitter_elixir-0.3.5.tar.gz"
    sha256 "ead089393b1ce732304e6b6fb0bc0ab79e3295663d697be025bd49f0f367b74d"
  end

  resource "tree-sitter-objc" do
    url "https://files.pythonhosted.org/packages/d6/f2/f979251e2100753160fcee515bc36ee60997c2e79d166232c93bc6519e02/tree_sitter_objc-3.0.2.tar.gz"
    sha256 "ac55aefe8a4f3ea6f1da2a2e05372a4f37100001934e36a81e0f96c4c6252809"
  end

  resource "tree-sitter-julia" do
    url "https://files.pythonhosted.org/packages/d5/e7/1ff7d38967471f13b77420cdfc58ce170c8ceb83ff4b55ce50744c076e79/tree_sitter_julia-0.23.1.tar.gz"
    sha256 "07607c4fc902b21e6821622f56b08aa2321b921fe0644e2ab4aba1747e6c8808"
  end

  resource "tree-sitter-verilog" do
    url "https://files.pythonhosted.org/packages/d1/b6/9b3b72c3478caa07c346550c66c6e77759c76785c82d1dd5408230e58e45/tree_sitter_verilog-1.0.3.tar.gz"
    sha256 "d4043cba50e1ba8402396e3106e17de755c86eca311b23ab826e018ea9818984"
  end

  resource "tree-sitter-fortran" do
    url "https://files.pythonhosted.org/packages/4b/a1/491e2b0264fa30939975309d94dff00dc00ab445a7d8d5ee30476c888a44/tree_sitter_fortran-0.6.0.tar.gz"
    sha256 "65fea540148ae431335b3920267dffaeeb157ef2b21c0716798c751f6a9e193b"
  end

  resource "tree-sitter-bash" do
    url "https://files.pythonhosted.org/packages/8e/0e/f0108be910f1eef6499eabce517e79fe3b12057280ed398da67ce2426cba/tree_sitter_bash-0.25.1.tar.gz"
    sha256 "bfc0bdaa77bc1e86e3c6652e5a6e140c40c0a16b84185c2b63ad7cd809b88f14"
  end

  resource "tree-sitter-json" do
    url "https://files.pythonhosted.org/packages/d7/29/e92df6dca3a6b2ab1c179978be398059817e1173fbacd47e832aaff3446b/tree_sitter_json-0.24.8.tar.gz"
    sha256 "ca8486e52e2d261819311d35cf98656123d59008c3b7dcf91e61d2c0c6f3120e"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/graphify --version")
  end
end
