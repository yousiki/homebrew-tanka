# yousiki/homebrew-tanka

Homebrew tap for [Tanka](https://github.com/yousiki/tanka), a native macOS
wrapper around <https://g.tanka.ai>.

## Install

```sh
brew install --cask yousiki/tanka/tanka
```

The cask is unsigned (ad-hoc signed, not notarized — we don't pay for an
Apple Developer ID). After install, run:

```sh
xattr -dr com.apple.quarantine /Applications/Tanka.app
```

The cask prints this instruction in its `caveats`.

## How this tap is maintained

`Casks/tanka.rb` is published automatically by the main repo's
[release workflow](https://github.com/yousiki/tanka/blob/main/.github/workflows/release.yml).
Every time a `v*` tag is pushed on `yousiki/tanka`:

1. CI builds arm64 and x86_64 DMGs.
2. A `tanka.rb` is rendered with the real SHA256 of each DMG.
3. The workflow pushes that file to this repo as `Casks/tanka.rb`.

Don't hand-edit `Casks/tanka.rb` — the next release will overwrite it.
