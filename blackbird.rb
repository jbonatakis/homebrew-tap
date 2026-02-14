class Blackbird < Formula
  desc "Control plane for durable, dependency-aware planning and execution of AI agents"
  homepage "https://github.com/jbonatakis/blackbird"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "834b0a2d6c07ce6ca25e7e9808d7fca5f7996eaf31aa0934458f404ad679ea35"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-amd64.tar.gz"
      sha256 "574fdef050894f9bdaa13d40e7fe0c6fbe91005e2b7e43ebe648730f1c8f9dba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-arm64.tar.gz"
      sha256 "1db89edfa7a1ddbd521ef238368e8613b7746eb73844f00e7d73ede524e5d4d7"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-amd64.tar.gz"
      sha256 "5f61179172a15ec5c66bbe7b4b72354dfd8bdaebea08097e95d120e993746bc2"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
