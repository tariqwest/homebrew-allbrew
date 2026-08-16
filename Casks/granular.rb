cask "granular" do
  version "1.0.0"
  sha256 "169a62025c46d7c582b70d93b4f78494863b8485e193a8db7259c6c41bd87d08"

  url "https://github.com/omarnfarook/granular-releases/releases/latest/download/granular-mac.dmg"
  name "Granular"
  desc "Install from https://github.com/omarnfarook/granular-releases/releases/latest/download/granular-mac.dmg"

  livecheck do
    url "https://github.com/omarnfarook/granular-releases/releases/latest/download/granular-mac.dmg"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Granular.app"
end
