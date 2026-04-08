class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  license "MIT"
  version "0.1.0"

  on_arm do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v0.1.0/tidymymac-v0.1.0-darwin-arm64.tar.gz"
    sha256 "e4db0a88f3fa7ff03b806fd0875029f7136f5c98077bbdf4f329965a053b8e2d"
  end

  on_intel do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v0.1.0/tidymymac-v0.1.0-darwin-amd64.tar.gz"
    sha256 "0cc5e61846329af349bb34c674c4ebabe11bda7b1b2c0bbb96735ac0dbfecfa1"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tidymymac-darwin-arm64" : "tidymymac-darwin-amd64"
    bin.install binary_name => "tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
