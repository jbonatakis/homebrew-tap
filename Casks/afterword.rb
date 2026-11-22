cask "afterword" do
  version "0.18.0"
  sha256 "c5e2793471e2e4b37c613bcc7ecde98700f8033e1f13d96caf910b5a67e56710"

  url "https://github.com/jbonatakis/homebrew-tap/releases/download/afterword-v#{version}/Afterword-v#{version}-macOS-arm64.zip"
  name "Afterword"
  desc "Record and transcribe calls locally"
  homepage "https://github.com/jbonatakis/homebrew-tap/releases/tag/afterword-v#{version}"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Afterword.app"
end
