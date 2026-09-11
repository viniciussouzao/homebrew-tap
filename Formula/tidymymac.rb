class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2.2/tidymymac-v1.2.2-darwin-arm64.tar.gz"
    sha256 "93eb58d5a2ab6a5bf50f2246c327f40921f5716a415b40c2194eb038db040f04"
  else
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2.2/tidymymac-v1.2.2-darwin-amd64.tar.gz"
    sha256 "7cbb1b009edbb6a93132f5754ce88a43611ba40cbb2866108a1a7e1b2c2f4a8b"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tidymymac-darwin-arm64" : "tidymymac-darwin-amd64"
    bin.install binary_name => "tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
