require "download_strategy"

# Keep authentication in GitHub CLI. Homebrew handles the download lock, cache and checksum.
class AfterwordReleaseDownloadStrategy < CurlDownloadStrategy
  private

  def resolve_url_basename_time_file_size(url, timeout: nil)
    [url, File.basename(url), nil, nil, nil, false]
  end

  def _fetch(url:, resolved_url:, timeout:)
    gh = which("gh", PATH.new(ORIGINAL_PATHS))
    raise "Install GitHub CLI with 'brew install gh', then run 'gh auth login --hostname github.com'." unless gh

    system_command!(gh, args: ["release", "download", "v#{version}", "--repo", "github.com/jbonatakis/afterword",
                               "--pattern", File.basename(url), "--output", temporary_path, "--clobber"],
                        timeout: timeout)
  end
end
