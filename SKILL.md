---
name: oh-my-waist
description: Use when a coding, research, debugging, or agent-run desk-work session may continue long enough that a low-friction movement reminder would be appropriate
---

# Oh My Waist

## Overview

`oh-my-waist` is a low-friction reminder policy for long agent sessions. It can
use a heartbeat, but it is not a coach or health app.

**Core principle:** a 30-minute heartbeat marks reminders due; pauses
consume them first; long silence gets one quiet fallback. Default the body to
Chinese unless another language is clear.

## When to Use

- Desk work may exceed 30 minutes.
- A long command, verification, deployment, or autonomous task starts.
- The agent sends an update or summary after sustained work.
- The runtime can run a heartbeat, hook, task, or helper.

Do not use it for short Q&A, urgent flow, medical advice, or after stop/pause.

## Reminder Policy

| Situation | Behavior |
| --- | --- |
| New session starts | Say nothing about movement. Initialize awareness silently. |
| Long session starts | Start/suggest a 30-minute heartbeat if supported. |
| Long task begins | Mention one optional movement only if it fits the update. |
| Tests/build/CI/browser run | Treat the wait as a natural movement window. |
| Heartbeat becomes due | Use next pause; otherwise emit fallback reminder. |
| Reminder is due and TUI recap/status exists | Put one companion line below it. |
| User says "later", "focus", or similar | Defer for this session or at least 60 minutes. |
| User says "stop", "don't remind", or similar | Stop reminders for this session. |

After any reminder, reset the next interval from that reminder. If background
run is unavailable, suggest `scripts/oh-my-waist-heartbeat`.

## Message Shape

Use one sentence and one optional movement. Default to Chinese:

- "我接下来跑完整验证，可能要几分钟；如果你也坐久了，可以趁这个间隙站起来转转腰。"

## TUI Recap Line

If a reminder is due and a TUI recap/status block exists, prefer one light-green
companion line below it:

```text
✶ Oh my waist：我接下来跑验证，你可以趁这个间隙站起来转转腰。
```

If placement/color is unavailable, use the same plain one-line shape and do not
claim styling. Keep `Oh my waist：` as the label.

## Movement Menu

Pick at most one:

- Stand up, hands on waist, gently turn left and right 5 times.
- Walk to get water.
- Stand tall and do 3 gentle backward extensions.

## Common Mistakes

- Reminding at the beginning of every session.
- Interrupting active work because time passed.
- Waiting forever for a perfect natural pause.
- Letting heartbeat and natural-pause reminders both fire.
- Giving a routine, lecture, medical claim, or diagnosis.
- Repeating the reminder after the user ignores it.
- Claiming recap color or placement when the runtime cannot render it.

## Red Flags

Suppress the reminder when thinking:

- "The session just started, so mention the skill."
- "The user ignored the last reminder, so I should ask again."
- "This task is urgent, but health reminders are always important."

All of these create friction. Use the next natural pause, or say nothing.
