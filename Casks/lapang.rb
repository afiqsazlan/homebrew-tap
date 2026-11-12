cask "lapang" do
  version "0.2.1"
  sha256 "2b9c969b7a8465ab1e2e34786e73b12a6e5cecd4a4c387609f353317559d6a53"

  url "https://github.com/afiqsazlan/lapang/releases/download/v#{version}/Lapang-#{version}.zip"
  name "Lapang"
  desc "Menu bar app that keeps an eye on what fills a developer's Mac"
  homepage "https://afiqsazlan.com/tools/lapang"

  livecheck do
    url "https://www.afiqsazlan.com/lapang/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Lapang.app"
  binary "#{appdir}/Lapang.app/Contents/MacOS/Lapang", target: "lapang"

  uninstall quit: "com.afiqsazlan.lapang"

  zap trash: [
    "~/.config/lapang",
    "~/Library/Application Support/Lapang",
    "~/Library/Caches/com.afiqsazlan.lapang",
    "~/Library/HTTPStorages/com.afiqsazlan.lapang",
    "~/Library/Preferences/com.afiqsazlan.lapang.plist",
  ]
end
