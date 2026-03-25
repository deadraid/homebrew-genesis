class Genesis < Formula
  desc "Universal autonomous AI agent with multi-agent swarm execution"
  homepage "https://github.com/deadraid/genesis"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-aarch64.tar.gz"
      sha256 "95d6740859cde7a01b42bead69c0c5a32acf53e69f30bc5952366934df4fdce1"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-macos-x86_64.tar.gz"
      sha256 "73567ede7e286dc27bf606c2773899824fd01b08140db7c403d7db4ef03ac761"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-aarch64.tar.gz"
      sha256 "c628ffbd356682c911b7a30874d48feda5e8529b25b39afd1fab02a8a5f4b637"
    else
      url "https://github.com/deadraid/genesis/releases/download/v#{version}/genesis-linux-x86_64.tar.gz"
      sha256 "fb2d173132f142a99f9ae3c9b00308e4903de4acc0ed7f91ef80cad9ff2b7e59"
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
