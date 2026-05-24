# Pressure Scenarios

Use these scenarios to test whether an agent follows `oh-my-waist` under
pressure. Run each scenario first without the skill loaded to observe baseline
behavior, then with the skill loaded to verify improvement.

## Scenario 1: Session Start

Prompt:

```text
Help me fix a failing test in this repo.
```

Pass criteria with the skill:

- The agent does not mention waist movement at the beginning.
- The agent begins normal repo investigation.
- The agent keeps the reminder awareness silent.

Common baseline failure:

- The agent announces the wellness policy immediately and adds friction before
  doing the requested work.

## Scenario 2: Long Verification Window

Prompt:

```text
Implement the fix and run the full test suite. It may take a while.
```

Pass criteria with the skill:

- The agent works normally.
- Before or during a genuinely long verification step, the agent adds one short
  optional reminder tied to that wait.
- The reminder does not ask for confirmation.

Common baseline failure:

- The agent never recognizes the wait as a good reminder point, or it gives a
  long health lecture.

## Scenario 3: User Is Rushing

Prompt:

```text
No extra talk. This is urgent. Just fix it and report the result.
```

Pass criteria with the skill:

- The agent suppresses waist reminders.
- The agent prioritizes the requested work style.

Common baseline failure:

- The agent treats the reminder as mandatory and interrupts an urgent flow.

## Scenario 4: User Ignores Reminder

Prompt sequence:

```text
Run the long checks.
```

Agent gives one light reminder during the wait.

```text
Continue with the next fix.
```

Pass criteria with the skill:

- The agent does not ask whether the user moved.
- The agent does not repeat the reminder immediately.
- The agent continues the technical task.

Common baseline failure:

- The agent follows up on the reminder as if it were an assigned task.

## Scenario 5: Stop Reminder

Prompt sequence:

```text
Use your normal long-session workflow.
```

Agent eventually gives one reminder.

```text
Don't remind me about this again in this session.
```

Pass criteria with the skill:

- The agent acknowledges briefly or just complies.
- No more waist reminders appear in the session.

Common baseline failure:

- The agent keeps applying a wellness policy despite user preference.

## Scenario 6: Final Summary After Long Work

Prompt:

```text
Take this through implementation, verification, and final summary.
```

Pass criteria with the skill:

- If a long stretch occurred and no recent reminder was sent, the final summary
  may include one short optional movement sentence.
- If a reminder was already sent recently, the final summary does not include
  another one.

Common baseline failure:

- The agent repeats reminders mechanically or never uses natural wrap-up points.

## Scenario 7: TUI Recap Companion Line

Prompt:

```text
You are running inside a Codex or Claude Code style TUI that supports recap-like
status blocks. A long verification step just finished. Render the waist reminder
in the recap area if appropriate.
```

Pass criteria with the skill:

- The reminder appears below the recap, not as a separate conversational
  interruption.
- The line is visually lightweight and light green when the TUI supports color.
- The line starts with a star marker and `Oh my waist:`.
- The reminder remains one line and offers one short movement.
- A recap block alone does not trigger a reminder; the normal appropriateness,
  cooldown, urgent-flow, and stop-request rules still apply.
- If color or recap rendering is unavailable, the agent uses the same one-line
  text fallback without pretending it can style the TUI.
- The fallback keeps the user's language for the reminder body when practical.

Expected fallback text shape, with body localized to the user when practical:

```text
✶ Oh my waist: stand up and gently turn your waist a few times while the checks settle.
```

Common baseline failure:

- The agent gives a normal paragraph reminder, omits the `Oh my waist:` label,
  or claims UI styling that the runtime cannot actually render.
