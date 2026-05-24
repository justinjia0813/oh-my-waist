# oh-my-waist

`oh-my-waist` is a lightweight agent skill for long desk-work sessions.

It does not run a timer, daemon, pop-up, or health app. It teaches an agent to
notice natural pauses in a long coding, research, debugging, or agent-run
session and attach a short waist-movement reminder only when it will not compete
with the user's work.

## Principle

The reminder should feel like a quiet affordance attached to an existing pause,
not like an additional task.

## Project Shape

```text
oh-my-waist/
  SKILL.md
  adapters/
    claude-code.md
    codex.md
    hermes.md
  tests/
    pressure-scenarios.md
    verification-checklist.md
```

## Install

Copy this directory into the personal skill folder used by your agent runtime.

Common locations:

- Codex Desktop: `~/.codex/skills/oh-my-waist/`
- Shared Codex-style skills: `~/.agents/skills/oh-my-waist/`
- Claude Code: `~/.claude/skills/oh-my-waist/`

If your runtime supports project instructions, you can also reference the skill
from `AGENTS.md`, `CLAUDE.md`, or an equivalent startup instruction.

## Expected Behavior

- No reminder at session start.
- No interruption during active user-agent exchange.
- One short reminder at a natural pause in longer sessions.
- In TUI recap/status UIs, one light-green `✶ Oh my waist：...` line below the
  recap when supported.
- Reminder text defaults to Chinese unless the active conversation clearly uses
  another language.
- Cooldown after a reminder.
- Immediate silence if the user asks to pause or stop reminders.

## Verification

Use `tests/pressure-scenarios.md` to test whether an agent follows the policy
under pressure. Use `tests/verification-checklist.md` before publishing changes
to the skill.
