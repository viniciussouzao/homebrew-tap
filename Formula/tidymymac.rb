class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  license "MIT"
  version "1.0.0"

  on_arm do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.0.0/tidymymac-v1.0.0-darwin-arm64.tar.gz"
    sha256 "88e1cb74b4c3cf5aa2fc9f018c3ec25c47fc2f0de48a25cf43500ebaa003447f"
  end

  on_intel do
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.0.0/tidymymac-v1.0.0-darwin-amd64.tar.gz"
    sha256 "574a0a379b7bbfaf3b6bd4e03f0ed4ddd6dc7241776c5d3209f5f8943397038f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tidymymac-darwin-arm64" : "tidymymac-darwin-amd64"
    bin.install binary_name => "tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
