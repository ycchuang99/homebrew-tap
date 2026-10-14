class Ssmux < Formula
  desc "Terminal manager for AWS SSM tunnels"
  homepage "https://github.com/ycchuang99/ssmux"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8bf5976afa350e6cd952b20da74f83830407424e59b23dbc92831f48313f7917"
    else
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c0fa5d934f889234c4ef6213589e037c6d8f5fc8e614faf838648355d8f0fef6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23ebc055fb539188d7dc7914be053113d0f1c8dc4e4d94516199b248b91ff2fb"
    else
      odie "Linux ARM64 is not supported yet"
    end
  end

  depends_on "awscli"

  def install
    bin.install "ssmux"
  end

  def caveats
    <<~EOS
      ssmux also requires the AWS Session Manager Plugin.

      macOS:
        brew install --cask session-manager-plugin
    EOS
  end

  test do
    assert_match "ssmux", shell_output("#{bin}/ssmux --help")
  end
end
