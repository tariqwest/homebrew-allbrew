cask "networkspy" do
  version "1.2.7"
  sha256 "6ff62476492698c807e326f7abca5f2bd5a0afcff9ab792a644a924c613b6cae"

  url "https://github.com/NetworkSpyHQ/NetworkSpy/releases/download/v#{version}/Network.Spy_#{version}_aarch64.dmg"
  name "Network Spy"
  desc "Developer's favourite HTTP Traffic Debugger with Supercharged Viewer."
  homepage "https://networkspy.app"

  app "Network Spy.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/Network Spy",
    "~/Library/Caches/Network Spy",
    "~/Library/Preferences/Network Spy.plist",
  ]
end
