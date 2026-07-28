class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis-releases"
  version "0.9.2"
  license :cannot_represent # Proprietary — see https://github.com/deadraid/genesis-releases

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "9b73a22129ee8adf5c87e405464006248a1bf53c016d656c0fdb1199af2814f5"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "7dd890df08232cdc19723ae27dffd38a9994e7cd1553dd80f56f6d2344424fe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "1746a2d33d26818477ba1b52f08119b78a60e976e84dd5a0ab6ededddac305ec"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "d438ed601e1ebde4ea6b6173d14582a3d69bf10f4c44fd5aa57e4ba17a3c990c"
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
