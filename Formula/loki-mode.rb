class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code, Codex CLI, Cline, and Aider"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v7.34.0/loki-mode-7.34.0.tar.gz"
  sha256 "f79fee791a104c3a52362aa2de3bb6a56bdb32a27466807d38df5f239589757f"
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
