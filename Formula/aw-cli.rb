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
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.3.0/aw-aarch64-apple-darwin.tar.gz"
      sha256 "8a0b0f8dd69a780534a427cf768f6acd0e4927f653d7290208d1b48c3589e0bf"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.3.0/aw-x86_64-apple-darwin.tar.gz"
      sha256 "20ae208a6afd740fdfb0678fee0d42eaf77a77b713b8d01b19f4fe6e32141a42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.3.0/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e5233a7581d226b03153a47434f791d30c11b888bbce0eecc4d81ddcaf817d9"
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
