class LokiMode < Formula
  desc "Autonomous coding agent platform CLI for Claude Code and opencode"
  homepage "https://github.com/asklokesh/loki-mode"
  url "https://github.com/asklokesh/loki-mode/releases/download/v11.191.0/loki-mode-11.191.0.tar.gz"
  sha256 "36e6dbeb8740a057d8105a48660db8e88e071f777c5180495d6f5fba30d7f056"
  license "BUSL-1.1"

  depends_on "node"
  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    # bin/loki is the Bun-aware shim (v7.4.2 BUG-4); link it, not autonomy/loki.
    bin.install_symlink libexec/"bin/loki" => "loki"
  end

  test do
    system "#{bin}/loki", "--version"
  end
end
