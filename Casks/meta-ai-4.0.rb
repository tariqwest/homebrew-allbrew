cask "meta-ai-4.0" do
  version "4.0"
  sha256 "12659be89b5e10558f9ef74098ffb75ccc55d2b74d23f6753ac9f165d5243858"

  url "https://scontent-iad3-1.xx.fbcdn.net/v/t39.110568-6/801808312_1737475284128724_1267087058662033973_n.dmg/Meta-AI-4.0.dmg?_nc_cat=101&ccb=1-7&_nc_sid=116824&_nc_ohc=UwbWaLljnFIQ7kNvwHhs58E&_nc_oc=AdonKvJmZk0yPRd4h0_4deRf-V8dBDSwiebHINwATsVlf09NKZb0QX-1FcgI-mnqWxY&_nc_zt=14&_nc_ht=scontent-iad3-1.xx&_nc_gid=Qj6vMJvnAz3_JNhDBqZgXw&_nc_ss=7b289&oh=00_AQL23nt1UaS2tGm2T22TpBCks_IkKR4AkMTjHDV5vCnbGA&oe=6AB07FE3"
  name "Meta AI"
  desc "Install from https://scontent-iad3-1.xx.fbcdn.net/v/t39.110568-6/801808312_1737475284128724_1267087058662033973_n.dmg/Meta-AI-4.0.dmg?_nc_cat=101&ccb=1-7&_nc_sid=116824&_nc_ohc=UwbWaLljnFIQ7kNvwHhs58E&_nc_oc=AdonKvJmZk0yPRd4h0_4deRf-V8dBDSwiebHINwATsVlf09NKZb0QX-1FcgI-mnqWxY&_nc_zt=14&_nc_ht=scontent-iad3-1.xx&_nc_gid=Qj6vMJvnAz3_JNhDBqZgXw&_nc_ss=7b289&oh=00_AQL23nt1UaS2tGm2T22TpBCks_IkKR4AkMTjHDV5vCnbGA&oe=6AB07FE3"

  livecheck do
    url "https://scontent-iad3-1.xx.fbcdn.net/v/t39.110568-6/801808312_1737475284128724_1267087058662033973_n.dmg/Meta-AI-4.0.dmg?_nc_cat=101&ccb=1-7&_nc_sid=116824&_nc_ohc=UwbWaLljnFIQ7kNvwHhs58E&_nc_oc=AdonKvJmZk0yPRd4h0_4deRf-V8dBDSwiebHINwATsVlf09NKZb0QX-1FcgI-mnqWxY&_nc_zt=14&_nc_ht=scontent-iad3-1.xx&_nc_gid=Qj6vMJvnAz3_JNhDBqZgXw&_nc_ss=7b289&oh=00_AQL23nt1UaS2tGm2T22TpBCks_IkKR4AkMTjHDV5vCnbGA&oe=6AB07FE3"
    strategy :header_match
    regex(/(\d+(?:\.\d+)+)/)
  end

  app "Meta AI.app"
  zap trash: [
    "~/Library/Application Support/Meta AI",
    "~/Library/Caches/Meta AI",
    "~/Library/Preferences/Meta AI.plist",
  ]
end
