class Differ < Formula
  desc "A CLI tool for diffing directories and files with support for specs"
  homepage "https://github.com/jbonatakis/differ"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-darwin-arm64.tar.gz"
      sha256 "efcaba7b9886c588ec3482904ba8df89dc43a0a8d39d9d68c8e4a599f79f614b"
    else
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-darwin-amd64.tar.gz"
      sha256 "5f982b0f62ea729acf2eb4bae2f9b4d4dad1ae0d0fee293e9d3187533712ae2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-linux-arm64.tar.gz"
      sha256 "77e3ba3409a38bf0e02580b0620654b86f2b2bde31f0cc585cf7d71d8f43920b"
    else
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-linux-amd64.tar.gz"
      sha256 "125e6739295169b05d6655e738991f40708b78d87df3cbc75008ee0241eb27e8"
    end
  end

  def install
    bin.install "differ"
  end

  test do
    assert_match "differ", shell_output("#{bin}/differ --help")
  end
end
