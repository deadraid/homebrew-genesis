class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis-releases"
  version "0.9.0"
  license :cannot_represent # Proprietary — see https://github.com/deadraid/genesis-releases

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "63b14a53147ef7219ddd4ceb4276338dc7adfa8a309ca2ae50ce055afe4f0012"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "bc5d760b41a6a2fb91133b78936922e52f0c789aa7b64678353d9e68e3eb9621"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "2deebb14c54727adcf11009c7330084c9c932fdf1a9079c03faddf632e937ad0"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "9dcac7b9cd24a19b897139f8744b4266bbc771df19d0141a5866e33b15ff5d58"
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
