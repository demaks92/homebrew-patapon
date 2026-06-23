# typed: strict
# frozen_string_literal: true

# Installs the macOS patched font installer script.
class FontPatcher < Formula
  desc "Patch fonts with Nerd Fonts glyphs on macOS"
  homepage "https://github.com/elky92/homebrew-private"
  url "file://#{File.expand_path("../scripts/font-patcher", __dir__)}"
  version "0.1.0"
  sha256 "79f5083b6fe71b355e9cf2b07a03c35d92a926e04505499c119b55a69fc7add3"

  depends_on "fontforge"
  depends_on :macos

  def install
    bin.install cached_download => "font-patcher"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/font-patcher --help")
  end
end
