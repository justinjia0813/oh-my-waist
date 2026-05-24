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
oh-my-waist policy. Do not mention it at session start. If a natural pause occurs
after sustained work, add one short optional waist-movement reminder. Stop for
the session if I ask you not to remind me.
```

## Codex-Specific Behavior

Best reminder moments:

- Before a long `npm test`, `pytest`, build, lint, browser verification, or deploy
  command.
- While waiting for a long-running terminal command.
- After a large edit before starting verification.
- In the final summary after an extended work slice.

## Recap Companion Line

If a reminder is already appropriate and Codex exposes a recap/status area,
render it below the recap as one low-contrast light-green line:

```text
✶ Oh my waist: stand up and gently turn your waist a few times while the checks settle.
```

If that UI placement or color is not available, emit the same line shape as
normal text inside the existing update. Do not add a separate interruption.

Do not use a separate automation unless the user asks for recurring reminders.
The default skill stays inside the conversation flow.
