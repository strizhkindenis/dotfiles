---
name: commit
description: >-
  Create clear, focused, reviewable Git commits with useful commit messages.
  Use when preparing, staging, or committing changes.
---

# Git commits

## Commit messages

- Use the imperative mood: “Add login validation,” not “Added…” or “Adds…”.
- Keep the subject concise, ideally under 50 characters.
- Describe what changed and why; avoid implementation minutiae.
- Follow the repository’s established convention. If none exists, a common
  format is `type(scope): summary`, such as `fix(api): handle empty response`.
- Add a body when context or motivation is not obvious. Separate it from the
  subject with a blank line, and wrap prose sensibly.
- Reference relevant issues when useful, for example `Fixes #123`.

## Commit hygiene

- Make each commit small, focused, and atomic: one logical change per commit.
- Keep commits buildable and testable when practical.
- Avoid mixing unrelated refactors, formatting, dependency updates, or feature
  work.
- Include relevant tests and documentation with the behavior they cover.
- Do not commit secrets, debugging artifacts, generated files, or unrelated
  changes.
- Inspect the staged diff before committing with `git diff --staged`.
- Use `git add -p` to stage only the relevant parts of a file when needed.
- Run appropriate tests and checks before committing; report failures rather
  than implying they passed.
- Before sharing a branch, consolidate fixup commits with interactive rebase
  when useful. Avoid rewriting commits others may depend on.
- Coordinate before force-pushing shared branches; prefer
  `git push --force-with-lease` when rewriting a branch is necessary.

A commit should tell a future maintainer one clear story.
