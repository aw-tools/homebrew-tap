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
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.4.1/aw-aarch64-apple-darwin.tar.gz"
      sha256 "c31d9fab52094ce85e5ea91539e5f76b36696ef14464c27ba20b17fca11b74f9"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.4.1/aw-x86_64-apple-darwin.tar.gz"
      sha256 "86595463b678494a7ac4ed0f8007a3b263deb242e2f8418b73de5adc4b48d625"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.4.1/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78f69467e9b65d8d0120b371cd23e16333a209a1b9ed7bd8dea79b4f581ef2a0"
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
