class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2.2/tidymymac-v1.2.2-darwin-arm64.tar.gz"
    sha256 "9d3e657ddf1c2aa6fe289d4b482a7be164e524ac8a2f3c91172e28a4ac580c13"
  else
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2.2/tidymymac-v1.2.2-darwin-amd64.tar.gz"
    sha256 "45934744f49a8327eec10c2cc5b6f6fca9deb7740b2100476aa6dbc2c5fff2b0"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tidymymac-darwin-arm64" : "tidymymac-darwin-amd64"
    bin.install binary_name => "tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
