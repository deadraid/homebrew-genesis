cask "genesis-desktop" do
  version "0.9.2"

  on_arm do
    sha256 "dbe45841c5c08a79e3343024a968dea32acf8e1a47cfbe2e2621cca1c4905768"
    url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/Genesis-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "58779aae9b583becdd681bcdabbbeeb89419c243b2e982b482b58b1e0ba5699f"
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
