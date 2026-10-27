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
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.0/aw-aarch64-apple-darwin.tar.gz"
      sha256 "cf911a54c506ec1eed7b5d25b3912176fc072add646ae72ac5ea93e4d4120c87"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.0/aw-x86_64-apple-darwin.tar.gz"
      sha256 "023b6db07a0364bfe053b95abfedf73b92651e79047e84557e70da56d4084a4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.0/aw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ee490fb1a89149cb941c1643fcb509c2537a432602059948a1045747eadeef0"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.6.0/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a27db5abf57c77157c987e4091eb4da8699c1607cd0097204b11b616435b6766"
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
