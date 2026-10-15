class Ssmux < Formula
  desc "Menu bar manager and configuration tools for AWS SSM"
  homepage "https://github.com/ycchuang99/ssmux"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9d5196ba579c30d3527c91ffd239dd17c005eb68dbea4147695bb5134ff95cf4"
    else
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "550cd12a300358505ed4cc52f78f028f53579dfd0f6e919579b7f9907f6111de"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9399f618958502ca9844f1f2f3432de45244d540089bb714389d48670941fa9c"
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
