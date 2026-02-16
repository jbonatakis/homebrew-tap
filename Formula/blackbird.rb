class Blackbird < Formula
  desc "Control plane for durable, dependency-aware planning and execution of AI agents"
  homepage "https://github.com/jbonatakis/blackbird"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "8e3ef07d4dacd55ad9c8685b94b738e6c0864ebef70b6f0b90baf66811ccd355"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-amd64.tar.gz"
      sha256 "8e7d0464cb1c3415b0a1ebd031df159de62ded3756f4a9ed4baa440e0c99fe79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-arm64.tar.gz"
      sha256 "e2c71b2b9fecaf9dfd141673b9d832b04a0f65d6ee49bc1fceccebaf05688033"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-amd64.tar.gz"
      sha256 "9291851aecf8b728d45b6725133df6dbf5c3f6e4272b72f2c381fde9635b5ba8"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
