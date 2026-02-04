class Blackbird < Formula
  desc "Blackbird CLI"
  homepage "https://github.com/jbonatakis/blackbird"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "b89b9a987c6e7a2cc0b10136318bbe67c0de96e456399bd720165786108598d7"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-amd64.tar.gz"
      sha256 "b110190957f844834034b9ce6b7594fc987a97fb14234df9a221ef10e71ce928"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-arm64.tar.gz"
      sha256 "3b9c807504aa1269766f97d75fc0f4726af7ef7241fff9f144e3caccfb2ba4ee"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-amd64.tar.gz"
      sha256 "94a662428bed71ad6689908597e90bf9ca7cf400ddad0a98dfd2650ee922d459"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end

