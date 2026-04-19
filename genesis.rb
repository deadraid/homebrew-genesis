class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "63ec6ed2dd1aa28c8b6247c7ed857be19a7f4c5014ee8fc773f33e3bc12706ce"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "e5b1ea45720a352b884f25fa72943ce163fcaa031e6dd975a30e7dac499f0442"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "3d43cc430001e7ed6fda126f0f58a94e72dd430b3eac821f51528a4fd022f0e0"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "f5e21c723ce7cc03fa2ac7cf9e36049982e56e7900071a38c9248faad3325bfc"
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
