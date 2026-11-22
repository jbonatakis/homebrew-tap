"""Pin the Afterword cask to a verified public release."""
from pathlib import Path
import re
import sys


def update(cask, version, sha):
    semver = r"(?:0|[1-9][0-9]*)(?:\.(?:0|[1-9][0-9]*)){2}"
    if not re.fullmatch(semver, version) or not re.fullmatch(r"[0-9a-f]{64}", sha):
        raise ValueError("Invalid release version or SHA-256")

    text = cask.read_text()
    entry = re.compile(rf'^  version "({semver})"\n  sha256 "[a-f0-9]{{64}}"$', re.MULTILINE)
    current, = entry.findall(text)
    if tuple(map(int, current.split("."))) > tuple(map(int, version.split("."))):
        print(f"Keeping newer Afterword cask {current}.")
        return
    cask.write_text(entry.sub(f'  version "{version}"\n  sha256 "{sha}"', text))


if __name__ == "__main__":
    update(Path("Casks/afterword.rb"), *sys.argv[1:])
