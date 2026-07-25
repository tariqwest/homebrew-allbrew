class AgyAcp < Formula
  desc "Fork from https://github.com/openabdev/openab/tree/main/agy-acp with additional fixes"
  homepage "https://github.com/tariqwest/agy-acp"
  head "https://github.com/tariqwest/agy-acp.git", branch: "main"

  livecheck do
    url "https://crates.io/api/v1/crates/agy-acp"
    regex(/"(?:max_stable_version|newest_version)"\s*:\s*"v?([^"\\]+)"/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agy-acp --version")
  end
end
