cask "magic-switch" do
  version "1.0.3"
  sha256 "153efd98697f15193b6e655310b8715ca68f2bb732289f72f2702b76e5bf93ee"

  url "https://github.com/byteflare-co/magic-switch/releases/download/v#{version}/MagicSwitch-#{version}.zip"
  name "Magic Switch"
  desc "Switch Magic Keyboard & Trackpad between Macs with one click"
  homepage "https://github.com/byteflare-co/magic-switch"

  depends_on macos: ">= :ventura"

  app "MagicSwitch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MagicSwitch.app"]
  end

  caveats <<~EOS
    This app is not notarized by Apple.
    The quarantine attribute is automatically removed during installation.
    If you still see a Gatekeeper warning, run:
      xattr -cr /Applications/MagicSwitch.app
  EOS

  zap trash: [
    "~/Library/Application Support/MagicSwitch",
    "~/Library/Logs/MagicSwitch",
    "~/Library/Preferences/com.magicswitch.app.plist",
  ]
end
