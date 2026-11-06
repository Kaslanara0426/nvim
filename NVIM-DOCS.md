# Neovim 文档阅读顺序指南（新手版）

> **适用版本**：Neovim 0.12.x（本机为 0.12.6）  
> **文档语言**：英文官方文档。本地 `:help` 与官网内容同源，**优先看本地**（版本精确、可跳转）；需要分享或在手机上看时再用官网。  
> **先给结论**：不要从 `options.txt`、`api.txt`、`news.txt` 开始读。正确顺序是：
>
> **学会查 help → 5 分钟 Nvim 入门 → `:Tutor` 动手 → 用户手册 `usr_01`–`usr_12` → 进阶章节按需 → 配置与插件 → 参考手册当字典**

---

## 目录

- [0. 先建立地图：四类文档，读法完全不同](#0-先建立地图四类文档读法完全不同)
- [1. 第 0 步：先学会查 help（30 分钟）](#1-第-0-步先学会查-help30-分钟)
- [2. 第 1 步：Nvim 官方入门页（5–10 分钟）](#2-第-1-步nvim-官方入门页510-分钟)
- [3. 第 2 步：`:Tutor` 交互教程（30 分钟 × 3 次）](#3-第-2-步tutor-交互教程30-分钟--3-次)
- [4. 第 3 步：`intro` + 用户手册 `usr_01`–`usr_12`（主线，约 1 周）](#4-第-3-步intro--用户手册-usr_01usr_12主线约-1-周)
- [5. 第 4 步：编辑进阶 `usr_20`–`usr_32`（按需）](#5-第-4-步编辑进阶-usr_20usr_32按需)
- [6. 第 5 步：配置、映射、插件（结合本仓库）](#6-第-5-步配置映射插件结合本仓库)
- [7. 第 6 步：按领域查文档（永远不要通读）](#7-第-6-步按领域查文档永远不要通读)
- [8. 明确不要通读的文件](#8-明确不要通读的文件)
- [9. 两周执行计划](#9-两周执行计划)
- [10. 遇到问题时的查文档决策树](#10-遇到问题时的查文档决策树)
- [11. 新手最常见的 10 个误区](#11-新手最常见的-10-个误区)
- [12. 速查卡](#12-速查卡)
- [附录 A：读英文文档必备术语](#附录-a读英文文档必备术语)
- [附录 B：官方英文文档链接总表](#附录-b官方英文文档链接总表)

---

## 0. 先建立地图：四类文档，读法完全不同

Neovim 的官方文档不是一个整体，而是四类内容混在一起。**新手最大的错误，就是把参考手册当教程从头读到尾。**

| 类型 | 代表文档 | 读法 |
|---|---|---|
| 入门 | `:h nvim-intro`、`:h intro`、`:Tutor` | **顺序读完** |
| 用户手册（教程） | `usr_01`–`usr_12`（Getting Started）<br>`usr_20`–`usr_32`（Editing Effectively）<br>`usr_40`–`usr_45`（Tuning Vim） | **`usr_01`–`usr_12` 顺序精读**；后面按需 |
| 参考手册（字典） | `options.txt`、`map.txt`、`autocmd.txt`、`pattern.txt`、`change.txt`、`index.txt` | **只查，不读** |
| Nvim 专属 / 版本 | `lua-guide`、`lsp`、`treesitter`、`diagnostic`、`vim.pack`、`api`、`lua`<br>`news`、`deprecated`、`vim-differences` | **有需求再读**；升级前读版本类 |

官方自己在 `:h help.txt` 里也是这么分的：

```text
About Nvim   → 入门、tutor、与 Vim 的差异
Usage        → help 用法、intro、quickref、用户手册、index
Basic editing / Advanced editing → 参考手册
API / LSP / treesitter ...       → 扩展与语言支持
```

在线总目录（英文）：<https://neovim.io/doc/user/>

---

## 1. 第 0 步：先学会查 help（30 分钟）

**在读任何内容之前，先学会“怎么读”。** 这一步投入半小时，后面能省几十小时。

### 1.1 必须会的 8 个操作

| 操作 | 作用 |
|---|---|
| `:help` 或 `:h` | 打开帮助首页 |
| `:h topic` | 按主题/标签查，例如 `:h usr_04`、`:h 'number'` |
| `:h topi<Tab>` / `:h topi<C-D>` | Tab 补全；`CTRL-D` 列出所有匹配项 |
| `CTRL-]` | 把光标移到 `\|tag\|` 上，跳转到该帮助 |
| `CTRL-T` | 跳回来（最常用） |
| `CTRL-O` / `CTRL-I` | 在跳转历史中后退 / 前进 |
| `gO` | 在帮助缓冲区中显示目录（Table of Contents） |
| `:helpgrep word` → `:copen` | 全文搜索帮助，结果放进 quickfix 列表 |

在帮助窗口里：

- 把光标放在 `|bars|` 这样的链接上按 `CTRL-]` 就能跳转；也可以 `Ctrl + 鼠标左键`。
- 看完用 `:q` 关闭帮助窗口。
- `:h` 是**打开新窗口**，不会丢掉你正在编辑的文件。

### 1.2 先读这三页

| 顺序 | 命令 | 内容 |
|---|---|---|
| 1 | `:h helphelp` | help 系统怎么用、标签命名规则、如何搜索 |
| 2 | `:h notation` | 文档里的 `[count]`、`{arg}`、`CTRL-X` 等符号是什么意思 |
| 3 | `:h help-summary` | 查 help 的速查总结（也在 `usr_02` 第 8 节） |

对应官网：

- <https://neovim.io/doc/user/helphelp/>
- <https://neovim.io/doc/user/usr_02/>

### 1.3 看懂 help 页的排版

| 写法 | 含义 |
|---|---|
| `*tag*` | 可检索的标签，`:h tag` 就靠它 |
| `\|tag\|` | 指向另一个帮助页的链接，`CTRL-]` 跳转 |
| `'option'` | 选项，查询时带单引号，如 `:h 'number'` |
| `>vim ... <` | 可以照抄的命令/代码块 |
| `[count]` | 可选的数字前缀，如 `3dd` |
| `{arg}` | 需要替换的参数 |
| `~` | 标题下划线，不是正文 |
| `CTRL-X` | 键盘按键组合 |

> **判断标准**：学完这一步，你遇到任何“这个命令/选项/函数是什么”的问题，都应该能在 30 秒内定位到对应帮助页，而不是去搜中文博客。

---

## 2. 第 1 步：Nvim 官方入门页（5–10 分钟）

```vim
:h nvim-intro
```

这是 Neovim 官方写给新用户的总入口，内容包括：

- Neovim 与 Vim 的关系；
- 30 分钟教程 `:Tutor`；
- 如何创建 `init.lua`（`:h config-example`、`:h example-init`）；
- LSP 是什么；
- 为什么官方推荐先用原版配置、按需增加，而不是一开始就套用 LazyVim / NvChad 这类发行版。

在线：<https://neovim.io/doc/user/nvim/#nvim-intro>

读完这页就够了，不要在这里展开研究配置。

---

## 3. 第 2 步：`:Tutor` 交互教程（30 分钟 × 3 次）

```vim
:Tutor
```

或在终端运行：

```sh
nvim +Tutor
```

这是官方 30 分钟交互式教程，直接在缓冲区里带你操作。**这是整个学习过程中性价比最高的一步。**

建议：

1. 第一遍：完整做完，不追求记住。
2. 第二遍（隔 1–2 天）：遮住提示，自己操作。
3. 第三遍（一周后）：当作复习，重点练 `d`/`c`/`y` + 动作、文本对象。

做完后你应该掌握：

- `h j k l`、`w b e`、`0 ^ $`、`gg G`；
- `i a o O`、`x dd yy p`；
- `d`/`c`/`y` + 动作（`dw`、`ciw`、`dap`）；
- 可视模式 `v`、`V`；
- `/` 搜索、`:w`、`:q`、`:q!`；
- 撤销 `u`、重做 `CTRL-R`。

> 官方说明：`:h tutor`；在线：<https://neovim.io/doc/user/usr_01/#tutor>

---

## 4. 第 3 步：`intro` + 用户手册 `usr_01`–`usr_12`（主线，约 1 周）

### 4.1 先读 `intro`（20 分钟）

```vim
:h intro
```

这一页把 Vim/Neovim 的核心概念一次讲清楚，是后面所有内容的骨架：

- 模式（Normal / Insert / Visual / Command-line）；
- 动作（motion）、操作符（operator）、文本对象（text object）；
- 缓冲区（buffer）、窗口（window）、标签页（tabpage）；
- 寄存器（register）、标记（mark）、折叠（fold）；
- 计数（count）、映射（mapping）、选项（option）。

在线：<https://neovim.io/doc/user/intro/>

### 4.2 用户手册的正确顺序

用户手册（User Manual）是**唯一一套为“从头学”而写的文档**。入口：

```vim
:h usr_toc
```

在线目录：<https://neovim.io/doc/user/usr_toc/>

前 12 章属于 **Getting Started**，建议按下面的顺序读：

| 顺序 | 命令 | 章节内容 | 处理方式 |
|---|---|---|---|
| 1 | `:h usr_01` | 两本手册的区别、如何使用 tutor | 速读 5 分钟 |
| 2 | `:h usr_02` | 第一次编辑、保存退出、**如何找帮助** | **精读 + 动手** |
| 3 | `:h usr_03` | 光标移动、滚动、搜索、标记 | **精读 + 每天练** |
| 4 | `:h usr_04` | 小修改：操作符+动作、文本对象、可视模式、复制粘贴 | **全书最重要，反复读** |
| 5 | `:h usr_05` | vimrc/init、选项、映射、插件 | **精读**，对照本仓库 |
| 6 | `:h usr_06` | 语法高亮 | 速读或跳过 |
| 7 | `:h usr_07` | 多文件、buffer 列表、文件间复制 | **精读** |
| 8 | `:h usr_08` | 分屏、窗口尺寸、diff | **精读** |
| 9 | `:h usr_09` | 使用 GUI | 终端用户**跳过** |
| 10 | `:h usr_10` | 大改动：宏、寄存器、替换、`:global` | **精读** |
| 11 | `:h usr_11` | 崩溃恢复 | 速读 |
| 12 | `:h usr_12` | 各种技巧 | 选读，当甜点 |

### 4.3 每章怎么读才有效

不要只“看懂了”，要按下面的循环：

1. **先扫一遍标题**：`gO` 打开本章目录；
2. **读一节，立刻在 scratch buffer 里练**：
   ```vim
   :enew
   ```
3. **合上文档复述**：这一节解决了什么问题？对应哪几个键？
4. **做章末练习**：用户手册每章末尾都有练习题，别跳过。

最低练习量参考：

- `usr_03`：用 `w/b/e`、`f/t`、`%`、`/` 在各处移动 10 分钟；
- `usr_04`：至少练 30 次 `ciw`、`dap`、`di"`、`yi(`、`vip`；
- `usr_10`：录一个宏 `qa...q`，再用 `@a`、`@@` 重放；
- `usr_07`/`usr_08`：练习 `:e`、`:bnext`、`:split`、`CTRL-W` 系列。

> **不要在这一阶段碰 LSP、treesitter、插件配置。** 先把“编辑”这件事本身练熟。

---

## 5. 第 4 步：编辑进阶 `usr_20`–`usr_32`（按需）

这 13 章属于 **Editing Effectively**，不需要按顺序全读。推荐优先级：

| 优先级 | 命令 | 内容 | 什么时候读 |
|---|---|---|---|
| ★★★ | `:h usr_24` | 快速插入 | 觉得插入效率低时 |
| ★★★ | `:h usr_26` | 重复操作（`.`、宏） | 读完 `usr_10` 后 |
| ★★★ | `:h usr_27` | 搜索与正则 | 需要复杂替换时 |
| ★★★ | `:h usr_29` | 在代码中移动（`%`、`[[`、`]]`） | 开始写代码时 |
| ★★★ | `:h usr_30` | 编辑程序（缩进、编译、跳转） | 开始写代码时 |
| ★★ | `:h usr_28` | 折叠 | 文件很长时 |
| ★★ | `:h usr_32` | undo tree | 撤销撤乱了时 |
| ★★ | `:h usr_21` | session / view（离开再回来） | 想保存工作现场时 |
| ★ | `:h usr_22` | 查找要编辑的文件 | 需要文件浏览时 |
| ★ | `:h usr_23` | 编辑其他文件 | 需要时 |
| 跳过 | `:h usr_25` | 排版文本 | 不写文档可跳过 |
| 跳过 | `:h usr_31` | GUI 技巧 | 终端用户跳过 |

在线入口：<https://neovim.io/doc/user/usr_20/>（把 `usr_20` 换成对应章节即可）

---

## 6. 第 5 步：配置、映射、插件（结合本仓库）

**前置条件**：已经读完 `usr_04`、`usr_05`、`usr_07`，知道 buffer / window / mapping / option 是什么。

### 6.1 推荐顺序

| 顺序 | 命令 | 学什么 | 对应本仓库文件 |
|---|---|---|---|
| 1 | `:h config` | `init.lua` 的加载顺序、`stdpath` | `init.lua` |
| 2 | `:h lua-guide` | 用 Lua 配置 Nvim 的“生存包” | 全部 `lua/` |
| 3 | `:h options` + `:h 'option'` | 选项总览与单项查询 | `lua/core/options.lua` |
| 4 | `:h vim.o` / `:h vim.opt` | Lua 里读写选项 | `lua/core/options.lua` |
| 5 | `:h key-mapping`、`:h vim.keymap.set()` | 映射、`<leader>`、模式 | `lua/core/keymaps.lua` |
| 6 | `:h autocmd` | 事件驱动配置 | `lua/plugins/configs/*.lua` |
| 7 | `:h vim.pack` | Neovim 0.12 内置插件管理器 | `lua/plugins/plugins.lua`、`nvim-pack-lock.json` |
| 8 | `:h lua-plugin` | 写自己的插件（暂时不用） | 以后再看 |

在线：

- <https://neovim.io/doc/user/lua-guide/>
- <https://neovim.io/doc/user/options/>
- <https://neovim.io/doc/user/map/>
- <https://neovim.io/doc/user/autocmd/>
- <https://neovim.io/doc/user/pack/#vim.pack>

### 6.2 重要提醒

- `lua-guide` 开头就说明：**它假设你已经会 Nvim 的基本操作**（命令、选项、映射、autocmd）。所以它排在用户手册之后，不要第一天读。
- 查选项不要通读 `options.txt`，直接 `:h 'number'`、`:h 'clipboard'`。
- 映射先查 `:h map.txt` 的模式前缀（`n`/`i`/`v`/`x`/`o`/`t`），再查 `:h vim.keymap.set()`。
- 本仓库用 `vim.pack` 管理插件，所以读 `:h vim.pack` 比读 lazy.nvim 文档更对口；`nvim-pack-lock.json` 对应 `:h vim.pack-lockfile`。
- 想看官方推荐的最小配置：`:h config-example`（`example_init.lua`）。

---

## 7. 第 6 步：按领域查文档（永远不要通读）

这些文档篇幅大、更新快，**只在你需要某个功能时读对应章节**。

| 领域 | 命令 | 说明 |
|---|---|---|
| LSP / 补全 / 跳转 | `:h lsp-quickstart` | 先读 quickstart，再看 `:h lsp-config` |
| Treesitter | `:h treesitter` | 语法树、高亮、注入 |
| 诊断 / 错误提示 | `:h diagnostic-quickstart` | 虚拟文本、sign、跳转 |
| 文件类型 | `:h filetype` | `ftplugin`、`after/ftplugin` |
| 语法高亮 | `:h syntax` | 传统 regex 语法（与 treesitter 不同） |
| 编译错误列表 | `:h quickfix` | `:make`、`:copen`、`:cnext` |
| 正则 | `:h pattern` | Vim 正则与 PCRE 的差异 |
| Lua API | `:h lua`, `:h lua-stdlib` | `vim.*` 函数总览 |
| Nvim API | `:h api`, `:h vim.api` | `nvim_*` 函数 |
| Vimscript 函数 | `:h vimscript-functions`, `:h vim.fn` | 在 Lua 里调用 `vim.fn.*` |
| 启动流程 | `:h starting` | 命令行参数、初始化顺序 |
| 窗口/缓冲区 | `:h windows` | `:h buffers` 相关命令 |
| 撤销 | `:h undo` | undo tree、持久化撤销 |
| 消息/报错 | `:h message` | 报错含义 |
| FAQ / 技巧 | `:h faq`, `:h tips` | 常见问题合集 |

### 特别重要的两篇

1. **`:h vim-differences`**（Nvim 与 Vim 的差异）  
   网上大量教程写的是 Vim，甚至 Vim9script。读之前先知道哪些不适用，能少踩很多坑。  
   <https://neovim.io/doc/user/vim_diff/#vim-differences>
2. **`:h news` + `:h deprecated`**（版本变化）  
   升级 Neovim 前读 `news`（0.12 的 `news` 是相对 0.11 的变化），插件报错时查 `deprecated`。**平时不要读。**

---

## 8. 明确不要通读的文件

下面这些是“字典”，通读只会挫败：

| 文件 | 为什么不要通读 |
|---|---|
| `options.txt` | 几百个选项，99% 你用不到 |
| `index.txt` | 所有命令的索引，用来查 |
| `quickref.txt` | 速查表，适合浏览，不适合背 |
| `api.txt` | RPC/Lua API 全量参考 |
| `lua.txt` | Lua API 全量参考（4000+ 行） |
| `vimfn.txt` | Vimscript 函数全量参考 |
| `autocmd.txt` | 事件列表，用时查 |
| `pattern.txt` | 正则语法参考 |
| `syntax.txt` | 语法文件写法，写插件才需要 |
| `news.txt` / `news-0.1x.txt` | 变更日志，升级时查 |
| `deprecated.txt` | 废弃清单，排错时查 |

正确用法：

```vim
:h 'relativenumber'      " 查单个选项
:h nvim_create_autocmd() " 查单个函数
:h :s                     " 查单个命令
:helpgrep telescope       " 全文搜插件相关帮助
```

---

## 9. 两周执行计划

按每天 30–60 分钟设计。进度慢没关系，**宁可少读，不要只读不练**。

| 天 | 内容 | 产出/自检 |
|---|---|---|
| Day 1 | `:h helphelp`、`:h notation`、`:h help-summary`；练 `CTRL-]` / `CTRL-T` / `:helpgrep` | 能 30 秒内查到任意命令的帮助 |
| Day 2 | `:h nvim-intro` + `:Tutor` 第一遍 | 能完成基本编辑并退出 |
| Day 3 | `:Tutor` 第二遍 + `:h intro` | 能解释 motion / operator / buffer |
| Day 4 | `:h usr_02` + `:h usr_03` | 移动和搜索不靠鼠标 |
| Day 5 | `:h usr_04`（上）操作符 + 动作 | 练 `dw`、`ciw`、`dap`、`yi(` |
| Day 6 | `:h usr_04`（下）文本对象 + 可视模式 | 不看提示完成 20 个组合 |
| Day 7 | 复习 + `:h usr_05` | 看懂本仓库的 `options.lua` / `keymaps.lua` |
| Day 8 | `:h usr_07` + `:h usr_08` | 会用 buffer、split、`CTRL-W` |
| Day 9 | `:h usr_10` | 会录宏、用寄存器、`:s` 替换 |
| Day 10 | `:h usr_06`、`:h usr_11`、`:h usr_12` 速读 + 复习 | 查漏补缺 |
| Day 11 | `:h config` + `:h lua-guide` | 知道 `init.lua` 如何加载 |
| Day 12 | `:h options` + `:h vim.opt` + `:h key-mapping` | 能自己加一个选项和一个映射 |
| Day 13 | `:h autocmd` + `:h vim.pack` | 看懂本仓库插件配置 |
| Day 14 | `:h lsp-quickstart` + `:h diagnostic-quickstart` + `:h treesitter` | 配好一个语言服务器并验证 |

> 两周后：把 `usr_20`–`usr_32` 当工具书，遇到问题查对应章节；`news` / `deprecated` 只在升级时看。

---

## 10. 遇到问题时的查文档决策树

按顺序试，通常 1 分钟内解决：

1. **“这个键是干嘛的？”**
   - `:h index`（全部命令索引）
   - 或 `:h <key>`，如 `:h CTRL-R`
2. **“这个选项是什么意思？”**
   - `:h 'optionname'`，例如 `:h 'textwidth'`
3. **“这个函数怎么用？”**
   - `:h expand()`（Vimscript 函数）
   - `:h nvim_create_autocmd()`（Nvim API）
   - `:h lua-stdlib`（`vim.*` Lua API）
4. **“这个命令怎么用？”**
   - `:h :command`，例如 `:h :s`、`:h :g`
5. **“有没有示例配置？”**
   - `:h config-example`
   - `:h lua-guide`
   - `:h lsp-quickstart`
6. **“报错是什么意思？”**
   - `:messages` 看完整消息
   - `:h message.txt` 查错误文本
7. **“Vim 教程里能用，Nvim 里不行？”**
   - `:h vim-differences`
   - `:h deprecated`
8. **“升级后配置坏了？”**
   - `:h news` → `:h deprecated`
   - `:checkhealth`
9. **“某个插件的用法？”**
   - `:helpgrep plugin-name`
   - `:h <plugin-tag>`（插件一般会注册 tag）

---

## 11. 新手最常见的 10 个误区

1. **从 `options.txt` / `api.txt` 开始读** → 应该从 `:Tutor` 和 `usr_02` 开始。
2. **把参考手册当教程顺序读** → 参考手册只用来查。
3. **先抄 LazyVim / NvChad 配置** → 官方建议先用原版配置，按需增加；否则出问题不知道是哪层。
4. **先读 `lua-guide`** → 它明确假设你会 Nvim 基本操作，先读用户手册。
5. **只看不练** → 每读一节，立刻在 `:enew` 里操作。
6. **背快捷键** → 记住“操作符 + 动作”的组合规则，比背 200 个键有用。
7. **忽略 `:h` 的补全和搜索** → `CTRL-D`、`:helpgrep` 是效率核心。
8. **跟着旧的中文博客配置** → 先看本地 `:h`（版本匹配），博客只作参考。
9. **升级后不看 `news` / `deprecated`** → 0.12 有不少破坏性变更。
10. **在 help 窗口里迷路** → 记住 `CTRL-]` 进、`CTRL-T` 回、`:q` 关。

---

## 12. 速查卡

### 12.1 help 操作

```vim
:h                  " 帮助首页
:h topic            " 查主题
:h 'number'         " 查选项
:h :s               " 查命令
:h vim.keymap.set() " 查函数
:h topic<Tab>       " 补全
:h topic<C-D>       " 列出匹配
CTRL-]              " 跳转标签
CTRL-T              " 返回
CTRL-O / CTRL-I     " 历史后退 / 前进
gO                  " 帮助目录
:helpgrep word      " 全文搜索
:copen              " 打开搜索结果
:q                  " 关闭帮助
```

### 12.2 新手最短路径

```text
:h helphelp → :h nvim-intro → :Tutor → :h intro
→ :h usr_02 → usr_03 → usr_04 → usr_05 → usr_07 → usr_08 → usr_10
→ 按需读 usr_20–usr_32
→ :h config → :h lua-guide → :h options → :h key-mapping
→ :h autocmd → :h vim.pack
→ :h lsp-quickstart / :h treesitter / :h diagnostic-quickstart
```

### 12.3 本机版本

```vim
:version
:checkhealth
```

本机：**NVIM v0.12.6**。在线文档可能对应稳定版；行为有疑问时以本地 `:h` 为准。

---

## 附录 A：读英文文档必备术语

| 英文 | 中文 | 帮助入口 |
|---|---|---|
| motion | 动作（光标移动） | `:h motion.txt` |
| operator | 操作符（`d`/`c`/`y` 等） | `:h operator` |
| text object | 文本对象（`iw`、`ap`、`i"`） | `:h text-objects` |
| count | 数字前缀（`3dd`） | `:h count` |
| register | 寄存器 | `:h registers` |
| mark | 标记 | `:h mark` |
| buffer | 缓冲区（打开的文件） | `:h buffers` |
| window | 窗口（分屏） | `:h windows` |
| tabpage | 标签页 | `:h tabpage` |
| fold | 折叠 | `:h fold` |
| mapping | 键位映射 | `:h key-mapping` |
| option | 选项 | `:h options` |
| autocmd | 自动命令（事件钩子） | `:h autocmd` |
| runtimepath | 运行时路径 | `:h 'runtimepath'` |
| quickfix | 错误/搜索结果列表 | `:h quickfix` |
| scratch buffer | 临时缓冲区 | `:h scratch-buffer` |

---

## 附录 B：官方英文文档链接总表

> 在线文档地址规律：`https://neovim.io/doc/user/<文件名不带 .txt>/`

| 文档 | 本地命令 | 在线（英文） |
|---|---|---|
| 帮助首页 | `:h` | <https://neovim.io/doc/user/> |
| help 的用法 | `:h helphelp` | <https://neovim.io/doc/user/helphelp/> |
| 符号约定 | `:h notation` | <https://neovim.io/doc/user/helphelp/#notation> |
| Nvim 入门 | `:h nvim-intro` | <https://neovim.io/doc/user/nvim/#nvim-intro> |
| 交互教程 | `:Tutor` | <https://neovim.io/doc/user/usr_01/#tutor> |
| Vim 概念介绍 | `:h intro` | <https://neovim.io/doc/user/intro/> |
| 速查表 | `:h quickref` | <https://neovim.io/doc/user/quickref/> |
| 用户手册目录 | `:h usr_toc` | <https://neovim.io/doc/user/usr_toc/> |
| `usr_01`–`usr_12` | `:h usr_02` … | <https://neovim.io/doc/user/usr_02/> … |
| `usr_20`–`usr_32` | `:h usr_24` … | <https://neovim.io/doc/user/usr_24/> … |
| 命令索引 | `:h index` | <https://neovim.io/doc/user/vimindex/> |
| 选项 | `:h options` | <https://neovim.io/doc/user/options/> |
| 映射 | `:h key-mapping` | <https://neovim.io/doc/user/map/> |
| 自动命令 | `:h autocmd` | <https://neovim.io/doc/user/autocmd/> |
| 正则 | `:h pattern` | <https://neovim.io/doc/user/pattern/> |
| Lua 配置指南 | `:h lua-guide` | <https://neovim.io/doc/user/lua-guide/> |
| Lua API | `:h lua` | <https://neovim.io/doc/user/lua/> |
| Nvim API | `:h api` | <https://neovim.io/doc/user/api/> |
| Vimscript 函数 | `:h vimscript-functions` | <https://neovim.io/doc/user/vimfn/> |
| 插件管理器 | `:h vim.pack` | <https://neovim.io/doc/user/pack/#vim.pack> |
| LSP | `:h lsp-quickstart` | <https://neovim.io/doc/user/lsp/> |
| Treesitter | `:h treesitter` | <https://neovim.io/doc/user/treesitter/> |
| 诊断 | `:h diagnostic-quickstart` | <https://neovim.io/doc/user/diagnostic/> |
| 文件类型 | `:h filetype` | <https://neovim.io/doc/user/filetype/> |
| 与 Vim 的差异 | `:h vim-differences` | <https://neovim.io/doc/user/vim_diff/#vim-differences> |
| 版本变化 | `:h news` | <https://neovim.io/doc/user/news/> |
| 废弃功能 | `:h deprecated` | <https://neovim.io/doc/user/deprecated/> |
| FAQ | `:h faq` | <https://neovim.io/doc/user/faq/> |
| 技巧 | `:h tips` | <https://neovim.io/doc/user/tips/> |
| 报错信息 | `:h message` | <https://neovim.io/doc/user/message/> |
| 启动流程 | `:h starting` | <https://neovim.io/doc/user/starting/> |

---

**最后一句**：文档不是用来“读完”的，是用来**在需要的时候 30 秒内找到答案**的。先用 `:Tutor` 和 `usr_01`–`usr_12` 建立肌肉记忆，剩下的交给 `:h`。
