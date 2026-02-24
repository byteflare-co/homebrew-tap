cask "magic-switch" do
  version "1.0.1"
  sha256 "68a1c56dc112a963733022e82f11fe242df6d2dd3e9d5b4b1cc71cfb0f4e1661"

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
