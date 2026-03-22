class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "c89f2a4148c73b14f81be60bc34d0d4c6f6f2a32fa067e07216262b7e0a5335d"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "04495eef4dabd49c4567d0943e91e996b0ae4bff3cef88196bda6d13dadcef50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "e79b6b247c1363a547b56161f2390f515a2ae0e12c2ce6bb837f079933b8bd47"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "d473a5d37fb82e3111fbae025dfc2ba4e2342906f7915eee4dc605be14325796"
    end
  end

  def install
    bin.install "genesis"
  end

  test do
    assert_match "genesis #{version}", shell_output("#{bin}/genesis --version")
  end
end
