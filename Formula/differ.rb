class Differ < Formula
  desc "A CLI tool for diffing directories and files with support for specs"
  homepage "https://github.com/jbonatakis/differ"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-darwin-arm64.tar.gz"
      sha256 "05cff2053f8ffb9079be3b6e174512677d7fcc6917d8a1baee8a436b9a0eafa0"
    else
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-darwin-amd64.tar.gz"
      sha256 "8c603617b528bdabde1c88469ea23d70eee39446ea2654f2996436075140cfd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-linux-arm64.tar.gz"
      sha256 "9f70b55376ddfb37b243e334b15d15bf4f5db68bfd4e22b53954a0a9adbdfc76"
    else
      url "https://github.com/jbonatakis/differ/releases/download/v#{version}/differ-v#{version}-linux-amd64.tar.gz"
      sha256 "4b6b687381ef0a7131421c05099f0591a67fd968d4c7ebc278436defb3d95e1c"
    end
  end

  def install
    bin.install "differ"
  end

  test do
    assert_match "differ", shell_output("#{bin}/differ --help")
  end
end
