cask "unpeel" do
  version "1.0.0"
  sha256 "5f2f356038e93135abf27df3855cd929888f79c8a2e50791186382a5f8e9bc0e"

  url "https://unpeel.com/download/mac"
  name "Unpeel"
  desc "Install from https://unpeel.com/download/mac"

  livecheck do
    url "https://unpeel.com/download/mac"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Unpeel.app"
end
