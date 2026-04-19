class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code, Codex CLI, and Gemini CLI"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/archive/refs/tags/v6.80.0.tar.gz"
  sha256 "cdface431bb8189d9727348974c462be2294bbf5ed21b090152f5ef736afa193"
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
