cask "atomic-chat" do
  version "2.0.7"
  sha256 "907588dfce4ad43873d23e65dea2e130a64a1a20c8545bd75e2709ae94a02f19"

  url "https://github.com/AtomicBot-ai/Atomic-Chat/releases/download/v#{version}/Atomic.Chat_#{version}_universal.dmg"
  name "Atomic Chat"
  desc "Local AI app and inference engine for agents. Run open-weight LLMs locally — private, 100% offline on your computer. Join our Discord: https://discord.com/invite/8wGSsvmg4V"
  homepage "https://atomic.chat"

  app "Atomic Chat.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/Atomic Chat",
    "~/Library/Caches/Atomic Chat",
    "~/Library/Preferences/Atomic Chat.plist",
  ]
end
