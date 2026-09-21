cask "hidpi" do
  version "042ee688e51d105cd9fabf84690915e75f2074a2"
  sha256 :no_check

  url "https://github.com/titovcode/hidpi.git",
      revision: version,
      using:    :git
  name "hidpi"
  desc "Enable HiDPI modes on physical displays using private CoreGraphics APIs"
  homepage "https://github.com/titovcode/hidpi"

  livecheck do
    skip "No tagged releases"
  end

  depends_on arch: :arm64

  binary ".build/release/hidpi"

  preflight_steps do
    run "/usr/bin/swift",
        args:  ["build", "-c", "release", "--disable-sandbox"],
        chdir: "."
  end
end
