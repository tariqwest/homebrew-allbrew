cask "hermes-desktop-tap" do
  version "0.7.6"
  sha256 "a3b3890b9f8d66ead9641000f6efae3174ea0a38eeb8fc3e1e5f717f8bb2f533"

  url "https://github.com/fathah/hermes-desktop/releases/download/v0.7.6/hermes-desktop-0.7.6-arm64.dmg"
  name "Hermes One.app"
  desc "Install from https://github.com/fathah/hermes-desktop/releases/download/v0.7.6/hermes-desktop-0.7.6-arm64.dmg"

  livecheck do
    url "https://github.com/fathah/hermes-desktop/releases/download/v0.7.6/hermes-desktop-0.7.6-arm64.dmg"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Hermes One.app"
end
