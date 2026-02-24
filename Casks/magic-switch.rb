cask "magic-switch" do
  version "1.0.1"
  sha256 "ffa0af8011ba435fa395b880015194824bf79d29d5cb3d71254c330767e87570"

  url "https://github.com/byteflare-co/magic-switch/releases/download/v#{version}/MagicSwitch-#{version}.zip"
  name "Magic Switch"
  desc "Switch Magic Keyboard & Trackpad between Macs with one click"
  homepage "https://github.com/byteflare-co/magic-switch"

  depends_on macos: ">= :ventura"

  app "MagicSwitch.app"

  caveats <<~EOS
    This app is not notarized. On first launch, you may need to:
      1. Right-click MagicSwitch.app → "Open", or
      2. Run: xattr -cr /Applications/MagicSwitch.app
  EOS

  zap trash: [
    "~/Library/Application Support/MagicSwitch",
    "~/Library/Logs/MagicSwitch",
    "~/Library/Preferences/com.magicswitch.app.plist",
  ]
end
