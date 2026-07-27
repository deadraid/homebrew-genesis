cask "genesis-desktop" do
  version "0.9.1"

  on_arm do
    sha256 "811acb1291824686d3e57b5dd80c05c2b8b019062fc4e3f09b99249e7635da36"
    url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/Genesis-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "b672f8ad828fcf9a121a36c2e89006b0c77435a3f2ae4907938acd09ebc38593"
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
