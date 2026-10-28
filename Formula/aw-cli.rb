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
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.1/aw-aarch64-apple-darwin.tar.gz"
      sha256 "070e07ffe1ff1e187e86a93fcccb8e246f9f3dfd93b46b38b81d9e5af8afb3a1"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.1/aw-x86_64-apple-darwin.tar.gz"
      sha256 "925ebe33f3fc733fefeb798073abc06afb76d59f69419eac6b0839f630babfe7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.1/aw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "df2df32da76e7c4aef84a951ab5a367ff2e25636f84dde071bc1e383f098cec9"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.1/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b773a4ecd7b5ceaae868544758c99aad6edcfd0b9ff8d17e68d16a0d8b5c6d51"
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
