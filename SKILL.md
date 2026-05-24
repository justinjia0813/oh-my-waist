---
name: oh-my-waist
description: Use when a coding, research, debugging, or agent-run desk-work session may continue long enough that a low-friction movement reminder would be appropriate
---

# Oh My Waist

## Overview

`oh-my-waist` is a low-friction reminder policy for long agent sessions. It is
not a timer, coach, or health app.

**Core principle:** remind only at a natural pause, with one short optional
action. Default the reminder body to Chinese unless the active conversation is
clearly in another language.

## When to Use

- Desk work may exceed 30 minutes.
- A long command, verification, deployment, or autonomous task is starting.
- The agent is sending an update or summary after sustained work.

Do not use it for short Q&A, urgent flow, medical advice, or after pause/stop
requests.

## Reminder Policy

| Situation | Behavior |
| --- | --- |
| New session starts | Say nothing about movement. Initialize awareness silently. |
| Long task begins | Mention one optional movement only if it fits the update. |
| Tests/build/CI/browser run | Use the wait as a natural movement window. |
| Work summary after long stretch | Add one brief reminder if cooldown allows. |
| Reminder is due and TUI recap/status exists | Put one companion line below it. |
| User says "later", "focus", or similar | Defer for this session or at least 60 minutes. |
| User says "stop", "don't remind", or similar | Stop reminders for this session. |

Cooldown: no more than once every 45 minutes and no more than twice per session
unless requested.

## Message Shape

Use one sentence and one optional movement. Default to Chinese when language is
unspecified:

- "我接下来跑完整验证，可能要几分钟；如果你也坐久了，可以趁这个间隙站起来转转腰。"
- "The build is running. If you are waiting too, stand up and gently turn your waist a few times."

## TUI Recap Line

For Codex, Claude Code, or similar TUIs, if a reminder is already appropriate
and a recap/status block exists, prefer one light-green companion line below it:

```text
✶ Oh my waist：我接下来跑验证，你可以趁这个间隙站起来转转腰。
```

If placement or color is unavailable, use the same one-line shape as plain text
and do not claim styling. Keep `Oh my waist：` as the label; default the body to
Chinese unless another conversation language is clear.

## Movement Menu

Pick at most one:

- Stand up, hands on waist, gently turn left and right 5 times.
- Stand up and walk to get water.
- Stand tall and do 3 gentle backward extensions.
- Slowly circle the hips 5 times each direction.

## Common Mistakes

- Reminding at the beginning of every session.
- Interrupting active work just because time has passed.
- Asking whether the user completed it.
- Giving a routine, lecture, medical claim, or diagnosis.
- Repeating the reminder after the user ignores it.
- Claiming recap color or placement when the runtime cannot render it.
- Treating "lightweight" as "never remind"; use the pause when it exists.

## Red Flags

Suppress the reminder when thinking:

- "The session just started, so mention the skill."
- "The user ignored the last reminder, so I should ask again."
- "This task is urgent, but health reminders are always important."
- "I can add a whole exercise list to be helpful."

All of these create friction. Use the next natural pause, or say nothing.
