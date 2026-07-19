cask "genesis-desktop" do
  version "0.8.1"

  on_arm do
    sha256 "0364464c61fc3af7e6f8a260da4906dce4df4f377da56f88d0d908e00154cef1"
    url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/Genesis-#{version}-arm64.zip"
  end
  on_intel do
    sha256 "868ae972497f84b7d93ba3fa6783a2d634b242c974b8c2e63e5c57ecda7002c6"
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
