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
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.1.0/aw-aarch64-apple-darwin.tar.gz"
      sha256 "3aa65d69c653148aa08929f0dc9a4336beafeec2f9e3d62d3a13a9a7e495efca"
    end

    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.1.0/aw-x86_64-apple-darwin.tar.gz"
      sha256 "ca4cc63b9c627d1310e882457fa1c8fb4ca93f6d31b0758f36584914b84145e0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aw-tools/aw-cli/releases/download/v0.1.0/aw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9c3565283df2812c955130dd26e6f3b7b02715b3725be3fed0574833a5a6dca"
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
