---
name: rust-verify
description: >-
  Verifies Rust codebases using 2 step verification pipeline:
  correctness first (cargo check),
  followed by idiomatic quality (cargo clippy).
---

# Skill: `rust-verify`

Never blend compilation correctness with code style.
Execute this skill in two strictly sequential phases:

1. Correctness Gate: (`cargo check`) — Is the program valid Rust?
2. Quality Gate: (`cargo clippy`) — Is the program idiomatic,
  safe, and performant?

## Phase 1: Correctness Gate (`cargo check`)

This ensures that the project source files contain only valid Rust
code that will compile.

```bash
cargo check --all-targets --all-features
```

## Phase 2: Quality Gate (`cargo clippy`)

Enforce idiomatic conventions, detect common anti-patterns. Even if we have
correct Rust code we need to make sure the code is of highest quality,
which aids in future maintainability.

```bash
cargo clippy --all-targets --all-features -- -D warnings
```
