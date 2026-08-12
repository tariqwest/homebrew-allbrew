cask "thaw-app-thaw" do
  version "1.2.0"
  sha256 "d67f4d31ef9fa057849a98540b810cfa42e0bc66019d3605abd08e45c69aa06f"

  url "https://github.com/thaw-app/Thaw/releases/download/#{version}/Thaw_#{version}.zip"
  name "Thaw"
  desc "The menu bar manager for macOS"
  homepage "https://github.com/thaw-app/Thaw"

  app "Thaw.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/Thaw",
    "~/Library/Caches/Thaw",
    "~/Library/Preferences/Thaw.plist",
  ]
end
