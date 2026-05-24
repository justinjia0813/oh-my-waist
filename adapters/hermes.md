# OpenClaw Hermes Adapter

## Install

Hermes-style runtimes vary in how they load skills. Use the same `SKILL.md`
content as a portable instruction module, or reference it from the runtime's
system, profile, or project instruction layer.

## Portable Startup Instruction

```text
Apply the oh-my-waist policy during long desk-work sessions. Keep it silent at
startup. At natural pauses after sustained work, include one short optional
waist-movement reminder in the user's language. Do not nag, track completion, or
give medical advice. Stop reminders when the user asks.
```

## Hermes-Specific Behavior

Use the skill as a conversation policy, not a background process:

- No timer required.
- No extra tool required.
- No reminder if the agent is not already sending a useful update.
- Natural pauses are preferred over exact wall-clock timing.
- If a reminder is due and Hermes has a recap/status area, place one light-green
  `✶ Oh my waist: ...` line below it; otherwise use plain text.

This makes the skill portable even when Hermes lacks a dedicated skill loader.
