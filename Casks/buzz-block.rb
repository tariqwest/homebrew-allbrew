cask "buzz-block" do
  version "0.5.11"
  sha256 "97074433763b878eb13fa2db6d456bc4735161c6a46c88e79f5d8fadfb3e734a"

  url "https://github.com/block/buzz/releases/download/desktop-v#{version}/Buzz_#{version}_aarch64.dmg"
  name "Buzz"
  desc "A hive mind communication platform"
  homepage "https://github.com/block/buzz"

  app "Buzz.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/Buzz",
    "~/Library/Caches/Buzz",
    "~/Library/Preferences/Buzz.plist",
  ]
end
