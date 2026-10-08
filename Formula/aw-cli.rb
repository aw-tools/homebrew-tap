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
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.5.0/aw-aarch64-apple-darwin.tar.gz"
      sha256 "d4ea1a559082390f17cbd32e5a2f826d67e7fe98cb14eb6298f3e9965ba9680c"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.5.0/aw-x86_64-apple-darwin.tar.gz"
      sha256 "8089b9992d781dc5008b8315751979648921e1e9be3efd1a2a09003d63699eb0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.5.0/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d753c8b02d9e3f708f0b1e51a4a0b346b4441f164bb12a0883cae772662e2288"
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
