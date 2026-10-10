vim.pack.add({
  -- 语法树和高亮和跳转
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/aaronik/treewalker.nvim' },
  -- 颜色代码显示色块
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" }, })


-- treesitter
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 'rust', 'c', 'lua'}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'rust' },
  callback = function() vim.treesitter.start() end,
})


-- 颜色代码显示色块
require('nvim-highlight-colors').setup({})

-- 代码高亮颜色自定义
  -- 设置全局高亮组
  -- @comment             注释
  -- @function            函数名
  -- @function.call       函数调用
  -- @variable            变量
  -- @variable.parameter  函数参数
  -- @keyword             关键字（if、return 等）
  -- @string              字符串
  -- @number              数字
  -- @type                类型
  -- @constant            常量
  -- @operator            运算符
  -- @property            属性/字段

vim.api.nvim_set_hl(0, '@comment',            { fg = '#00A853', italic = true })
vim.api.nvim_set_hl(0, '@keyword',            { fg = '#FF79C6', bold = true })
vim.api.nvim_set_hl(0, '@string',             { fg = '#D19A66' })
vim.api.nvim_set_hl(0, '@function',           { fg = '#FF00FF', bold = true })
vim.api.nvim_set_hl(0, '@function.call',      { fg = '#61AFEF' })
vim.api.nvim_set_hl(0, '@variable',           { fg = '#F0FF0F' })
vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#D19A66', italic = true })
vim.api.nvim_set_hl(0, '@number',             { fg = '#BD93F9' })
vim.api.nvim_set_hl(0, '@type',               { fg = '#00FFFF' })
vim.api.nvim_set_hl(0, '@constant',           { fg = '#BD93F9', bold = true })
vim.api.nvim_set_hl(0, '@operator',           { fg = '#ABB2BF' })
vim.api.nvim_set_hl(0, '@property',           { fg = '#00FFFF' })


-- ============================================================
-- nvim-treesitter-textobjects 快捷键速查表
-- ============================================================

-- 📌 模式说明
-- 普通模式：光标移动、执行操作
-- 可视模式：先按 v 进入，用于选中文本
-- 操作符模式：按 d、c、y 后，再按快捷键即可对目标对象执行操作

-- ⭐ 函数参数（最常用）
-- ]a   跳到下一个参数的开始
-- [a   跳到上一个参数的开始
-- ============================================================
-- 一、选择对象（可视模式 / 操作符模式）
-- ============================================================
-- am   选中整个函数（包含函数名、参数、函数体）
-- im   选中函数内部（不包含函数名和括号，仅函数体）
-- ac   选中整个类
-- ic   选中类内部
-- as   选中当前局部作用域
--
-- 用法举例：操作符模式下，dam 删除整个函数；yac 复制整个类。

-- ============================================================
-- 二、交换参数（普通模式）
-- ============================================================
-- <leader>a   当前参数与下一个参数交换位置
-- <leader>A   当前参数与上一个参数交换位置
--
-- 说明：<leader> 通常是空格键或 \ 键，取决于你的个人配置。

-- ============================================================
-- 三、跳转移动（普通 / 可视 / 操作符模式）
-- ============================================================

-- 函数与类
-- ]m   跳到下一个函数的开始
-- [m   跳到上一个函数的开始
-- ]M   跳到下一个函数的结尾
-- [M   跳到上一个函数的结尾
-- ]]   跳到下一个类的开始
-- [[   跳到上一个类的开始
-- ][   跳到下一个类的结尾
-- []   跳到上一个类的结尾

-- 循环与作用域
-- ]o   跳到下一个循环的开始
-- ]s   跳到下一个局部作用域的开始
-- ]z   跳到下一个折叠区域的开始

-- 条件语句
-- ]d   跳到下一个条件语句
-- [d   跳到上一个条件语句

-- ============================================================
-- 四、重复移动（普通 / 可视 / 操作符模式）
-- ============================================================
-- ;      向前重复上一次的跳转动作
-- ,      向后重复上一次的跳转动作
-- <home> 重复上一次跳转，跳到范围起点
-- <end>  重复上一次跳转，跳到范围终点
--
-- ⚡ 附加增强（f/F/t/T 重复）
-- 配置中已经让内置的 f、F、t、T 查找也支持用 ; 和 , 重复：
-- 按 f 查找字符 → 按 ; 继续查找下一个 → 按 , 查找上一个
-- 同理适用于 F、t、T

-- ============================================================
-- 💡 常用组合技示例
-- ============================================================
-- dam    删除整个函数
-- cim    修改函数内部内容
-- yac    复制整个类
-- d]m    从当前位置删除到下一个函数的开始处
-- v]o    可视模式下，选中当前位置到下一个循环之间的内容

-- ============================================================
-- ⚠️ 排错提示
-- ============================================================
-- 如果上述快捷键没有生效，请按以下步骤检查：
-- 1. 确认当前文件的语言 Parser 已安装（例如 C 语言需要 :TSInstall c）。
-- 2. 确认当前文件已启用 Treesitter 高亮（:TSBufEnable highlight）。
-- 3. 如果提示找不到方法，可能是 main 分支与 master 分支的配置方式不同，
--    请确认你的插件版本与配置匹配。

-- ============================================================
-- 文档结束
-- ============================================================

