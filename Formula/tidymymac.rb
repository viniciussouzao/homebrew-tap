class Tidymymac < Formula
  desc "macOS storage cleanup tool with an interactive TUI"
  homepage "https://github.com/viniciussouzao/tidymymac"
  url "https://github.com/viniciussouzao/tidymymac/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7515bf959b73b956ceb967351c7e299cbb3668a53d35f9c770eb72e00d93ced6"
  license "MIT"

  bottle :unneeded

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = %W[
      -s -w
      -X github.com/viniciussouzao/tidymymac/internal/buildinfo.Version=v#{version}
      -X github.com/viniciussouzao/tidymymac/internal/buildinfo.Commit=homebrew
      -X github.com/viniciussouzao/tidymymac/internal/buildinfo.BuildDate=#{time.iso8601}
    ]

    system "go", "build", *std_go_args(ldflags:), "./cmd/tidymymac"
  end

  test do
    assert_match "version: v#{version}", shell_output("#{bin}/tidymymac version")
  end
end
