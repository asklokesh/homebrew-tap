class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code and opencode"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v11.121.0/loki-mode-11.121.0.tar.gz"
  sha256 "713b0573608d4e909429bf2bb2dbe78f730945c83a06ceee617e04b29ecf0cb5"
  license "BUSL-1.1"

  depends_on "node"
  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    # bin/loki is the Bun-aware shim (v7.4.2 BUG-4); link it, not autonomy/loki.
    bin.install_symlink libexec/"bin/loki" => "loki"
  end

  test do
    system "#{bin}/loki", "--version"
  end
end
