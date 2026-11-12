cask "lapang" do
  version "0.1.0"
  sha256 "68a6ee1b180522cfee92c50ac94c29730f26edce6044c9791289b741ab232e9d"

  url "https://github.com/afiqsazlan/lapang/releases/download/v#{version}/Lapang-#{version}.zip"
  name "Lapang"
  desc "Menu bar app that keeps an eye on what fills a developer's Mac"
  homepage "https://www.afiqsazlan.com/tools/lapang"

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
