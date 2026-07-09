class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code, Codex CLI, Cline, and Aider"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v7.127.0/loki-mode-7.127.0.tar.gz"
  sha256 "52f61a72a2e594a4112e63f9633bb6ff25fca409cc93894f8cb1181da883a6a4"
  license "BUSL-1.1"

  depends_on "node"
  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    # v7.4.2 fix (BUG-4): bin/loki is the Bun-aware shim that routes
    # ported commands to Bun and falls through to autonomy/loki for
    # everything else. Linking bin/loki (NOT autonomy/loki) is
    # required for brew users to get the Phase 2/3+ Bun route.
    bin.install_symlink libexec/"bin/loki" => "loki"
  end

  test do
    system "#{bin}/loki", "--version"
  end
end
