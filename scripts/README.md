# Heartbeat Helper

`oh-my-waist-heartbeat` is an optional fallback for runtimes that cannot keep a
skill active in the background.

It emits a low-friction reminder every 30 minutes by default. On macOS it uses
Notification Center, on Linux it tries `notify-send`, and otherwise it prints a
plain TUI-style line.

## Start

```bash
nohup scripts/oh-my-waist-heartbeat --interval-minutes 30 >/tmp/oh-my-waist.log 2>&1 &
```

## One-Shot Test

```bash
scripts/oh-my-waist-heartbeat --once --stdout
```

Expected shape:

```text
✶ Oh my waist：我接下来会继续等任务进度，你可以趁这个间隙站起来转转腰。
```

## Notes

This helper cannot inject text into an existing TUI unless that TUI exposes a
status/recap slot. Use it as a practical fallback when the skill alone cannot
remind during long silent runs.
