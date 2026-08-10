cask "popclip-tap" do
  version "2026.7.1"
  sha256 :no_check

  url "https://setapp.com/apps/popclip"
  name "PopClip"
  desc "Install from https://setapp.com/apps/popclip"
  homepage "https://setapp.com/apps/popclip"

  livecheck do
    url "https://setapp.com/apps/popclip"
    regex(/Version\s+(\d+(?:\.\d+)+)/i)
  end

  depends_on formula: "setapp-cli"
  depends_on cask: "setapp"

  caveats <<~EOS
    Requires an active Setapp subscription and being signed in to Setapp.
  EOS

  installer script: {
    executable: "setapp-cli",
    args: ["install", "PopClip"],
  }

  uninstall script: {
    executable: "setapp-cli",
    args: ["remove", "PopClip"],
  }

  zap trash: [
    "~/Library/Application Support/PopClip",
  ]
end
