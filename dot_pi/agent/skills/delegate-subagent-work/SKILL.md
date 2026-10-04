---
name: delegate-subagent-work
description: >-
  Decide when and how to delegate work to a Pi subagent while keeping the
  parent context focused. Always use before making changes in a different
  repository; also use for hard intermediate tasks that are not the final goal.
---

# Delegate work to a subagent

Use this skill to decide what work belongs in a separate Pi process. For
launch-command details, follow the `start-pi-subagent` skill.

## Mandatory delegation for other repositories

If you intend to make any change in a different repository, explicitly spawn a
subagent in that repository before editing. This includes creating, modifying,
or deleting files, changing configuration, applying patches, or running
commands that alter repository state. Do not make those changes directly from
the current agent, even if the edit looks small.

The subagent must start with that repository as its working directory. It can
then discover and follow the repository's own `AGENTS.md`/`CLAUDE.md`, project
documentation, and applicable skills, and use those instructions to make the
changes correctly. Do not assume the current repository's rules apply there or
that the parent has loaded the other repository's local context. Tell the child
the bounded requested change and relevant context; direct it to inspect and
follow local instructions itself.

This rule is about making changes. If you only need a read-only check in another
repository, delegation is recommended when it would bring substantial context
into the parent, but is not mandatory solely because the repository differs.

## Other useful delegation cases

Spawn a subagent for a difficult intermediate task when it is not itself the
user's final goal and investigating or implementing it would substantially
expand or distract the parent context. Examples include focused debugging,
exploring an unfamiliar subsystem, or implementing an isolated component.

Keep final orchestration, cross-repository integration, and user-facing
synthesis in the parent. Do not delegate tiny decisions or a task with no clear
acceptance criteria. Split independent tasks by repository or outcome; do not
ask one child to modify multiple repositories.

## Define a bounded task

Before launch, establish the absolute target path and check repository identity,
branch, and working-tree status. Preserve pre-existing user changes. Give the
child:

- one concrete outcome and its acceptance criteria;
- relevant parent findings, constraints, interfaces, and errors;
- likely files or symbols to inspect, without assuming they exist;
- permitted scope (read-only, edits allowed, or patch only);
- relevant checks and a concise reporting requirement.

The child must read local instructions and relevant skills itself. Avoid
pasting stale instruction-file contents or the entire parent conversation.

## Isolate and verify

Return only a concise child report to the parent context, not long logs. Run
independent children in parallel only when they cannot edit shared files or
depend on each other's work. Otherwise run them sequentially.

When the child finishes, the parent must inspect the relevant diff and status,
confirm checks, resolve integration, and report the final outcome. A child's
claim is not verification. For launch syntax, trust handling, and command
examples, follow `start-pi-subagent`.

## User invocation

A user can request delegation directly with:

```text
/skill:delegate-subagent-work <repository path and requested outcome>
```

Apply the mandatory other-repository rule above, then follow
`start-pi-subagent` to launch. Ask for clarification only if the target or
requested outcome cannot safely be determined.
