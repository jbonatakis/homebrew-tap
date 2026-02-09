class Blackbird < Formula
  desc "Control plane for durable, dependency-aware planning and execution of AI agents"
  homepage "https://github.com/jbonatakis/blackbird"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-arm64.tar.gz"
      sha256 "78d080b4770d8a85a2a8dc298fed58ac3b11b6b33dd7cd1edd7df032f1334fe2"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-darwin-amd64.tar.gz"
      sha256 "1ce36cb1092cf691272f2c53f78643de8c764fdd6ab7ef927aa6ebebd08ea06f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-arm64.tar.gz"
      sha256 "a1a51e540b5052d3d052b26bb2a3c8c77d0cdedf88308e7d54c7f5ff94972712"
    else
      url "https://github.com/jbonatakis/blackbird/releases/download/v#{version}/blackbird-v#{version}-linux-amd64.tar.gz"
      sha256 "46b25c1f2419c4e72828fcfa4f3feda63ae3cb0e5fc6b2fa40973cd6eba53cd5"
    end
  end

  def install
    bin.install "blackbird"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/blackbird --version")
  end
end
