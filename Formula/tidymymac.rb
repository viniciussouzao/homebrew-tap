class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  license "MIT"
  version "1.1"

  on_arm do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.1/tidymymac-v1.1-darwin-arm64.tar.gz"
    sha256 "99a8d579695ade919724256cc4bb8245669986ca05231bf123e9b0fae197f798"
  end

  on_intel do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.1/tidymymac-v1.1-darwin-amd64.tar.gz"
    sha256 "e66508ef3e34de82813a611102bcf953b90a2373994ca5107dd943cc5dbfb76a"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tidymymac-darwin-arm64" : "tidymymac-darwin-amd64"
    bin.install binary_name => "tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
