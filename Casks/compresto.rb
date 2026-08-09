cask "compresto" do
  version "1.28.1"
  sha256 "97bf4576728916fa8228de60b19fb5b3595ed59a478110a7c7aa77e9c43d8bb8"

  url "https://compresto.app/dmg/Compresto-1.28.1.dmg"
  name "Compresto"
  desc "Install from https://compresto.app/dmg/Compresto-1.28.1.dmg"

  livecheck do
    url "https://compresto.app/dmg/Compresto-1.28.1.dmg"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Compresto.app"
end
