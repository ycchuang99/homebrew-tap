class Ssmux < Formula
  desc "Terminal manager for AWS SSM tunnels"
  homepage "https://github.com/ycchuang99/ssmux"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "99340e51aec1a05b5bfa28bdb2b2bfdd505ca8dd69cfbbfa1eea8ec947fe4932"
    else
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1886f848017751beba1b514e6d7bfdb2711ac9d64f7e4a281722f6da49bf642c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e46ee440e061e19c97807f01a63a66f6e3dfb0833ac59ff8a50b68ddde35fa86"
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
