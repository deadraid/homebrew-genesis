class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis-releases"
  version "0.9.7"
  license :cannot_represent # Proprietary — see https://github.com/deadraid/genesis-releases

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "1f4ac47c386bfbe1a552959456e36e551b9339652eb8a8656e2f085131320375"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "ee729636c8e0535b2c186d164b03048582bf8c8268f6423b330e7839744e50df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "f571f0b2666545156518429d080fead66d2c6f999038d62a66ae22d95bae4918"
    else
      url "https://github.com/deadraid/genesis-releases/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "2f2b862fda38d696e60830f0257c0fd679793614297e84f2321f369b6f6f7629"
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
