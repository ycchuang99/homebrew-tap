cask "ssmux" do
  version "0.4.0"

  on_arm do
    url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-menubar-v#{version}-aarch64-apple-darwin.zip"
    sha256 "28b0489901697def36e07345431f703fa5fe56182fae955ee3d2c6540a5328e8"
  end

  on_intel do
    url "https://github.com/ycchuang99/ssmux/releases/download/v#{version}/ssmux-menubar-v#{version}-x86_64-apple-darwin.zip"
    sha256 "fa175b7c8750fd0adbaaf99a19d324529c46f8fa6fde81f7a26cfa49c10c58a8"
  end

  name "SSMux"
  desc "Menu bar controller for AWS Systems Manager sessions"
  homepage "https://github.com/ycchuang99/ssmux"

  depends_on cask: "session-manager-plugin"
  depends_on formula: "awscli"

  app "SSMux.app"
end
