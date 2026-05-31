# Cognitive Flexibility — Claude Code 认知灵活性插件

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Framework: MCAF](https://img.shields.io/badge/Framework-MCAF-blue.svg)]()
[![Compatibility: Claude Code](https://img.shields.io/badge/Compatibility-Claude_Code-9B59B6.svg)]()

[English](README.md) | **中文**

> 让你的 AI Agent 具备超越字面请求的思考能力。

---

## 问题背景

大多数 AI Agent 都存在**任务僵化**问题：它们忠实地执行你说的，但从不想你*真正*需要什么。让 Agent "写一份项目提案"，它就产出一份文档——却不会考虑受众期望、格式规范、风险评估、利益相关方诉求，或者是否有更好的交付形式。

本插件实现了 **元认知 Agent 框架（MCAF）**，一套基于学术研究的架构，通过五个协同组件赋予 Agent 认知灵活性。

---

## 工作原理

```
┌──────────────────────────────────────────────────┐
│                 MCAF 插件                         │
│                                                  │
│  ┌─────────────────┐   ┌──────────────────────┐  │
│  │ 目标空间         │──▶│ 发散-收敛            │  │
│  │ 监测器           │   │ 引擎                 │  │
│  │ (追求什么)       │   │ (如何探索)           │  │
│  └────────┬────────┘   └──────────┬───────────┘  │
│           │                       │               │
│           ▼                       ▼               │
│  ┌─────────────────┐   ┌──────────────────────┐  │
│  │ 自主性           │   │ 主动探索器           │  │
│  │ 调节器           │   │ (你不知道的)         │  │
│  │ (多大主动性)     │   │                      │  │
│  └────────┬────────┘   └──────────┬───────────┘  │
│           │                       │               │
│           └───────────┬───────────┘               │
│                       ▼                           │
│            ┌─────────────────────┐                │
│            │ 反幻觉              │                │
│            │ 守卫                │                │
│            │ (验证一切)          │                │
│            └─────────────────────┘                │
└──────────────────────────────────────────────────┘
```

---

## 组件一览

### Agent（5个）

| Agent | 职责 | 模型 |
|-------|------|------|
| `goal-space-monitor` | 发现隐含目标，扩展目标框架 | sonnet |
| `divergence-convergence` | 结构化发散-收敛思维 | opus |
| `autonomy-regulator` | 控制 L0-L4 自主性级别 | haiku |
| `proactive-explorer` | 主动发现资源和知识 | sonnet |
| `anti-hallucination-guard` | 三层验证防护 | haiku |

### Skill（6个）

| Skill | 触发关键词 |
|-------|-----------|
| `goal-space-monitor` | "design", "create", "optimize", "设计", "创建" |
| `divergence-convergence` | "brainstorm", "compare", "alternatives", "方案对比" |
| `autonomy-regulator` | "just do it", "直接做", "全面分析" |
| `metacognitive-reflection` | "reflect", "复盘", "反思" |
| `proactive-explorer` | "discover", "find resources", "有什么工具" |
| `anti-hallucination-guard` | "verify", "check", "验证", "确认" |

### Command（7个）

| 命令 | 说明 |
|------|------|
| `/cf-analyze` | 执行前分析目标空间 |
| `/cf-diverge` | 启动发散-收敛思维循环 |
| `/cf-reflect` | 触发元认知反思 |
| `/cf-autonomy` | 设置/查看自主性级别 |
| `/cf-explore` | 主动资源探索 |
| `/cf-verify` | 反幻觉验证 |
| `/cf-setup` | 初始化插件 |

---

## 自主性级别

插件使用5级自主性谱系来控制 Agent 的主动程度：

```
L0 ──── L1 ──── L2 ──── L3 ──── L4
严格执行  澄清    建议    探索    自主发现
```

| 级别 | 名称 | 触发条件 | 行为 |
|------|------|----------|------|
| **L0** | 严格执行 | "just do it" / "直接做" | 原样执行，不做任何扩展 |
| **L1** | 澄清 | 简单歧义 | 执行 + 询问遗漏点 |
| **L2** | 建议 | 存在替代方案 | 执行 + 提供一个更好方案 |
| **L3** | 探索 | 创造性/复杂任务 | 先探索目标空间再执行 |
| **L4** | 自主发现 | 开放式战略任务 | 全面研究 + 提案 + 激进替代方案 |

**默认级别：L2** — Agent 执行你的请求，并在有更好方案时提供一个替代建议。

---

## 安装

### 作为 Claude Code 插件安装

```bash
# 在 Claude Code 会话中：
/plugin install /path/to/cognitive-flexibility-plugin
```

### 手动安装

将插件文件复制到项目的 `.claude/` 目录或全局 `~/.claude/` 目录：

```bash
# 复制 agents
cp -r agents/ ~/.claude/agents/

# 复制 skills
cp -r skills/ ~/.claude/skills/

# 复制 commands
cp -r commands/ ~/.claude/commands/

# 复制 rules
cp -r rules/ ~/.claude/rules/

# 运行初始化
/cf-setup
```

---

## 快速开始

1. **安装插件** → `/cf-setup`
2. **你的 Agent 现在具有认知灵活性** — 它会：
   - 发现请求中的隐含目标
   - 在有更好方案时提供替代建议
   - 主动发现你可能需要的资源
   - 在卡住时反思自己的思维过程
3. **控制自主性级别**：
   - 说 "直接做" → 严格执行 (L0)
   - 说 "全面分析" → 深度探索 (L3)
   - 使用 `/cf-autonomy L4` → 最大主动性

---

## 示例

### 之前：僵化的 Agent

```
User: "写一份项目提案"
Agent: [产出一份通用提案文档]
```

### 之后：灵活的 Agent (L3)

```
User: "写一份项目提案"

Agent: ## 目标空间分析

### 显式目标
撰写一份项目提案文档

### 发现的隐含目标
1. 受众对齐 — 原因：不同利益相关方需要不同粒度的信息
2. 风险评估 — 原因：决策者需要了解潜在风险
3. 时间线与里程碑 — 原因：没有计划的提案不可执行
4. 成功指标 — 原因：没有清晰KPI，项目无法评估
5. 预算考量 — 原因：资源规划对审批至关重要

### 推荐自主性：L3
这是一个具有多个隐含子目标的创造性任务。

### 方案选项
| 方案 | 优势 | 劣势 |
|------|------|------|
| A: 标准文档提案 | 格式熟悉 | 可能缺乏视觉冲击 |
| B: 交互式网页提案 | 吸引人、可追踪 | 创建成本更高 |
| C: 幻灯片 + 一页纸 | 双格式适配不同受众 | 两个交付物 |

你倾向哪个方案？需要我也准备一份执行摘要吗？
```

### 更多示例

| 用户请求 | 僵化响应 | 灵活响应 (L3) |
|----------|----------|--------------|
| "重构这个模块" | 重写代码 | 分析依赖、提出迁移策略、识别风险 |
| "创建 REST API" | 生成端点 | 考虑认证、版本管理、限流、文档 |
| "做一个落地页" | 输出 HTML/CSS | 研究目标受众、SEO、无障碍、A/B测试 |
| "优化这条查询" | 添加索引 | 分析查询模式、考虑缓存、数据归档 |

---

## 研究基础

本插件基于同行评审的学术研究：

| 研究 | 贡献 | 来源 |
|------|------|------|
| **ProactiveAgent** | 首个主动式AI Agent框架 | THUNLP, 2024 |
| **MUTATE Benchmark** | Agent发散思维的系统评估 | — |
| **Intelligent Disobedience** | Agent自主性级别理论 | Mirsky et al. |
| **ReflAct** | 目标状态反思机制 | EMNLP 2025 |
| **Design Thinking** | 发散-收敛方法论 | Stanford d.school |

---

## 兼容性

本插件设计为与其他 Claude Code 插件和配置协同工作：

- **Agent 委派类插件**：MCAF 作为专业化 Agent 路由之上的元层 — 确保在委派之前追求正确的目标
- **性能优化类插件**：兼容；认知灵活性在执行效率之上增加价值
- **模式/工作流类插件**：互补；目标灵活性增强基于模式的工作流

无已知与现有插件生态的冲突。

---

## 配置

### 状态目录

插件在 `.cognitive-flex/` 中存储会话状态：

```
.cognitive-flex/
  autonomy-state.json      # 当前自主性级别和任务历史
  current-session.json     # 活跃会话元数据
```

此目录在初始化时会自动添加到 `.gitignore`。

### 自定义

- **默认自主性级别**：编辑 `.cognitive-flex/autonomy-state.json` → `user_preferences.default_level`
- **最大自主性**：设置 `user_preferences.max_level` (0-4)
- **语言触发**：开箱即用支持中英文关键词

---

## 项目结构

```
cognitive-flexibility-plugin/
├── .claude-plugin/
│   └── plugin.json           # 插件清单
├── agents/
│   ├── goal-space-monitor.md     # 目标空间监测器
│   ├── divergence-convergence.md # 发散-收敛引擎
│   ├── autonomy-regulator.md     # 自主性调节器
│   ├── proactive-explorer.md     # 主动探索器
│   └── anti-hallucination-guard.md # 反幻觉守卫
├── skills/
│   ├── goal-space-monitor/
│   ├── divergence-convergence/
│   ├── autonomy-regulator/
│   ├── metacognitive-reflection/
│   ├── proactive-explorer/
│   └── anti-hallucination-guard/
├── commands/
│   ├── cf-analyze.md         # 目标空间分析
│   ├── cf-diverge.md         # 发散-收敛循环
│   ├── cf-reflect.md         # 元认知反思
│   ├── cf-autonomy.md        # 自主性控制
│   ├── cf-explore.md         # 主动探索
│   ├── cf-verify.md          # 反幻觉验证
│   └── cf-setup.md           # 插件初始化
├── rules/
│   └── cognitive-flexibility.md  # 认知灵活性规则
├── hooks/
│   └── hooks.json            # 钩子配置
├── scripts/
│   ├── session-start.sh      # 会话启动
│   ├── session-stop.sh       # 会话停止
│   └── pre-tool-check.sh     # 工具调用前检查
├── LICENSE
├── CONTRIBUTING.md
├── .gitignore
├── README.md                 # English
└── README_zh-CN.md           # 中文
```

---

## 参与贡献

欢迎贡献！请参阅 [CONTRIBUTING.md](CONTRIBUTING.md) 了解贡献指南。

## 许可证

本项目基于 MIT 许可证开源 — 详见 [LICENSE](LICENSE) 文件。
