cask "magic-switch" do
  version "1.1.1"
  sha256 "7c7fe339404fed684af22d9034d1bd11821568ee874e5946669f59074e0088eb"

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
