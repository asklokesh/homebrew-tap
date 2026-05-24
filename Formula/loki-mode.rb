class LokiMode < Formula
  desc "Multi-agent autonomous startup system for Claude Code, Codex CLI, and Gemini CLI"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/archive/refs/tags/v7.7.11.tar.gz"
  sha256 "0b23d524bbfb06d7c8cfb1d666f1daf4f5b2537a0ec59cb6bf72060a23aa44b1"
  license "MIT"

  depends_on "node"
  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    # v7.4.2 fix (BUG-4): bin/loki is the Bun-aware shim that routes
    # ported commands to Bun and falls through to autonomy/loki for
    # everything else. Linking bin/loki (NOT autonomy/loki) is
    # required for brew users to get the Phase 2/3+ Bun route.
    bin.install_symlink libexec/"bin/loki" => "loki"
  end

  test do
    system "#{bin}/loki", "--version"
  end
end
