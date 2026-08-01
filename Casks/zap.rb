cask "zap" do
  version "2026.07.09.1"
  sha256 "885281050b501478dd96a2e501f11283ab06a59bb8a9c469cfd32b7fb30eef39"

  url "https://github.com/zerx-lab/zap/releases/download/v#{version}/Zap-arm64.dmg"
  name "Zap"
  desc "Zap is an open, local-first terminal with first-class AI and agent support."
  homepage "https://zap.zerx.dev"

  app "Zap.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/Zap",
    "~/Library/Caches/Zap",
    "~/Library/Preferences/Zap.plist",
  ]
end
