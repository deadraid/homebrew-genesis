class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis"
  version "0.6.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "d8f29fefca52651f263159b22aeca267b79f2450fcf579d750d4fd5ee4deecc3"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "7070dcdb962d7bd862ce42d424811b81505d30141483b9c2cc9bc26c0718134c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "be95d9601c6aa52263ff2dff8b12b50b084d6a6e35e575bb2bac3a178c1939c4"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "9f9d2871cc803d45b44814ccbc5a821283a028130e6acf8447d4cc5a7be10493"
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