-- 1. 初始化配置（只需要调用一次 setup）
require("nvim-treesitter-textobjects").setup {
  select = {
    -- 自动向前查找文本对象，行为类似于 targets.vim 插件
    lookahead = true,
    -- 你可以选择不同的选择模式（默认为字符级 'v'）
    -- 也可以传入一个函数，根据查询字符串和模式返回 'v', 'V', 或 '<c-v>'
    selection_modes = {
      ['@parameter.outer'] = 'v', -- 字符级选择
      ['@function.outer'] = 'V',  -- 行级选择
      -- ['@class.outer'] = '<c-v>', -- 块级选择（可选）
    },
    -- 如果设置为 `true`（默认为 `false`），任何文本对象都会包含前后的空白字符。
    -- 优先包含后续的空白，行为类似内置的 `ap`。
    -- 也可以传入一个函数，根据查询字符串和模式返回 true 或 false
    include_surrounding_whitespace = false,
  },
  move = {
    -- 移动时是否将位置记录到跳转列表中（这样可以使用 <C-o> 返回）
    set_jumps = true,
  },
}

-- ==========================================
-- 2. 选择模块 (Select) 键位映射
-- 可以使用 `textobjects.scm` 中定义的捕获组
-- 这些映射在可视模式(x)和操作符模式(o)下生效
-- ==========================================
local select = require "nvim-treesitter-textobjects.select"
-- 选择当前函数（外部）
vim.keymap.set({ "x", "o" }, "am", function()
  select.select_textobject("@function.outer", "textobjects")
end)
-- 选择当前函数（内部）
vim.keymap.set({ "x", "o" }, "im", function()
  select.select_textobject("@function.inner", "textobjects")
end)
-- 选择当前类（外部）
vim.keymap.set({ "x", "o" }, "ac", function()
  select.select_textobject("@class.outer", "textobjects")
end)
-- 选择当前类（内部）
vim.keymap.set({ "x", "o" }, "ic", function()
  select.select_textobject("@class.inner", "textobjects")
end)
-- 也可以使用其他查询组（如 `locals.scm`）中的捕获组：选择当前作用域
vim.keymap.set({ "x", "o" }, "as", function()
  select.select_textobject("@local.scope", "locals")
end)

-- ==========================================
-- 3. 交换模块 (Swap) 键位映射
-- 在普通模式(n)下生效
-- ==========================================
local swap = require("nvim-treesitter-textobjects.swap")
-- 将当前参数与下一个参数交换
vim.keymap.set("n", "<leader>a", function()
  swap.swap_next "@parameter.inner"
end)
-- 将当前参数与上一个参数交换
vim.keymap.set("n", "<leader>A", function()
  swap.swap_previous "@parameter.inner"
end)

-- ==========================================
-- 4. 移动模块 (Move) 键位映射
-- 在普通、可视、操作符模式 (n, x, o) 下生效
-- 可以使用 `textobjects.scm` 中定义的捕获组
-- ==========================================
local move = require("nvim-treesitter-textobjects.move")

-- 跳转到下一个函数/类的开始
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  move.goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
  move.goto_next_start("@class.outer", "textobjects")
end)
-- 也可以传入一个列表来组合多个查询（例如跳转到下一个循环）
vim.keymap.set({ "n", "x", "o" }, "]o", function()
  move.goto_next_start({"@loop.inner", "@loop.outer"}, "textobjects")
end)
-- 跳转到下一个局部作用域（使用 `locals.scm` 查询组）
vim.keymap.set({ "n", "x", "o" }, "]s", function()
  move.goto_next_start("@local.scope", "locals")
end)
-- 跳转到下一个折叠区域（使用 `folds.scm` 查询组）
vim.keymap.set({ "n", "x", "o" }, "]z", function()
  move.goto_next_start("@fold", "folds")
end)

-- 跳转到下一个函数/类的结尾
vim.keymap.set({ "n", "x", "o" }, "]M", function()
  move.goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
  move.goto_next_end("@class.outer", "textobjects")
end)

-- 跳转到上一个函数/类的开始
vim.keymap.set({ "n", "x", "o" }, "[m", function()
  move.goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
  move.goto_previous_start("@class.outer", "textobjects")
end)

-- 跳转到上一个函数/类的结尾
vim.keymap.set({ "n", "x", "o" }, "[M", function()
  move.goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
  move.goto_previous_end("@class.outer", "textobjects")
end)

-- 跳转到下一个/上一个条件语句（如果你需要更细粒度的移动）
vim.keymap.set({ "n", "x", "o" }, "]d", function()
  move.goto_next("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[d", function()
  move.goto_previous("@conditional.outer", "textobjects")
end)

-- ==========================================
-- 5. 重复移动模块 (Repeatable Move) 键位映射
-- 让你可以用 ; 和 , 重复上一次的移动操作
-- ==========================================
local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

-- 使用 ; 和 , 重复移动
-- 确保 ; 始终向前，, 始终向后，无论上一次移动的方向如何
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- 如果你更喜欢 Vim 原生行为（; 和上次移动方向一致），可以注释掉上面两行，使用下面这行：
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- 可选：让内置的 f, F, t, T 也支持用 ; 和 , 重复
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- 使用 <home> 和 <end> 键重复上次查询，并强制跳到范围的开始或结尾
vim.keymap.set({ "n", "x", "o" }, "<home>", function()
  ts_repeat_move.repeat_last_move({forward = false, start = true})
end)
vim.keymap.set({ "n", "x", "o" }, "<end>", function()
  ts_repeat_move.repeat_last_move({forward = true, start = false})
end)



-- 4. 移动模块 (Move)
local move = require("nvim-treesitter-textobjects.move")

-- ⭐ 参数跳转（重点补充）
vim.keymap.set({ "n", "x", "o", "i"}, "<C-u>", function() move.goto_next_start("@parameter.inner", "textobjects") end, { desc = "跳到下一个参数" })
vim.keymap.set({ "n", "x", "o", "i"}, "<C-i>", function() move.goto_previous_start("@parameter.inner", "textobjects") end, { desc = "跳到上一个参数" })
