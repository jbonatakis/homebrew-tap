require_relative "../lib/afterword_release_download_strategy"

cask "afterword" do
  version "0.17.0"
  sha256 "c2c8f0cc02fcce6101035c70dc7a759f30ef7354a0b2ceab93c8b70ebf61c40b"

  url "https://github.com/jbonatakis/afterword/releases/download/v#{version}/Afterword-v#{version}-macOS-arm64.zip",
      using: AfterwordReleaseDownloadStrategy
  name "Afterword"
  desc "Record and transcribe calls locally"
  homepage "https://github.com/jbonatakis/afterword"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Afterword.app"
end
