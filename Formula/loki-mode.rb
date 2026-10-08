class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code, Codex CLI, Cline, and Aider"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v11.2.2/loki-mode-11.2.2.tar.gz"
  sha256 "935837cd92c98e33fa9679be282ddca678a2f0c6b8ccf5d182ab228a519e6e00"
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
