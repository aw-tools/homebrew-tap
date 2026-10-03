# The release archives carry no version in their names, so Homebrew reads the
# version from the tag in the download path. Declaring it as well is redundant
# and `brew audit --strict` rejects it. Linux ships a glibc build here; the musl
# archive in the same release is not packaged.
class AwCli < Formula
  desc "Provision and report on reproducible multi-repository agentic workspaces"
  homepage "https://github.com/aw-tools/agentic-workspace"
  license any_of: ["MIT", "Apache-2.0"]

  # `aw bootstrap` hands the cloning of members to garden.
  depends_on "garden"

  on_macos do
    on_arm do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.4.0/aw-aarch64-apple-darwin.tar.gz"
      sha256 "396bd072eea30621eb6bb3dae2cbd1f82ddcede6116d5c36cc4451fb93855469"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.4.0/aw-x86_64-apple-darwin.tar.gz"
      sha256 "29bf8aabceda33e183241a8252a0e1b1499170a4bf4493cf82cd3bcbcbc24d9d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.4.0/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5aa5bd4e1e385c3e3de6ba647311d573da3786f2434d4879e0f5c92fb68d96b"
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
