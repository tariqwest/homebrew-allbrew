cask "latest-tap" do
  version "1.0.0"
  sha256 "5d3ff1cf3c25028a8a833b928d8466397151bba40e02e3694180c4c67dada294"

  url "https://static.ampcode.com/mac/latest.dmg"
  name "Amp"
  desc "Install from https://static.ampcode.com/mac/latest.dmg"

  livecheck do
    url "https://static.ampcode.com/mac/latest.dmg"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Amp.app"
  zap trash: [
    "~/Library/Application Support/Amp",
    "~/Library/Caches/Amp",
    "~/Library/Preferences/Amp.plist",
  ]
end
