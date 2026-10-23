class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code, Codex CLI, Cline, and Aider"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v11.74.1/loki-mode-11.74.1.tar.gz"
  sha256 "1b993580575befa3d66fa151e204c633805b4a0cab7769792f894842955a8186"
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
