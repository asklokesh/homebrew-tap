class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode.git", tag: "v4.2.0"
  license "MIT"

  depends_on "bash"
  depends_on "git"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"autonomy/loki"
  end

  def caveats
    <<~EOS
      Loki Mode has been installed!

      Usage:
        loki start [PRD]    - Start Loki Mode
        loki status         - Check status
        loki --help         - Show all commands

      Or in Claude Code:
        claude --dangerously-skip-permissions
        Then say: "Loki Mode"
    EOS
  end

  test do
    system "#{bin}/loki", "version"
  end
end
