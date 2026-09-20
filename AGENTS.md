# Agent instructions

Working rules for the Homebrew tap that installs `aw`.

## Delivery

Trunk-based. Signed commits straight to `trunk`, then push. No branch, no pull
request. The default branch is `trunk` because the delivery model is.

Almost every commit here is the formula bump that `aw-cli`'s publish job pushes
on release, using a token scoped to this repository alone. A pull request per
bump would need a human merge on every release, which is exactly what the job
exists to avoid. Human edits are rare and small, and a formula is trivially
reverted, so CI on push covers the review gap.

## What lives here

One formula, `Formula/aw-cli.rb`, installing the release archives published by
`aw-tools/aw-cli` and verified against that release's `SHA256SUMS`. Nothing
else belongs in this repository. The formula is named after the project rather
than the command it installs, so the name stays free for a Homebrew core
submission later.

The archives carry no version in their names, so the formula states its version
outright and pins the download path to the tag. A bump therefore rewrites three
things together: the version, every URL and every checksum.

## Before every push

1. Run `brew style` and `brew audit --strict` against the formula.
2. Install and test it from a local tap, on the platform you are on.
3. Show the change and the command output, then wait for a go.

CI repeats all of it on push, on macOS and on Linux.
