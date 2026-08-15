cask "xirp" do
  version "0.14.0"
  sha256 "ffcec696a3550a7fc131806b1d01781a866f3b4893a4cb7a1f06b085433041d0"

  url "https://xirp.spotify.com/api/latest-download?arch=arm64"
  name "Xirp"
  desc "Install from https://xirp.spotify.com/api/latest-download?arch=arm64"

  livecheck do
    url "https://xirp.spotify.com/api/latest-download?arch=arm64"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Xirp.app"
end
