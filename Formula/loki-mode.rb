class LokiMode < Formula
  desc "DEPRECATED: Use loki-loop instead. Multi-agent autonomous startup system."
  homepage "https://github.com/asklokesh/loki-loop"
  url "https://github.com/asklokesh/loki-loop.git", tag: "v4.3.0"
  license "MIT"

  deprecate! date: "2026-01-23", because: "renamed to loki-loop"

  depends_on "bash"
  depends_on "git"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"autonomy/loki"
  end

  def caveats
    <<~EOS
      WARNING: loki-mode has been renamed to loki-loop!

      Please migrate:
        brew uninstall loki-mode
        brew install loki-loop

      The loki command will continue to work.
    EOS
  end

  test do
    system "#{bin}/loki", "version"
  end
end
