class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code and opencode"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v11.146.0/loki-mode-11.146.0.tar.gz"
  sha256 "1f42c08ea668fbe6bdb8a45b379d29a0c13f3a90b3a43c409ea7608ef24ae764"
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
