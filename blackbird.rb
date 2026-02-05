class Blackbird < Formula
  desc "Control plane for durable, dependency-aware planning and execution of AI agents"
  homepage "https://github.com/jbonatakis/blackbird"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "Not"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-amd64.tar.gz"
      sha256 "03f5682bb3c4ed0f1ec4d74afcabb990bdcfa5173a0a0e5e7275b80c17b6b158"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-arm64.tar.gz"
      sha256 "1d8067f32c1ec043d2323c720f04b4be61ce25514760749755b2fa292d278eb3"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-amd64.tar.gz"
      sha256 "12738bfe9e368fe8843fe21ca1c22e15734f481bb7af5371c6f1d3073305c89c"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
