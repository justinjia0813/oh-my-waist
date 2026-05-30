# Verification Checklist

Use this checklist before publishing changes to `oh-my-waist`.

## Metadata

- [ ] `SKILL.md` has YAML frontmatter.
- [ ] `name` contains only letters, numbers, and hyphens.
- [ ] `description` starts with `Use when`.
- [ ] `description` describes triggering conditions, not the workflow.
- [ ] Frontmatter remains short enough for common skill loaders.

## Lightweight Behavior

- [ ] No reminder at session start.
- [ ] Reminder prefers natural pauses but has heartbeat fallback for long silence.
- [ ] Reminder is one sentence.
- [ ] Reminder offers at most one movement.
- [ ] Reminder does not ask for confirmation.
- [ ] Reminder uses the user's language.
- [ ] Reminder body defaults to Chinese when language is unspecified.
- [ ] Reminder stops when the user asks.
- [ ] Reminder is suppressed during urgent or low-talk work.
- [ ] A 30-minute heartbeat can mark reminders due in long silent sessions.
- [ ] Natural-pause reminders consume due reminders and prevent duplicates.
- [ ] TUI recap reminders use one light-green companion line when supported.
- [ ] TUI fallback text starts with `✶ Oh my waist：`.

## Safety

- [ ] No medical diagnosis.
- [ ] No claim to treat pain or prevent injury.
- [ ] No shaming, alarmism, or health lecture.
- [ ] No exercise routine unless the user asks.

## Portability

- [ ] No dependency on Codex-only tools.
- [ ] No dependency on Claude-only tools.
- [ ] Core skill remains portable without Codex-only or Claude-only features.
- [ ] Optional helper is clearly documented as a fallback, not a hard dependency.
- [ ] Adapter files remain optional and do not contradict `SKILL.md`.

## Pressure Tests

- [ ] Scenario 1: session start stays silent.
- [ ] Scenario 2: long verification gets one natural reminder.
- [ ] Scenario 3: urgent mode suppresses reminder.
- [ ] Scenario 4: ignored reminder is not followed up.
- [ ] Scenario 5: stop request is respected.
- [ ] Scenario 6: final summary avoids duplicate reminder.
