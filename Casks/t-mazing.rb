cask "t-mazing" do
  version "1.1"
  arch arm: "arm64", intel: "darwin"
  sha256 arm: :no_check

  url "https://download.cdn.srv-hub.org/tm/t-mazing-#{arch}.dmg"
  name "T-Mazing"
  desc "Banking applicatiobs, designed for daily financial management for TBank clients"
  homepage "https://srv-hub.org/"

  depends_on macos: :sonoma

  app "T-Mazing.app"
  binary "#{appdir}/T-Mazing.app/Contents/MacOS/T-Mazing"

  zap trash: [
    "~/Library/Application Scripts/ru.tfinance.tmazing*",
    "~/Library/Application Support/T-Mazing",
    "~/Library/Caches/ru.tfinance.tmazing",
    "~/Library/Containers/ru.tfinance.tmazing*",
    "~/Library/Group Containers/ru.tfinance.tmazing",
    "~/Library/HTTPStorages/ru.tfinance.tmazing",
    "~/Library/Preferences/ru.tfinance.tmazing.plist",
    "~/Library/Saved Application State/ru.tfinance.tmazing.savedState",
  ]
end
