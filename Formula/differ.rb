class Differ < Formula
  desc "A CLI tool for diffing directories and files with support for specs"
  homepage "https://github.com/jbonatakis/differ"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-darwin-arm64.tar.gz"
      sha256 "6bb1763769bcc7fbb230904269e77f4077f7ef9be9ec911fee61c82266b703c8"
    else
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-darwin-amd64.tar.gz"
      sha256 "d44f3004e2fb0b9facfabaa53f077c83454c56c68d3945f8cceb26c059364f4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-linux-arm64.tar.gz"
      sha256 "ea8c08a65d5bbede25933192627676312ede57593220ff77a5b1e0c1ac3b2e65"
    else
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-linux-amd64.tar.gz"
      sha256 "beda3f2942526720626291bf89d6a4f3cfeec9a96dfa0ac7c38c8d8dc1b70507"
    end
  end

  def install
    bin.install "differ"
  end

  test do
    assert_match "differ", shell_output("#{bin}/differ --help")
  end
end
