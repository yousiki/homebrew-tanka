cask "tanka" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "5a1f238beab75150349819d82bb403ed89cdbbd07e2ab0ed793ab98cedc6ba78",
         intel: "2f1c08586da8e26436e7df9d7fedf4f1ee95846bc7187738b91f2e43a76a255b"

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
