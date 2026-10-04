---
name: start-pi-subagent
description: >-
  Start a fresh Pi subagent process in a specified repository with its local
  instructions, skills, and project context available. Use when launching a
  delegated task; use alongside delegate-subagent-work for delegation decisions.
---

# Start a Pi subagent

Use this skill for the mechanics of launching one bounded task in a fresh Pi
process. The parent agent remains responsible for overall coordination and
verification.

## Prepare the process

1. Resolve the target repository to an absolute path and verify it is the
   intended directory. When available, run
   `git -C "$repo" rev-parse --show-toplevel`.
2. Inspect branch and working-tree status without discarding existing changes.
3. Start Pi with that repository as its current working directory. Pi uses the
   working directory for project instructions, resource discovery, and
   session grouping.
4. Keep normal context-file, skill, and extension discovery enabled. Do not
   pass `--no-context-files`, `--no-skills`, or `--no-extensions` unless
   isolation is specifically required.

## Launch once and return a concise result

Run through a subshell so the parent directory is unchanged. Replace the
placeholder with one concrete, bounded task and include relevant findings,
constraints, edit permissions, acceptance criteria, and validation commands.

```bash
repo=/absolute/path/to/repository
(
  cd -- "$repo" || exit
  pi --print --no-session --approve -- <<'TASK'
You are a delegated subagent. Work only in the repository that is your current
working directory.

Read and follow the repository's AGENTS.md, CLAUDE.md, and applicable project
instructions before acting. Use discovered skills when relevant. Do not search
for or modify files outside this repository.

Task:
<one bounded task, with needed context and acceptance criteria>

Preserve unrelated user changes. Inspect before editing. Run the relevant
checks. Report changed paths, commands and results, and remaining risks.
TASK
)
```

The quoted heredoc delimiter prevents shell interpolation in the prompt. For a
dynamic prompt, pass it after `--` as an argument instead:

```bash
repo=/absolute/path/to/repository
prompt='Read the local instructions first. Task: '
prompt+="$TASK_DETAILS"
(
  cd -- "$repo" || exit
  pi --print --no-session --approve -- "$prompt"
)
```

`--print` runs once and returns the final response. `--no-session` avoids
persisting a separate session. `--approve` trusts project-local resources,
including skills and configuration. Use it only for a trusted repository. If
the repository is not trusted, omit `--approve`; do not bypass trust checks.
Pi discovers repository context and skills from the child's working directory.
Do not paste stale copies of local instructions into the prompt; direct the
child to read them there.

Capture only the child's final report in the parent context. Redirect large
logs to a temporary location outside the repository if needed. After it
returns, inspect the repository status and diff and confirm reported checks
actually ran. The child does not replace parent verification or integration.
