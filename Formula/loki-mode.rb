class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code and opencode"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v11.185.0/loki-mode-11.185.0.tar.gz"
  sha256 "0e9252f09960469226934dd89c01b5432465b6742df27dea7d0cd9527f2a8aa8"
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
