class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis"
  version "0.5.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "e41a6585901f0bae855c47aab9bd940915670d5360bed3b6bec7d46bd1052373"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "e4c995b582c13244123cf400a11ff923e1d1464c59aed740ed2da6b528d02680"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "8782a2c6f745299a73204a1f2a8892b6c7dac7e714fb133625f5c652272f69c9"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "a5daf3a3cb7e5701ae099db29f694d012ab35cea5fd72122fe73c27a680f71e6"
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
