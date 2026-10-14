cask "ssmux" do
  version "0.2.1"

  on_arm do
    url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-menubar-v#{version}-aarch64-apple-darwin.zip"
    sha256 "33b2efa6a1603ea2a4a4cdf78080a625ba87c0f986cc10226bd6d07d1b138435"
  end

  on_intel do
    url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-menubar-v#{version}-x86_64-apple-darwin.zip"
    sha256 "f34bfafa5bdb550d2ed293e647f6ad37bf42bad8d69738cc1ea985ee60d64831"
  end

  name "ssmux"
  desc "Menu bar controller for AWS Systems Manager sessions"
  homepage "https://github.com/ycchuang99/ssmux"

  depends_on cask: "session-manager-plugin"
  depends_on formula: "awscli"

  app "ssmux-menubar.app"
end
