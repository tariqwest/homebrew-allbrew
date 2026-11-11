cask "memmy-agent" do
  version "1.2.6"
  sha256 "c7f81a8b78844d98e1c8a8b4973230ec4830f3b183d643a77586bc221a90f1b3"

  url "https://github.com/MemTensor/memmy-agent/releases/download/v#{version}/Memmy-#{version}-darwin-arm64-cn-signed.dmg"
  name "Memmy"
  desc "🍙  A personal AI agent & local memory hub for all AI agents, gives every AI one shared, fully controlled memory and persistent context — all AI remember the same you. Now supports Claude Code, Codex, OpenClaw and Hermes Agent etc."
  homepage "https://memmy.bot"

  app "Memmy.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/Memmy",
    "~/Library/Caches/Memmy",
    "~/Library/Preferences/Memmy.plist",
  ]
end
