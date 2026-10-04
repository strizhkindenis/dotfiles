---
name: commit-every-task
description: >-
  Ensure each completed task that changes tracked project files is committed
  as one focused Git commit. Use when making changes in a Git repository.
---

# Commit each task

A task is one coherent piece of work. It may require edits to multiple files,
but the edits together should accomplish a single task.

After completing a task that changes tracked project files:

1. Review the diff and verify that all changes belong to that task.
2. Run relevant checks when practical.
3. Stage the task's changes and create one focused commit, following the
   repository's commit message conventions.

Do not combine unrelated tasks in one commit. If unrelated work is already
present, preserve it and stage only the changes for the completed task.

Do not commit when the user asks you not to, when there are no changes to
commit, or when committing is blocked by repository policy or environment.
In those cases, explain briefly why no commit was made.
