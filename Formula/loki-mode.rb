class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code, Codex CLI, and Gemini CLI"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/archive/refs/tags/v6.23.0.tar.gz"
  sha256 "7f10b23422c61225a568095aa2d038cb01d323ac8932a9189bb5ae7b897406b9"
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
