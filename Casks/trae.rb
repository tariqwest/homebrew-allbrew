cask "trae" do
  version "2.3.61406"
  sha256 "b8064ce3461dd899dbfa6e3b46ebdaf5ae045c1eaad580eff3513947dbc336f8"

  url "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.61406/darwin/Trae-darwin-arm64.dmg"
  name "Trae.app"
  desc "AI-powered IDE from ByteDance"

  livecheck do
    url "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.61406/darwin/Trae-darwin-arm64.dmg"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Trae.app"
end
