class Blackbird < Formula
  desc "Control plane for durable, dependency-aware planning and execution of AI agents"
  homepage "https://github.com/jbonatakis/blackbird"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "08a102eacd39837e645477fd1a3f53b517ea11a594a2cff2a7686a6f413740d4"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-amd64.tar.gz"
      sha256 "98b8e42df58128dd0b7b2f42e9e2dc61e8608b16642b398aef9e6022c44566f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-arm64.tar.gz"
      sha256 "97f11a5ffd1833f232b38a2f6bc582166a27bc6a77aae1d2adb29755d862a3e2"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-amd64.tar.gz"
      sha256 "914484ad9cab14f4eefc4161589ddad5d89ef3ca9a254c8297b71a49d20c26cf"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
