class LokiMode < Formula
  desc "Multi-agent autonomous startup system - Claude Code, Codex CLI, Gemini CLI"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode.git", tag: "v5.1.3"
  license "MIT"

  depends_on "bash"
  depends_on "git"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"autonomy/loki"
  end

  def caveats
    <<~EOS
      Loki Mode v5.1.3 installed!

      Multi-Provider Support:
        - Claude Code (full features)
        - OpenAI Codex CLI (degraded mode)
        - Google Gemini CLI (degraded mode)

      Usage:
        loki start [PRD]              - Start with Claude (default)
        loki start --provider codex   - Start with Codex
        loki start --provider gemini  - Start with Gemini
        loki status                   - Check status
        loki --help                   - Show all commands

      Docs: https://asklokesh.github.io/loki-mode/
    EOS
  end

  test do
    system "#{bin}/loki", "version"
  end
end
