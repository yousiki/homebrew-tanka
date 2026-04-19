cask "tanka" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "82667b0e84e4e0440563b6c0c278e62b0d6b6604f7f62d1b105947200eb9aa93",
         intel: "fa859227587151cadd97edea74217cc6d370ea403cf603c2ee6fa33dadfbbca2"

  url "https://github.com/yousiki/tanka/releases/download/v#{version}/Tanka-#{arch}.dmg"
  name "Tanka"
  desc "Native macOS wrapper for g.tanka.ai"
  homepage "https://github.com/yousiki/tanka"

  auto_updates false
  depends_on macos: ">= :monterey"

  app "Tanka.app"

  caveats <<~EOS
    Tanka is ad-hoc signed (no Apple Developer ID, no notarization), so
    macOS will refuse to launch it until you remove the quarantine xattr:

      xattr -dr com.apple.quarantine "#{appdir}/Tanka.app"
  EOS

  zap trash: [
    "~/Library/Application Support/ai.tanka.desktop",
    "~/Library/Caches/ai.tanka.desktop",
    "~/Library/Preferences/ai.tanka.desktop.plist",
    "~/Library/Saved Application State/ai.tanka.desktop.savedState",
    "~/Library/WebKit/ai.tanka.desktop",
  ]
end
