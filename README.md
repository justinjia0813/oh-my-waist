# oh-my-waist

给久坐的 Agent 驾驶员，一个不吵不闹的腰部小提醒。

`oh-my-waist` 是一个轻量 Skill。它不会假装自己是健身私教，也不会在你正和 Agent 对话时突然跳出来抢戏。它只做一件事：

> 每 30 分钟把提醒设为 due，优先等工作流自然停一下再提醒；如果一直没有停顿，就用一条轻提醒兜底。

比如 Agent 准备跑测试、等构建、做验证、汇总一轮结果时，它可以在不打断工作的地方轻轻补上一行：

```text
✶ Oh my waist：我接下来跑验证，你可以趁这个间隙站起来转转腰。
```

如果 Codex、Claude Code 或类似 TUI 支持 recap/status 区域，这一行适合放在 recap 下面，用浅绿色显示。  
如果客户端不支持颜色或专门位置，那就退化成普通的一行文本。重点是：不吵、不追问、不等到永远不提醒。

## 它适合谁

- 长时间写代码、改 bug、跑测试的人。
- 让 Agent 连续干活，自己在电脑前盯进度的人。
- 经常进入“我再看一眼就起来”，结果一小时过去的人。
- 想要一点健康提醒，但受不了健康 App 训话的人。

## 它不是什么

- 不是重型后台 daemon。
- 不是强行打断工作的定时弹窗。
- 不是运动打卡系统。
- 不是医疗建议。
- 不是“每 30 分钟强行打断你一次”的生产力破坏器。

它更像一个懂分寸的同事：看到你和 Agent 都在等测试，就轻轻说一句“现在刚好可以站起来转转腰”。

## 默认行为

- 新 session 开始时不提醒。
- 用户和 Agent 正在密集交互时不插话。
- 默认 30 分钟心跳；自然停顿点优先，没停顿时兜底提醒一次。
- 默认提醒正文为中文，除非当前对话明显是其他语言。
- TUI recap/status 场景优先使用 `✶ Oh my waist：...` 单行提醒。
- 用户说“别提醒”“专注模式”“晚点”时，立即降噪。
- 不追问你有没有真的站起来。

## 项目结构

```text
oh-my-waist/
  SKILL.md
  adapters/
    claude-code.md
    codex.md
    hermes.md
  tests/
    pressure-scenarios.md
    verification-checklist.md
  scripts/
    oh-my-waist-heartbeat
```

## 安装

把这个目录放进你的 Agent Skill 目录即可。

如果你正在 Codex、Claude Code 或其他 TUI 里，可以直接让 Agent 运行下面对应的一段。

### Codex Desktop

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/justinjia0813/oh-my-waist.git ~/.codex/skills/oh-my-waist
```

### Codex 风格共享目录

```bash
mkdir -p ~/.agents/skills
git clone https://github.com/justinjia0813/oh-my-waist.git ~/.agents/skills/oh-my-waist
```

### Claude Code

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/justinjia0813/oh-my-waist.git ~/.claude/skills/oh-my-waist
```

### 更新

已经安装过的话，进入对应目录拉一下即可：

```bash
git -C ~/.codex/skills/oh-my-waist pull --ff-only
```

如果你安装在 `~/.agents/skills` 或 `~/.claude/skills`，把上面的路径换成对应目录。

### 可选：开启后台心跳

如果你的 Agent runtime 不会持续加载 Skill，单靠自然断点可能不会真正提醒。可以启动轻量 heartbeat helper：

```bash
nohup ~/.codex/skills/oh-my-waist/scripts/oh-my-waist-heartbeat --interval-minutes 30 >/tmp/oh-my-waist.log 2>&1 &
```

测试一条提醒：

```bash
~/.codex/skills/oh-my-waist/scripts/oh-my-waist-heartbeat --once --stdout
```

Claude Code 或共享目录用户，把路径换成你的安装位置。

常见位置：

- Codex Desktop: `~/.codex/skills/oh-my-waist/`
- Codex 风格共享目录: `~/.agents/skills/oh-my-waist/`
- Claude Code: `~/.claude/skills/oh-my-waist/`

如果你的运行时支持项目级说明，也可以在 `AGENTS.md`、`CLAUDE.md` 或等价入口里引用它。

## 验证

- `tests/pressure-scenarios.md`：用压力场景测试 Agent 会不会乱提醒。
- `tests/heartbeat-helper-test.sh`：测试可选后台心跳 helper。
- `tests/verification-checklist.md`：发布前检查轻量、中文默认、TUI recap、停止提醒等规则。

## 一句话

`oh-my-waist` 不想管理你的身体，它只是帮 Agent 在合适的时候少说一句废话，多说一句有用的腰部提醒。

Save your waist before your disk is done building.
