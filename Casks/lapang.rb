cask "lapang" do
  version "0.1.1"
  sha256 "5b22a22d6230e74f7460f6f56c16227e8f11c29141862a2aa3c0bb5fdef5e0ca"

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
