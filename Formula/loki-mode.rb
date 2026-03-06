class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code, Codex CLI, and Gemini CLI"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/archive/refs/tags/v6.10.0.tar.gz"
  sha256 "cd37405beab82187e4cbe0b23d641de208f8e42a55028872c9c32750a44e0f3b"
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
