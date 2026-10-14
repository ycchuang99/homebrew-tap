cask "ssmux" do
  version "0.3.0"

  on_arm do
    url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-menubar-v#{version}-aarch64-apple-darwin.zip"
    sha256 "6769fd1af1bf2408348dd7c3250be32e8f26f6794749b20d50e5e5824cd38809"
  end

  on_intel do
    url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-menubar-v#{version}-x86_64-apple-darwin.zip"
    sha256 "4bac2e6475ab57009d7e3bac817665f08a6b278c5eef698fe7c2a846d7927872"
  end

  name "ssmux"
  desc "Menu bar controller for AWS Systems Manager sessions"
  homepage "https://github.com/ycchuang99/ssmux"

  depends_on cask: "session-manager-plugin"
  depends_on formula: "awscli"

  app "SSMux.app"
end
