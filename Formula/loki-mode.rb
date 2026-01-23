class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode.git", tag: "v4.2.0"
  license "MIT"
  head "https://github.com/asklokesh/loki-mode.git", branch: "main"

  depends_on "bash"
  depends_on "git"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"autonomy/loki"
  end

  def caveats
    <<~EOS
      Loki Mode installed successfully!

      To use with Claude Code:
        claude --dangerously-skip-permissions

      Then say:
        Loki Mode with PRD at ./my-prd.md

      Or run directly:
        loki start ./my-prd.md

      Documentation: https://asklokesh.github.io/loki-mode/
    EOS
  end

  test do
    system "#{bin}/loki", "version"
  end
end
