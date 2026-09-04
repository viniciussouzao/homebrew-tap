class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2.1/tidymymac-v1.2.1-darwin-arm64.tar.gz"
    sha256 "f40b28cc921060bab253d289788107cb751e949a4c560bd609b2d0808436b49b"
  else
    url "https://github.com/viniciussouzao/tidymymac/releases/download/v1.2.1/tidymymac-v1.2.1-darwin-amd64.tar.gz"
    sha256 "a669363d2aa18f2bb4a723d8091dab84f90ea89cc4d774241ca78de84e10e7fd"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "tidymymac-darwin-arm64" : "tidymymac-darwin-amd64"
    bin.install binary_name => "tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
