# OpenClaw Hermes Adapter

## Install

Hermes-style runtimes vary in how they load skills. Use the same `SKILL.md`
content as a portable instruction module, or reference it from the runtime's
system, profile, or project instruction layer.

## Portable Startup Instruction

```text
Apply the oh-my-waist policy during long desk-work sessions. Keep it silent at
startup. Use a 30-minute heartbeat when available; consume due reminders at
natural pauses, and fall back to one quiet reminder if no pause appears. Do not
nag, track completion, or give medical advice. Stop reminders when the user
asks.
```

## Hermes-Specific Behavior

Use the skill as a hybrid conversation policy:

- Native heartbeat, hook, or scheduled-task support is preferred.
- The optional `scripts/oh-my-waist-heartbeat` helper is the fallback.
- If the agent is already sending a useful update, attach the reminder there.
- If no update appears for a full heartbeat interval, use the fallback reminder.
- Natural pauses are preferred, but a 30-minute heartbeat prevents silence from
  lasting forever.
- If a reminder is due and Hermes has a recap/status area, place one light-green
  `✶ Oh my waist：...` line below it; otherwise use plain text.
- Default the reminder body to Chinese unless another conversation language is
  clear.

This makes the skill portable even when Hermes lacks a dedicated skill loader.
