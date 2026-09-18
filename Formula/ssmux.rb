class Ssmux < Formula
  desc "Terminal manager for AWS SSM tunnels"
  homepage "https://github.com/ycchuang99/ssmux"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "72cc544c1142cc4d15680cc90e8f56653dca747633b3a8795f840abb730328ad"
    else
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ee1db3905724d854f30d7f1f71b2d91f162070936cebcef13a635e1813a8c461"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0131035f401acee8561f6e02ae6493b273374be36b6fed47ee3aadfb8cdf0915"
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
