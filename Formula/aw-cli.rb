# The release archives carry no version in their names, so Homebrew reads the
# version from the tag in the download path. Declaring it as well is redundant
# and `brew audit --strict` rejects it.
class AwCli < Formula
  desc "Provision and report on reproducible multi-repository agentic workspaces"
  homepage "https://github.com/aw-tools/agentic-workspace"
  license any_of: ["MIT", "Apache-2.0"]

  # `aw bootstrap` hands the cloning of members to garden.
  depends_on "garden"

  on_macos do
    on_arm do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.7.0/aw-aarch64-apple-darwin.tar.gz"
      sha256 "cd8ac0af8139fad8fa8328855f72d5952c312f42958e980f70edda4a0c7539d2"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.7.0/aw-x86_64-apple-darwin.tar.gz"
      sha256 "4c6b9eb5937d3e7ee79ed95f6b09e027aeb2f932ec1e1bef082cf430bc33e8f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.7.0/aw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "68b71e114f78fe97294d594f5cec643abbc047ce3796364aa7757a00f93d77c1"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.7.0/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccd082a41955e3c5d668a575b3183b2b491c65c556ef1a0b70a063973dca7afc"
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
