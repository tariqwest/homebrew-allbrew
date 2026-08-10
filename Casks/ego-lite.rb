cask "ego-lite" do
  version "1.0.0"
  sha256 "fb6c3b91171b1b0311d1cbb77461ede92e1e4c657f1c20e99a1601123966aa1e"

  url "https://cdn.ego.app/setup/macos/arm64/egolite.dmg"
  name "ego lite"
  desc "Install from https://cdn.ego.app/setup/macos/arm64/egolite.dmg"

  livecheck do
    url "https://cdn.ego.app/setup/macos/arm64/egolite.dmg"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "ego lite.app"
end
