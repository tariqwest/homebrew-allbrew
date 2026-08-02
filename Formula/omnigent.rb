class Omnigent < Formula
  include Language::Python::Virtualenv

  desc "Omnigent is an open-source AI agent framework and meta-harness: orchestrate Claude Code, Codex, Cursor, Pi, and custom agents — swap harnesses without rewriting, enforce policies and sandboxing, and collaborate in real time from any device."
  homepage "https://pypi.org/project/omnigent/"
  url "https://files.pythonhosted.org/packages/b9/b8/2b8ef4334eff998338566e282d2e55327a664ab7b0f6ac16f41465f5bd24/omnigent-0.7.0-py3-none-any.whl"
  sha256 "cce277f39ec19f6370ac55e335a531cbc510d0249346130b70f54301a7ea0203"
  license "Apache-2.0"

  livecheck do
    url "https://pypi.org/pypi/omnigent/json"
    regex(/"version"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "python@3.13"

  # Native wheels (jiter, pydantic-core, …) ship dylib IDs like
  # @rpath/foo.so. Homebrew's fix_dynamic_linkage expands those to long
  # Cellar paths that do not fit the Mach-O header. Preserve @rpath IDs.
  preserve_rpath

  resource "omnigent-client" do
    url "https://files.pythonhosted.org/packages/d7/5d/59b23aafcc85fcb28baae8d5fec4e1d217042ee78af496d1a4365d6d0b3d/omnigent_client-0.7.0-py3-none-any.whl"
    sha256 "6431214859a654f1aa8816a12a72d9022c9978c98a1ac197d71de765c6db2ec4"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/2a/39/e50c7c3a983047577ee07d2a9e53faf5a69493943ec3f6a384bdc792deb2/httpx-0.28.1-py3-none-any.whl"
    sha256 "d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/da/35/f2287558c17e29fafc8ef3daf819bb9834061cfa43bff8014f7df7f63bdc/anyio-4.14.2-py3-none-any.whl"
    sha256 "9f505dda5ac9f0c8309b5e8bd445a8c2bf7246f3ce950121e45ea15bc41d1494"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/1e/5e/d4e9f1a599fb8e573b7b87160658329fbf28d19eac2718f51fc3def3aa5a/idna-3.18-py3-none-any.whl"
    sha256 "7f952cbe720b688055e3f87de14f5c3e5fdaa8bc3928985c4077ca689de849a2"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/0b/a7/71ac2cff56fec219ed242bb11b8efb69fcc4bec75db06fb7bfe35de520e6/certifi-2026.7.22-py3-none-any.whl"
    sha256 "62f22742b58a1a33014a2b6b706588a8d7e2a88ae7bd1a6ebe8c992928483775"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/7e/f5/f66802a942d491edb555dd61e3a9961140fd64c90bce1eafd741609d334d/httpcore-1.0.9-py3-none-any.whl"
    sha256 "2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/04/4b/29cac41a4d98d144bf5f6d33995617b185d14b22401f75ca86f384e87ff1/h11-0.16.0-py3-none-any.whl"
    sha256 "63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/fd/7b/122376b1fd3c62c1ed9dc80c931ace4844b3c55407b6fb2d199377c9736f/pydantic-2.13.4-py3-none-any.whl"
    sha256 "45a282cde31d808236fd7ea9d919b128653c8b38b393d1c4ab335c62924d9aba"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/99/91/8acff4f5e50511b911bbccb72b8628a49c68ce14148cd9f6431094859a90/annotated_types-0.8.0-py3-none-any.whl"
    sha256 "f072f4d804ea359e4eaf198b1af7a8b0943881a87f31bb764f8bf219bb9419e0"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/c1/81/4fa520eaffa8bd7d1525e644cd6d39e7d60b1592bc5b516693c7340b50f1/pydantic_core-2.46.4-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "c94f0688e7b8d0a67abf40e57a7eaaecd17cc9586706a31b76c031f63df052b4"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/49/d3/b8441a820a491ddfc024b0b0cf0393375b75ea13866d9c66727e54c2fc80/typing_extensions-4.16.0-py3-none-any.whl"
    sha256 "481caa481374e813c1b176ada14e97f1f67a4539ce9cfeb3f350d78d6370c2e8"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/dc/9b/47798a6c91d8bdb567fe2698fe81e0c6b7cb7ef4d13da4114b41d239f65d/typing_inspection-0.4.2-py3-none-any.whl"
    sha256 "4ed1cacbdc298c220f1bd249ed5287caa16f34d44ef4e9c3d0cbad5b521545e7"
  end

  resource "omnigent-ui-sdk" do
    url "https://files.pythonhosted.org/packages/e4/3e/11103117757b9d72d759296177fd11a6e393c3b2a539290e86b21d5a597e/omnigent_ui_sdk-0.7.0-py3-none-any.whl"
    sha256 "2ebd21624c5c47ff5a4792a427393cfac876455f3ee7961f99363ca11bfaf31d"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/54/6f/84908cad2d6aa5144abcf7b42709fe4fdb459bc640ec7ac5786e7693dabc/prompt_toolkit-3.0.53-py3-none-any.whl"
    sha256 "01c0891d7f9237d5e339f7d3e42cdae80b7534abb1c7c0e3352efba6231492f2"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/96/42/3e5985a0a7e57de470b320c6d6a1a67c844f6737a587f3d44dd13d1819e7/wcwidth-0.8.2-py3-none-any.whl"
    sha256 "d63947694a0539a1d51e01eda7caf800c291020e6cdd7e28ad7b14dd33ad4f85"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/b1/16/95309993f1d3748cd644e02e38b75d50cbc0d9561d21f390a76242ce073f/pyyaml-6.0.3-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "2283a07e2c21a2aa78d9c4442724ec1eb15f5e42a723b99cb3d822d48f5f7ad1"
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

  resource "openai" do
    url "https://files.pythonhosted.org/packages/ae/f4/561ed79fd94876160018a5e75254cfcb9b0e62d4dded9dcb20072e86d623/openai-2.44.0-py3-none-any.whl"
    sha256 "0a2a3ab2e29aeda368700f662ff9ba0f9df17ba4c54577a64e08b8115a3cc0ad"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/12/b3/231ffd4ab1fc9d679809f356cebee130ac7daa00d6d6f3206dd4fd137e9e/distro-1.9.0-py3-none-any.whl"
    sha256 "7bffd925d65168f85027d8da9af6bddab658135b840670a223589bc0c8ef02b2"
  end

  resource "jiter" do
    url "https://files.pythonhosted.org/packages/d0/2b/c3eaf16f5d7c9bad66ea32f40a95bd169b29a91217fcc7f081375157e99c/jiter-0.16.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "d28bb3c26762358dadf3e5bf0bccd29ae987d65e6988d2e6f49829c76b003c09"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/e9/44/75a9c9421471a6c4805dbf2356f7c181a29c1879239abab1ea2cc8f38b40/sniffio-1.3.1-py3-none-any.whl"
    sha256 "2f6da418d1f1e0fddd844478f41680e794e6051915791a034ff65e5f100525a2"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/f9/1c/01bfd571a64e7f270e6bab5e33777debe0edc56759233ce84f27dec92d14/tqdm-4.70.0-py3-none-any.whl"
    sha256 "7f585706bfddbdebf89daac705b2dfcc16890130727d3197ca62c732b4310953"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/01/c8/248b201f6d753d69fd5d6506011abbb35a946d9142b2ae311a948fd0be3d/mcp-1.29.0-py3-none-any.whl"
    sha256 "f5a075bb611f23d6f4d080c6a1699fa62772eebc562ba9e66b306ddde1c755f7"
  end

  resource "httpx-sse" do
    url "https://files.pythonhosted.org/packages/d2/fd/6668e5aec43ab844de6fc74927e155a3b37bf40d7c3790e49fc0406b6578/httpx_sse-0.4.3-py3-none-any.whl"
    sha256 "0ac1c9fe3c0afad2e0ebb25a934a59f4c7823b60792691f779fad2c5568830fc"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/69/90/f63fb5873511e014207a475e2bb4e8b2e570d655b00ac19a9a0ca0a385ee/jsonschema-4.26.0-py3-none-any.whl"
    sha256 "d489f15263b8d200f8387e64b4c3a75f06629559fb73deb8fdfb525f2dab50ce"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/64/b4/17d4b0b2a2dc85a6df63d1157e028ed19f90d4cd97c36717afef2bc2f395/attrs-26.1.0-py3-none-any.whl"
    sha256 "c647aa4a12dfbad9333ca4e71fe62ddc36f4e63b2d260a37a8b83d2f043ac309"
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

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/77/c1/6e422f34e569cf8e18df68d1939c81c099d2b61e4f7d9621c8a77560799c/pydantic_settings-2.14.2-py3-none-any.whl"
    sha256 "a20c97b37910b6550d5ea50fbcc2d4187defe58cd57070b73863d069419c9440"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/0b/d7/1959b9648791274998a9c3526f6d0ec8fd2233e4d4acce81bbae76b44b2a/python_dotenv-1.2.2-py3-none-any.whl"
    sha256 "1d8214789a24de455a8b8bd8ae6fe3c6b69a5e3d64aa8a8e5d68e694bbcb285a"
  end

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/a3/5e/ecf12fdb62546d64385c158514e9b2b671f7832108ef2ecd2020ce0af2d1/pyjwt-2.13.0-py3-none-any.whl"
    sha256 "66adcc2aff09b3f1bbd95fc1e1577df8ac8723c978552fd43304c8a290ac5728"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/c5/5c/59086b4aac5e879d38ddbcf74e4be7ade89cebc3eb199a55da998c3bb46a/cryptography-50.0.0-cp311-abi3-macosx_11_0_arm64.whl"
    sha256 "031e2d5dd4bb9caa3ca9c82e5a197fd8ae680232cee62603d1a813f3f07e3d03"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/84/4c/82f132cb4418ee6d953d982b19191e87e2a6372c8a4ce36e50b69d6ade4a/cffi-2.1.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "716ff8ec22f20b4d988b12884086bcef0fc99737043e503f7a3935a6be99b1ea"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0c/c3/44f3fbbfa403ea2a7c779186dc20772604442dde72947e7d01069cbe98e3/pycparser-3.0-py3-none-any.whl"
    sha256 "b727414169a36b7d524c1c3e31839a521725078d7b2ff038656844266160a992"
  end

  resource "python-multipart" do
    url "https://files.pythonhosted.org/packages/e1/04/e8135ebd1ad02c56ec633277529b2602ff99ff634be76cdba5744cf554fd/python_multipart-0.0.32-py3-none-any.whl"
    sha256 "ff6d3f776f16878c894e52e107296ffc890e913c611b1a4ec6c44e2821fe2e23"
  end

  resource "sse-starlette" do
    url "https://files.pythonhosted.org/packages/49/36/e10c1d1b7ca881d2625db2ec28508578499187bb1c389952c398474e1834/sse_starlette-3.4.6-py3-none-any.whl"
    sha256 "56217ab4c9a9f9c5db7b21e08732d3e7c2b807f45231ad23de0551a24c4a41f6"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/ec/bb/2799cc2ede3ed41131f8975621e7213dfc7ef4acbbaadfa440f32500c370/starlette-1.3.1-py3-none-any.whl"
    sha256 "c7372aae11c3c3f26a42df7bd626cec2f47d03483d261d369516a615a53714c6"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/c7/d5/68e6e9bca63c0badf67002890a46d3784c958de45b65e1275ec583ca1f06/uvicorn-0.52.1-py3-none-any.whl"
    sha256 "e4403f9d93188cf9d1088e9f40e3acd12630e2df8675316704379a7fc20fff6a"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/fb/e2/79c688af8b210d232694e31e59da9f6ec747bae31c3f5946e4e9b98860d5/click-8.4.2-py3-none-any.whl"
    sha256 "e6f9f66136c816745b9d65817da91d61d957fb16e02e4dcd0552553c5a197b76"
  end

  resource "httptools" do
    url "https://files.pythonhosted.org/packages/2a/0e/0fb14848c19a686c8062ff9067c1a48793e3224b47bc5b201535b6036fce/httptools-0.8.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "2d689918c15a013c65ef52d9fd495d766893ab831a2c8d89f2ac5940a5df847c"
  end

  resource "uvloop" do
    url "https://files.pythonhosted.org/packages/89/8c/182a2a593195bfd39842ea68ebc084e20c850806117213f5a299dfc513d9/uvloop-0.22.1-cp313-cp313-macosx_10_13_universal2.whl"
    sha256 "561577354eb94200d75aca23fbde86ee11be36b00e52a4eaf8f50fb0c86b7705"
  end

  resource "watchfiles" do
    url "https://files.pythonhosted.org/packages/31/3a/0da302f2307aee316922806ebd5726c542cbd787c938271cf14a074c7daf/watchfiles-1.2.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "7ba0480b9a74af058f43b337e937a451e109295c420916d68ad24e3dc02f5e44"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/09/ce/3929538b2b9918f5eee623fbf3346893973191f6df93f19bbda097bd7bb7/websockets-17.0.1-py3-none-any.whl"
    sha256 "c6be9cba65c65cc76dfa3d4619e359ff02a4476c74e179b215236c11a0b32345"
  end

  resource "ftfy" do
    url "https://files.pythonhosted.org/packages/ab/6e/81d47999aebc1b155f81eca4477a616a70f238a2549848c38983f3c22a82/ftfy-6.3.1-py3-none-any.whl"
    sha256 "7c70eb532015cd2f9adb53f101fb6c7945988d023a085d127d1573dc49dd0083"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/80/c4/f5af4c1ca8c1eeb2e92ccca14ce8effdeec651d5ab6053c589b074eda6e1/psutil-7.2.2-cp36-abi3-macosx_11_0_arm64.whl"
    sha256 "1a7b04c10f32cc88ab39cbf606e117fd74721c831c98a27dc04578deb0c16979"
  end

  resource "cel-python" do
    url "https://files.pythonhosted.org/packages/1e/f8/38812adc3f787c2c2e8ba56f524185ed379656c10b40347a32796ba61c08/cel_python-0.5.0-py3-none-any.whl"
    sha256 "d0f85008b89655c2bb18d797d2fa3f96f2ed80f4a3b43b0e8138c6646581e5f6"
  end

  resource "google-re2" do
    url "https://files.pythonhosted.org/packages/a5/b9/c441722196598fc3de0f654606ad9975a968c71dc27f516b5a4c9ebb94fd/google_re2-1.1.20251105-1-cp313-cp313-macosx_13_0_arm64.whl"
    sha256 "9f3cf610e857a7d6f02916cf2b7fc159a5429b8bcb23164500d46e5e233f2924"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/14/2f/967ba146e6d58cf6a652da73885f52fc68001525b4197effc174321d70b4/jmespath-1.1.0-py3-none-any.whl"
    sha256 "a5663118de4908c91729bea0acadca56526eb2698e83de10cd116ae0f4e97c64"
  end

  resource "lark" do
    url "https://files.pythonhosted.org/packages/82/3d/14ce75ef66813643812f3093ab17e46d3a206942ce7376d31ec2d36229e7/lark-1.3.1-py3-none-any.whl"
    sha256 "c629b661023a014c37da873b4ff58a817398d12635d3bbb2c5a03be7fe5d1e12"
  end

  resource "pendulum" do
    url "https://files.pythonhosted.org/packages/02/fb/d65db067a67df7252f18b0cb7420dda84078b9e8bfb375215469c14a50be/pendulum-3.2.0-py3-none-any.whl"
    sha256 "f3a9c18a89b4d9ef39c5fa6a78722aaff8d5be2597c129a3b16b9f40a561acf3"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/ec/57/56b9bcc3c9c6a792fcbaf139543cee77261f3651ca9da0c93f5c1221264b/python_dateutil-2.9.0.post0-py2.py3-none-any.whl"
    sha256 "a8b2bc7bffae282281c8140a97d3aa9c14da0b136dfe83f850eea9a5f7470427"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/b7/ce/149a00dd41f10bc29e5921b496af8b574d8413afcd5e30dfa0ed46c2cc5e/six-1.17.0-py2.py3-none-any.whl"
    sha256 "4721f391ed90541fddacab5acf947aa0d3dc7d27b2e1e8eda2be8970586c3274"
  end

  resource "tzdata" do
    url "https://files.pythonhosted.org/packages/e5/6d/b53b99a9f2766d095985947a5782f1702cabb129a34f7a802d7197af832f/tzdata-2026.3-py2.py3-none-any.whl"
    sha256 "dc096730c87af6cab1b171c9d532be840741ff5d459015e7f6947bd7d7e54931"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/81/db/e655086b7f3a705df045bf0933bdd9c2f79bb3c97bfef1384598bb79a217/keyring-25.7.0-py3-none-any.whl"
    sha256 "be4a0b195f149690c166e850609a477c532ddbfbaed96a404d4e43f8d5e2689f"
  end

  resource "jaraco.classes" do
    url "https://files.pythonhosted.org/packages/7f/66/b15ce62552d84bbfcec9a4873ab79d993a1dd4edb922cbfccae192bd5b5f/jaraco.classes-3.4.0-py3-none-any.whl"
    sha256 "f662826b6bed8cace05e7ff873ce0f9283b5c924470fe664fff1c2f00f581790"
  end

  resource "more-itertools" do
    url "https://files.pythonhosted.org/packages/e8/3d/1087453384dbde46a8c7f9356eead2c58be8a7bf156bca40243377c85715/more_itertools-11.1.0-py3-none-any.whl"
    sha256 "4b65538ae22f6fed0ce4874efd317463a7489796a0939fa66824dd542125a192"
  end

  resource "jaraco.functools" do
    url "https://files.pythonhosted.org/packages/02/36/ecc85bc96c273dc8a11273ed4782272975e6338d4a3e9228621175edf0e3/jaraco_functools-4.6.0-py3-none-any.whl"
    sha256 "99e3dc0060c5cbe8fcd1cdb36258e2a65ca40f1566b2033b12abb1bb44dd3c30"
  end

  resource "jaraco.context" do
    url "https://files.pythonhosted.org/packages/f2/58/bc8954bda5fcda97bd7c19be11b85f91973d67a706ed4a3aec33e7de22db/jaraco_context-6.1.2-py3-none-any.whl"
    sha256 "bf8150b79a2d5d91ae48629d8b427a8f7ba0e1097dd6202a9059f29a36379535"
  end

  resource "tomlkit" do
    url "https://files.pythonhosted.org/packages/13/bc/8c13eb66537dce1d2bd3a57132902f38d0e7f5bb46fa9f4daed9fe9d76ee/tomlkit-0.15.1-py3-none-any.whl"
    sha256 "177a05aece5a8ca5266fd3c448abb47b8d352f09d477d3ca8332db4d89b24304"
  end

  resource "alembic" do
    url "https://files.pythonhosted.org/packages/96/78/5fe6dc3a3a5b2f5a2a4faef8bfe336d5fa049a38884ab3172e0098160c01/alembic-1.18.5-py3-none-any.whl"
    sha256 "06d8ba9d04558022f5395e9317de03d270f3dced49cee01f89fe7a13c26f14bc"
  end

  resource "SQLAlchemy" do
    url "https://files.pythonhosted.org/packages/e2/22/dbf013a12ec759e54a34a119e9e217435b3f71b2dd5c61a7ade0a25dae87/sqlalchemy-2.0.51-py3-none-any.whl"
    sha256 "bb024d8b621d0be75f4f44ecc7c950450026e76d66dc8f791bb5331d7fed59d5"
  end

  resource "greenlet" do
    url "https://files.pythonhosted.org/packages/c0/9a/e51225dcd58713f16ccbdcc501a8da21098ea14515b7870f1f94459e5ff5/greenlet-3.5.4-cp313-cp313-macosx_11_0_universal2.whl"
    sha256 "24e61b88cb7e1b1d794b32a10cc346ac779681d6d74ff137a3e0a444d2bf1f02"
  end

  resource "Mako" do
    url "https://files.pythonhosted.org/packages/bc/b1/a0ec7a5a9db730a08daef1fdfb8090435b82465abbf758a596f0ea88727e/mako-1.3.12-py3-none-any.whl"
    sha256 "8f61569480282dbf557145ce441e4ba888be453c30989f879f0d652e39f53ea9"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/9c/d9/5f7756922cdd676869eca1c4e3c0cd0df60ed30199ffd775e319089cb3ed/markupsafe-3.0.3-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "116bb52f642a37c115f517494ea5feb03889e04df47eeff5b130b1808ce7c219"
  end

  resource "cachetools" do
    url "https://files.pythonhosted.org/packages/90/45/f458fa2c388e79dd9d8b9b0c99f1d31b568f27388f2fdba7bb66bbc0c6ed/cachetools-6.2.6-py3-none-any.whl"
    sha256 "8c9717235b3c651603fff0076db52d6acbfd1b338b8ed50256092f7ce9c85bda"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/cb/03/10388a42375ee7e4ac9b94eb2c5c569c8b5795e377e701c9ac3ad63de890/fastapi-0.141.1-py3-none-any.whl"
    sha256 "bfb91aa2d334c61cb35ba9a116fc123b3d3df31640b801cf57a7a78ec3f603b3"
  end

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/3e/30/e900b21425a860e195f32e37657aa1f7c7f2b1bfb26f03ca209b90933c06/annotated_doc-0.0.5-py3-none-any.whl"
    sha256 "117bac03a25ede5df5440e855b32d556049ca169ead221505badf432fed4b101"
  end

  resource "pexpect" do
    url "https://files.pythonhosted.org/packages/9e/c3/059298687310d527a58bb01f3b1965787ee3b40dce76752eda8b44e9a2c5/pexpect-4.9.0-py2.py3-none-any.whl"
    sha256 "7236d1e080e4936be2dc3e326cec0af72acf9212a7e1d060210e70a47e253523"
  end

  resource "ptyprocess" do
    url "https://files.pythonhosted.org/packages/22/a6/858897256d0deac81a172289110f31629fc4cee19b6f01283303e18c8db3/ptyprocess-0.7.0-py2.py3-none-any.whl"
    sha256 "4b41f3967fce3af57cc7e94b888626c18bf37a083e3651ca8feeb66d492fef35"
  end

  resource "pyte" do
    url "https://files.pythonhosted.org/packages/59/d0/bb522283b90853afbf506cd5b71c650cf708829914efd0003d615cf426cd/pyte-0.8.2-py3-none-any.whl"
    sha256 "85db42a35798a5aafa96ac4d8da78b090b2c933248819157fc0e6f78876a0135"
  end

  resource "zstandard" do
    url "https://files.pythonhosted.org/packages/3f/06/9ae96a3e5dcfd119377ba33d4c42a7d89da1efabd5cb3e366b156c45ff4d/zstandard-0.25.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "a1a4ae2dec3993a32247995bdfe367fc3266da832d82f8438c8570f989753de1"
  end

  resource "tiktoken" do
    url "https://files.pythonhosted.org/packages/53/61/c68e123b6d753e3fc2751e9b18e732c9d8bf1e1926762e736eee935d931c/tiktoken-0.13.0-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "8fe806a50664e83a6ffd56cbd1e4f5dcc6cd32a3e7538f70dc38b1a271384545"
  end

  resource "regex" do
    url "https://files.pythonhosted.org/packages/95/47/2d0564e93d87bc48618360ddca232a2ca612bbdf53ce8465d45ca5ce14ee/regex-2026.7.19-cp313-cp313-macosx_11_0_arm64.whl"
    sha256 "40b34dd88658e4fedd2fddbf0275ac970d00614b731357f425722a3ed1983d11"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/a0/f4/c67b0b3f1b9245e8d266f0f112c500d50e5b4e83cb6f3b71b6528104182a/requests-2.34.2-py3-none-any.whl"
    sha256 "2a0d60c172f83ac6ab31e4554906c0f3b3588d37b5cb939b1c061f4907e278e0"
  end

  resource "charset_normalizer" do
    url "https://files.pythonhosted.org/packages/98/2b/f97f1c193fb855c345d678f5077d6926034db0722df74c8f057020e05a25/charset_normalizer-3.4.9-py3-none-any.whl"
    sha256 "68e5f26a1ad57ded6d1cfb85331d1c1a195314756471d97758c48498bb4dcdf5"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/7f/3e/5db95bcf282c52709639744ca2a8b149baccf648e39c8cc87553df9eae0c/urllib3-2.7.0-py3-none-any.whl"
    sha256 "9fb4c81ebbb1ce9531cce37674bbc6f1360472bc18ca9a553ede278ef7276897"
  end

  resource "opentelemetry-exporter-otlp-proto-grpc" do
    url "https://files.pythonhosted.org/packages/54/29/6ae42ba32b153ae0a44ae125f0caff2188bbe62d99c82d1768da30864e72/opentelemetry_exporter_otlp_proto_grpc-1.44.0-py3-none-any.whl"
    sha256 "6a1a645ea182a2f59440c51fa8301d309f3324a8f9d65f8395584b064b67ee4e"
  end

  resource "googleapis-common-protos" do
    url "https://files.pythonhosted.org/packages/e7/c8/e2645aa8ed02fd4c7a2f59d68783b65b1f3cbdfe39a6308e156509d1fee8/googleapis_common_protos-1.75.0-py3-none-any.whl"
    sha256 "961ed60399c457ceb0ee8f285a84c870aabc9c6a832b9d37bb281b5bebde43ed"
  end

  resource "protobuf" do
    url "https://files.pythonhosted.org/packages/19/c7/5f7c636ec43e0c545e28d1f1db71990108306f7bdcb89f069ba97e428e7f/protobuf-7.35.1-py3-none-any.whl"
    sha256 "4bc97768d8fe4ad6743c8a19403e314511ed9f6d13205b687e52421c023ac1b9"
  end

  resource "grpcio" do
    url "https://files.pythonhosted.org/packages/8f/a1/121806ce69f23138dabe06aa595b0e5f1ae051a37e4c1954eed7d692c800/grpcio-1.83.0-cp313-cp313-macosx_11_0_universal2.whl"
    sha256 "74fe6f9e8a35c7dbf32255ee154d15e3e5338a81ed39173d079d594d2e544cd1"
  end

  resource "opentelemetry-api" do
    url "https://files.pythonhosted.org/packages/ca/6f/a04e900f465ff3221ccc395522503e2d10e79fa21f2723c8e177aae1e0d1/opentelemetry_api-1.44.0-py3-none-any.whl"
    sha256 "94b98c893a91b88657eaac1e3ba89618cdb85be6918196705354f34728b2cdef"
  end

  resource "opentelemetry-exporter-otlp-proto-common" do
    url "https://files.pythonhosted.org/packages/5e/71/65fd9d54c10b860f87c045ccee1264cab7011268895d3528818a29c1172a/opentelemetry_exporter_otlp_proto_common-1.44.0-py3-none-any.whl"
    sha256 "9a9fe61bba73d802904bc989f1d6b4a7b1ee40f06c40e98d6f85af65aaebb694"
  end

  resource "opentelemetry-proto" do
    url "https://files.pythonhosted.org/packages/d1/7c/8be563d68e93bbefa5c8affb82ddcff91b3ad858ce49957ba7b16fd3e0ab/opentelemetry_proto-1.44.0-py3-none-any.whl"
    sha256 "898b155a0e1557afd867478fb6158e8122a46329ca0bb8dc53cc55e98f017f56"
  end

  resource "opentelemetry-sdk" do
    url "https://files.pythonhosted.org/packages/e7/23/ff077e61886ee020a17ce9c8b6fa11c601c8d8345b09ea24f605445df62a/opentelemetry_sdk-1.44.0-py3-none-any.whl"
    sha256 "df081c4c6bcfdb1211e3e86140376792643128a25f8d72d1d27675936e7e96ad"
  end

  resource "opentelemetry-semantic-conventions" do
    url "https://files.pythonhosted.org/packages/a6/0e/49df70d9b81fb5cbae4bbf2a49d865b09bcbcbc4eb53f5851b1027738d78/opentelemetry_semantic_conventions-0.65b0-py3-none-any.whl"
    sha256 "1cacde7b0ad306f84c5ef08c3dbe1bbaf20165bba6f8bff43b670e555a086bcb"
  end

  resource "opentelemetry-exporter-otlp-proto-http" do
    url "https://files.pythonhosted.org/packages/cd/d0/fdeb1a98d8d3a6205f5f297c51b4a9bfe65126ab60339669bbe3dd54c2e2/opentelemetry_exporter_otlp_proto_http-1.44.0-py3-none-any.whl"
    sha256 "838592fce774c1c8bb7b9a0a7facbfa82e17be5a8a4e94cef10cb84ae026bae3"
  end

  resource "opentelemetry-instrumentation-fastapi" do
    url "https://files.pythonhosted.org/packages/fa/b0/c9b0300d33349ecc3dfd2362516eaffc44877e90970e6a52178ff953fec3/opentelemetry_instrumentation_fastapi-0.65b0-py3-none-any.whl"
    sha256 "cda2610a0ec1b22d19886f33e4d861e9f5dbb886aeaa3a1263b47aff82c36943"
  end

  resource "opentelemetry-instrumentation-asgi" do
    url "https://files.pythonhosted.org/packages/0b/9c/376962840b619d2d55fe8ee2285f8c70971c090e5fff614516fc654a6f3a/opentelemetry_instrumentation_asgi-0.65b0-py3-none-any.whl"
    sha256 "3a845a8ebd1c4ef0d8263401e6545f5b219b2feee612090d50f578a87e71fd65"
  end

  resource "asgiref" do
    url "https://files.pythonhosted.org/packages/c0/1b/54f4ad77cd8a584fa70746c47df988e002cf1ee1eba43364d46f87803647/asgiref-3.12.1-py3-none-any.whl"
    sha256 "fe386d1c2bff7259ea95929266d12a8cf9a8b5a1c2598402967d8792e7a7c094"
  end

  resource "opentelemetry-instrumentation" do
    url "https://files.pythonhosted.org/packages/40/7b/85eab1215f72adf0e68d3dc4a679b9bff993fa679ff34cd8dd378e2659fd/opentelemetry_instrumentation-0.65b0-py3-none-any.whl"
    sha256 "ea967a72b9939b5fcfdad572753b4306c59dcb99e3f382d95dae04286805e137"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/df/b2/87e62e8c3e2f4b32e5fe99e0b86d576da1312593b39f47d8ceef365e95ed/packaging-26.2-py3-none-any.whl"
    sha256 "5fc45236b9446107ff2415ce77c807cee2862cb6fac22b8a73826d0693b0980e"
  end

  resource "wrapt" do
    url "https://files.pythonhosted.org/packages/00/39/3daf9f47be208606586de4568ba6713db53ebc8fd7a575aea1fe57983b69/wrapt-2.3.0-py3-none-any.whl"
    sha256 "d8c7ed08477429752b8c44991f40ad7838b18332a160698740a6bfbc10d998a2"
  end

  resource "opentelemetry-util-http" do
    url "https://files.pythonhosted.org/packages/23/3f/ab8d29df207ce5f470a07fa96ebb48af4e95b7fab7e7635311b9a32f2fab/opentelemetry_util_http-0.65b0-py3-none-any.whl"
    sha256 "7553b606f963097cb190536dc30556cce85090692e471a422fff30ca29b04348"
  end

  resource "opentelemetry-instrumentation-httpx" do
    url "https://files.pythonhosted.org/packages/9d/0f/c6144096b4914bbf44b43ba21c962e8f333ff045770b50a3e79ed8bd455f/opentelemetry_instrumentation_httpx-0.65b0-py3-none-any.whl"
    sha256 "400f1b78afa4ee2332b5debe58e1ed1b317913d58812c952576be76660aeadb1"
  end

  resource "opentelemetry-instrumentation-sqlalchemy" do
    url "https://files.pythonhosted.org/packages/71/94/3eb3195a60b894cc1852a5657a2b64764a998085c50d7fb3452148af8f18/opentelemetry_instrumentation_sqlalchemy-0.65b0-py3-none-any.whl"
    sha256 "4d8a2e5afc7b505a48d05cb1fb6db5f8b31681814c1d7767bd6d4b5bdd3a3047"
  end

  resource "claude-agent-sdk" do
    url "https://files.pythonhosted.org/packages/45/ff/03613a38a84285cd85f114fc26d4431f545d2b3b344eb8f69f9b0f18f3c6/claude_agent_sdk-0.2.128-py3-none-macosx_11_0_arm64.whl"
    sha256 "2e47ee95be68cb07612fd5288a40f3307763da5a5adf66d6e03ea49dc0495c9c"
  end

  resource "openai-agents" do
    url "https://files.pythonhosted.org/packages/02/dd/af34f1f519e54941c18e8b0b1ac0386da5bf8fd32bc3ec207e05043475d4/openai_agents-0.19.2-py3-none-any.whl"
    sha256 "ea2d7e306731c73a5e340bf23ca98326088bdfe8c61cd8e171a307adcd2957d0"
  end

  resource "griffelib" do
    url "https://files.pythonhosted.org/packages/e4/d3/5268aeabf2ad82658c4e2ff3a060648d0f02f3926cb53247c0e4d0dab49e/griffelib-2.1.0-py3-none-any.whl"
    sha256 "cc7b3d2d2865ad0b909fcc38086e3f554b5ea7acbaa7bbb7ecaa3f5dfb7d9f00"
  end

  resource "argon2-cffi" do
    url "https://files.pythonhosted.org/packages/a4/6a/e8a041599e78b6b3752da48000b14c8d1e8a04ded09c88c714ba047f34f5/argon2_cffi-23.1.0-py3-none-any.whl"
    sha256 "c670642b78ba29641818ab2e68bd4e6a78ba53b7eff7b4c3815ae16abf91c7ea"
  end

  resource "argon2-cffi-bindings" do
    url "https://files.pythonhosted.org/packages/b6/02/d297943bcacf05e4f2a94ab6f462831dc20158614e5d067c35d4e63b9acb/argon2_cffi_bindings-25.1.0-cp39-abi3-macosx_11_0_arm64.whl"
    sha256 "7aef0c91e2c0fbca6fc68e7555aa60ef7008a739cbe045541e438373bc54d2b0"
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

  service do
    run [opt_bin/"omnigent", "server"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omnigent --version")
  end
end
