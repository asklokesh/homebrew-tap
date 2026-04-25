class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code, Codex CLI, and Gemini CLI"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/archive/refs/tags/v7.0.2.tar.gz"
  sha256 "5ceba021e73b5fb1a4b91afd5f6cb0f593667bdf84c95282f13438c0b2fc036a"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"autonomy/loki" => "loki"
  end

  test do
    system "#{bin}/loki", "--version"
  end
end
