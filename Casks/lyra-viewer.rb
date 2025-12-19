cask "lyra-viewer" do
  version "0.1.2-alpha"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "d8960eb7a75923c8a6aed322600722517ad62ec7d9ca6c4bb93d8c2f900a510d",
         intel: "d3004254309cb388020b1633c1507d81e4406f3be49256818975dd90af9e76aa"

  url "https://github.com/amaurote/Lyra/releases/download/v#{version}/LyraViewer-macos-#{arch}.zip"
  name "Lyra Viewer"
  desc "Lyra Viewer (SDL3 + SkiaSharp image viewer)"
  homepage "https://github.com/amaurote/Lyra"

  livecheck do
    skip "Development/pre-release builds are version-pinned."
  end

  depends_on formula: "sdl3"
  depends_on formula: "openexr"
  depends_on formula: "libheif"
  depends_on formula: "libde265"

  # Zips contain: LyraViewer-arm.app / LyraViewer-intel.app
  app "LyraViewer-#{arch}.app", target: "LyraViewer.app"

  zap trash: [
  "~/Library/Preferences/com.nineveh.lyraviewer.plist",
  "~/Library/Saved Application State/com.nineveh.lyraviewer.savedState",
  "~/.local/share/LyraViewer",
  ]
end