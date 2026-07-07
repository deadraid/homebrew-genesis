cask "genesis-desktop" do
  version "0.7.0"

  on_arm do
    sha256 "086f7303a294b6fbf7ce290332a355f6abe5b312a36ef77784d674ed5cf710f4"
    url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/Genesis-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "01ed58c7c719673e65b2c3295423de86b3bb5d81ae6b144331575150b67a7077"
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
