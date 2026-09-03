class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  license "MIT"
  version "1.2"

  on_arm do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2/tidymymac-v1.2-darwin-arm64.tar.gz"
    sha256 "ae5ad97ac7d60eff063e08db526b39b15699ea47e762538dcdc0498bfe9b5bec"
  end

  on_intel do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2/tidymymac-v1.2-darwin-amd64.tar.gz"
    sha256 "40a78f59c2bc90ec7ad444f15addb901c3761b90e8254a0ef7aedac248393ace"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tidymymac-darwin-arm64" : "tidymymac-darwin-amd64"
    bin.install binary_name => "tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
