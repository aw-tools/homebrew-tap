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
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.2/aw-aarch64-apple-darwin.tar.gz"
      sha256 "edd2093281b6881f02c2fcc2fe6bdef34df421852f0d5b8da958788bcaaa39bd"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.2/aw-x86_64-apple-darwin.tar.gz"
      sha256 "78ae4e7df7a9aaa0fc8d025b7cb29aba687cb5c2213d5ec8ba97a7e10528c6d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.2/aw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bbe551d089c07d84a8a6966576d36a948e402f94576a2d0ba315c75b45228f0b"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.2/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1835f34e7274fe3e467768f7740f6eab4fe9579c305034b600d5b10ef143d583"
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
