cask "pyqt-openai" do
  version "1.8.1"
  sha256 "10aa1660cf1a596c980f29d500b1b3eafd4ed307dc48ce81f7353f7bb35b4ed6"

  url "https://github.com/yjg30737/pyqt-openai/releases/download/v#{version}/VividNodeSetup.dmg"
  name "VividNodeSetup"
  desc "VividNode: Multi-purpose Text & Image Generation Desktop Chatbot (supporting various models including GPT)."
  homepage "https://github.com/yjg30737/pyqt-openai"

  app "VividNodeSetup.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/VividNodeSetup",
    "~/Library/Caches/VividNodeSetup",
    "~/Library/Preferences/VividNodeSetup.plist",
  ]
end
