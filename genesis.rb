class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "3ac3834c6a0e467265485d79838d1d92ea120579e1262331d2010d349300beea"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "3065a9327cf93455f06c574685f51947be6d03419496b845782de8bafc9708a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "5d76c66488b675c3cae7c936499cc46dd250d5c87e3a90a7fd11ab850b07d227"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "6bee89689e3a0e79ec16c2b9e4f0fe08fb5e39725d75a81c4ad2029eeedf4b41"
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
