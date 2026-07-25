cask "mcp-router" do
  version "0.6.3"
  sha256 "2282c9b9ada119eb9fb396d4835a6c78ce465e6b407f3c87b1de25eafd447087"

  url "https://github.com/mcp-router/mcp-router/releases/download/v#{version}/MCP-Router.dmg"
  name "MCP-Router"
  desc "A Unified MCP Server Management App (MCP Manager)."
  homepage "https://mcp-router.net"

  app "MCP Router.app"

  livecheck do
    url :head
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Application Support/MCP-Router",
    "~/Library/Caches/MCP Router",
    "~/Library/Preferences/MCP Router.plist",
  ]
end
