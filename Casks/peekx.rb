cask 'peekx' do
  arch arm: "-arm", intel: "-intel"

  version "1.1"
  sha256 arm: "675bc6fd4c357db5e2fb1ef053d2be8df92bcc397e751abf591810d659a5a733",

  url "https://github.com/altic-dev/PeekX/releases/download/v#{version}/PeekX-#{version}.dmg"
      verified: "github.com/altic-dev/PeekX/"
  name "PeekX"
  desc "A native macOS Quick Look extension that provides instant previews of folder contents, including file counts, size statistics, and detailed folder analysis"
  homepage "https://github.com/altic-dev/PeekX"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :ventura

  app "PeekX.app"
  binary "#{appdir}/PeekX.app/Contents/MacOS/PeekX"

  zap trash: [
    "~/Library/Application Scripts/altic.PeekX*",
    "~/Library/Application Support/PeekX",
    "~/Library/Caches/altic.PeekX",
    "~/Library/Containers/altic.PeekX*",
    "~/Library/Group Containers/altic.PeekX",
    "~/Library/HTTPStorages/altic.PeekX",
    "~/Library/Preferences/altic.PeekX.plist",
    "~/Library/Saved Application State/altic.PeekX.savedState",
  ]
end
