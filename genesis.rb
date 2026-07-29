class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis-releases"
  version "0.9.3"
  license :cannot_represent # Proprietary — see https://github.com/deadraid/genesis-releases

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "0eb8a8c4a8a77702dc790eac4b1d201fec529517e145a2c0d99462268b0f5dab"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "7cabb44e2d2b05a67feec7add973b28313831f01a2c315e492e710e2be953c42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "957abecd7c07e773703439c100d96d1b20682f3e5b6e51275165b50eb1eb585c"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "ec3ec6d0e98bb01629555b9340b34fa7ccb18c4293f8f97bda2d3518ef0a3dab"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "macos" : "linux"
    bin.install "genesis-#{os}-#{arch}" => "genesis"
  end

  test do
    assert_match "genesis #{version}", shell_output("#{bin}/genesis --version")
  end
end
