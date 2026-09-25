# The release archives carry no version in their names, so Homebrew reads the
# version from the tag in the download path. Declaring it as well is redundant
# and `brew audit --strict` rejects it. Linux ships a glibc build here; the musl
# archive in the same release is not packaged.
class AwCli < Formula
  desc "Provision and report on reproducible multi-repository agentic workspaces"
  homepage "https://github.com/aw-tools/agentic-workspace"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.2.0/aw-aarch64-apple-darwin.tar.gz"
      sha256 "a309fae1d2e098962e496026e7bddde51f4619b2c345e7bb1771345a1476c5f5"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.2.0/aw-x86_64-apple-darwin.tar.gz"
      sha256 "f3f3049463155065fafba1f4bba8af7103c551d0ff5ac621a390698c3dc2a423"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.2.0/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc15296482da56c47365568790e3e628e7491cc65376019a5709067ee2536ab7"
    end
  end

  def install
    bin.install "aw"
  end

  test do
    assert_match "aw #{version}", shell_output("#{bin}/aw --version")
    assert_match "Create a new workspace", shell_output("#{bin}/aw help init")
  end
end
