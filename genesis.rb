class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis-releases"
  version "0.9.4"
  license :cannot_represent # Proprietary — see https://github.com/deadraid/genesis-releases

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "f6df20e6fa8829561728582f3cd60d6ec27a5ddfc3714745e7c1cdedea632bdf"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "c77f0fd9d3955ef0641871ee92b16ee22021fe84bfe91a81b0bbf6cd1f0486a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "65c06f172d36ce740e6c3a8e01f13920beb7e91ba4c90a92b436bf955127da29"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "f8ce927c2e809849dbcf5e3347f08addac8d2b19f013f7976ad63339340e3732"
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
