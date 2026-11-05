cask "ray" do
  version "0.8.6"
  sha256 "d511c7c1a9b38bee91e0d166d1aa1a555bfebf969df51bd8e4afb05ce4034b6c"

  url "https://github.com/shanuflash/ray/releases/download/v#{version}/Ray-#{version}.dmg"
  name "Ray"
  desc "Browser with Arc's sidebar on de-Googled Chromium"
  homepage "https://github.com/shanuflash/ray"

  livecheck do
    url "https://github.com/shanuflash/ray/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Ray.app"

  uninstall quit: "dev.shanus.ray"

  zap trash: [
    "~/Library/Application Support/Ray",
    "~/Library/Caches/dev.shanus.ray",
    "~/Library/Caches/Ray",
    "~/Library/HTTPStorages/dev.shanus.ray",
    "~/Library/Preferences/dev.shanus.ray.plist",
    "~/Library/Saved Application State/dev.shanus.ray.savedState",
  ]

  caveats <<~EOS
    Ray isn't notarized by Apple, so macOS blocks its first open:
      macOS 14: right-click Ray in Applications, then Open.
      macOS 15 and later: open Ray once, then
        System Settings › Privacy & Security › Open Anyway.
    Ray updates itself after that.
  EOS
end
