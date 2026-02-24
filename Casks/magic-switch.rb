cask "magic-switch" do
  version "1.1.0"
  sha256 "931fab394c7427026d5bea1af197a2698bdcac038a0c56f3f3a3c9db4a63b2fd"

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
