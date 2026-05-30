# Codex Adapter

## Install

Place the skill directory in one of the skill roots your Codex environment
loads, for example:

```bash
mkdir -p ~/.codex/skills
cp -R /path/to/oh-my-waist ~/.codex/skills/oh-my-waist
```

Some Codex setups also scan:

```bash
~/.agents/skills/oh-my-waist
```

Use the root that appears in your local skill list.

## Optional Startup Instruction

Add this to a personal instruction file only if you want the awareness present
in most sessions:

```text
For long coding, debugging, research, or agent-run sessions, silently apply the
oh-my-waist policy. Do not mention it at session start. Use a 30-minute
heartbeat when available; consume due reminders at natural pauses, and fall back
to one quiet reminder if no pause appears. Stop for the session if I ask you not
to remind me.
```

## Codex-Specific Behavior

Best reminder moments:

- Before a long `npm test`, `pytest`, build, lint, browser verification, or deploy
  command.
- While waiting for a long-running terminal command.
- After a large edit before starting verification.
- In the final summary after an extended work slice.
- When a 30-minute heartbeat becomes due and no natural pause has appeared.

## Heartbeat Fallback

If Codex has a native heartbeat/thread reminder capability, prefer it. If not,
use the optional helper:

```bash
nohup ~/.codex/skills/oh-my-waist/scripts/oh-my-waist-heartbeat --interval-minutes 30 >/tmp/oh-my-waist.log 2>&1 &
```

## Recap Companion Line

If a reminder is already appropriate and Codex exposes a recap/status area,
render it below the recap as one low-contrast light-green line:

```text
✶ Oh my waist：我接下来跑验证，你可以趁这个间隙站起来转转腰。
```

If that UI placement or color is not available, emit the same line shape as
normal text inside the existing update. Do not add a separate interruption.
The default reminder body is Chinese unless the active conversation clearly uses
another language.

Use natural pauses first, but do not wait forever for one. The heartbeat exists
to make the skill work during long silent runs.
