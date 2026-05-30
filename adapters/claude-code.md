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
session start. Use a 30-minute heartbeat when available; consume due reminders
at natural pauses, and fall back to one quiet reminder if no pause appears.
```

## Claude Code-Specific Behavior

Best reminder moments:

- Before using tools for a long implementation or investigation.
- After a long test/build/check finishes.
- When switching from implementation to review.
- When summarizing a long run.
- When a 30-minute heartbeat becomes due and no natural pause has appeared.

## Heartbeat Fallback

If Claude Code cannot keep this skill active in the background, use the optional
helper:

```bash
nohup ~/.claude/skills/oh-my-waist/scripts/oh-my-waist-heartbeat --interval-minutes 30 >/tmp/oh-my-waist.log 2>&1 &
```

## Recap Companion Line

When a reminder is already appropriate and Claude Code exposes a recap-like
block, render it below the recap as one light-green line:

```text
✶ Oh my waist：我接下来跑验证，你可以趁这个间隙站起来转转腰。
```

If recap placement or color is unavailable, keep the same one-line shape in the
normal message. Do not simulate unsupported UI styling.
The default reminder body is Chinese unless the active conversation clearly uses
another language.

Avoid turning the reminder into a checklist item unless the user explicitly asks
for wellness tracking.
