cask "genesis-desktop" do
  version "0.9.5"

  on_arm do
    sha256 "28c7b3a9606a00c39ed9f462f3bfecb51623e9f80b98e1e0a4af9ac8afc5f7a8"
    url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/Genesis-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "0995c3140715f02f14e5a1c686e21e397cfece8c2173c8a85691b1ff066a36cf"
    url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/Genesis-#{version}-x64.zip"
  end

  name "Genesis"
  desc "Autonomous AI agent desktop app"
  homepage "https://github.com/deadraid/genesis-releases"

  # The CLI is a separate Homebrew formula: `brew install deadraid/genesis/genesis`.
  app "Genesis.app"

  caveats <<~EOS
    Genesis is not signed with an Apple Developer ID. If macOS blocks the first
    launch, clear the quarantine flag:
      xattr -dr com.apple.quarantine "/Applications/Genesis.app"
    or open System Settings > Privacy & Security and click "Open Anyway".
    The frictionless alternative is: curl -fsSL https://raw.githubusercontent.com/deadraid/genesis-releases/main/install-desktop.sh | bash
  EOS
end
