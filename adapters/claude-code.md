# Claude Code Adapter

## Install

Place the skill directory in:

```bash
mkdir -p ~/.claude/skills
cp -R /path/to/oh-my-waist ~/.claude/skills/oh-my-waist
```

If Claude Code does not auto-discover personal skills in your setup, add a short
reference to the skill from your global or project `CLAUDE.md`.

## Optional CLAUDE.md Reference

```text
For long desk-work sessions, use the oh-my-waist skill. Keep it silent at
session start. Mention one optional waist movement only at a natural pause, such
as before a long tool run, while waiting, or after a completed work slice.
```

## Claude Code-Specific Behavior

Best reminder moments:

- Before using tools for a long implementation or investigation.
- After a long test/build/check finishes.
- When switching from implementation to review.
- When summarizing a long run.

## Recap Companion Line

When a reminder is already appropriate and Claude Code exposes a recap-like
block, render it below the recap as one light-green line:

```text
✶ Oh my waist: stand up and gently turn your waist a few times while the checks settle.
```

If recap placement or color is unavailable, keep the same one-line shape in the
normal message. Do not simulate unsupported UI styling.

Avoid turning the reminder into a checklist item unless the user explicitly asks
for wellness tracking.
