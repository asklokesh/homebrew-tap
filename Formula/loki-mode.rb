class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code, Codex CLI, and Gemini CLI"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/archive/refs/tags/v6.67.3.tar.gz"
  sha256 "a2dab711c74717886d5a090612fc473fce24831094aa484e6e07fd60aa686a30"
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
