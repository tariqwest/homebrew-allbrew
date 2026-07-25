cask "omniroute" do
  version "3.8.48"
  sha256 "a995068f77a910d9a0d3bbb2513f95a609a8bd1e9d10f57b79e6e4495acf0153"

  url "https://github.com/diegosouzapw/OmniRoute/releases/download/v#{version}/OmniRoute-3.8.48-arm64.dmg"
  name "OmniRoute"
  desc "Never stop coding. Free MIT AI gateway: one endpoint, 290+ providers (90+ free), 500+ models — Kimi, Claude, GPT, OpenAI, Gemini, GLM, DeepSeek, MiniMax. Works with Claude Code, Codex, Cursor, OpenCode, Cline & Copilot. Quota-aware auto-fallback, RTK+Caveman compression saves 15-95% tokens, MCP/A2A, Desktop/PWA. Built by 500+ contributors"
  homepage "https://omniroute.online"

  app "OmniRoute.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/OmniRoute",
    "~/Library/Caches/#{name}",
    "~/Library/Preferences/#{name}.plist",
  ]
end
