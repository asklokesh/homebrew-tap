class LokiLoop < Formula
  desc "Multi-agent autonomous startup system for Claude Code"
  homepage "https://github.com/asklokesh/loki-loop"
  url "https://github.com/asklokesh/loki-loop.git", tag: "v4.3.0"
  license "MIT"
  head "https://github.com/asklokesh/loki-loop.git", branch: "main"

  depends_on "bash"
  depends_on "git"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"autonomy/loki"
  end

  def caveats
    <<~EOS
      Loki Loop installed successfully!

      To use with Claude Code:
        claude --dangerously-skip-permissions

      Then say:
        Loki Loop with PRD at ./my-prd.md

      Or run directly:
        loki start ./my-prd.md

      Documentation: https://asklokesh.github.io/loki-loop/
    EOS
  end

  test do
    system "#{bin}/loki", "version"
  end
end
