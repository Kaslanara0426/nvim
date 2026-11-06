-- 配置
require("nvim-treesitter-textobjects").setup {
  select = {
    -- 自动向前跳转到文本对象，类似于 targets.vim
    lookahead = true,

    -- 你可以选择选择模式（默认是按字符 'v'）
    --
    -- 也可以是一个函数，接收一个包含以下键的表：
    -- * query_string: 例如 '@function.inner'
    -- * method: 例如 'v' 或 'o'
    -- 并应返回模式（'v'、'V' 或 ''）或一个映射
    -- query_strings 到模式的表。
    selection_modes = {
      ['@parameter.outer'] = 'v', -- 按字符
      ['@function.outer'] = 'V', -- 按行
      -- ['@class.outer'] = '', -- 按块
    },

    -- 如果将此设置为 `true`（默认是 `false`），则任何文本对象都会
    -- 扩展以包含前面或后面的空白。后面的
    -- 空白优先，以便与内置的 `ap` 行为类似。
    --
    -- 也可以是一个函数，接收一个包含以下键的表：
    -- * query_string: 例如 '@function.inner'
    -- * selection_mode: 例如 'v'
    -- 并应返回 true 或 false
    include_surrounding_whitespace = false,
  },
}

-- 选中整个函数 (包括函数声明和函数体)
vim.keymap.set({ "x", "o" }, "am", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "选中整个函数 (around function)" })

-- 选中函数内部的代码 (不包括函数声明)
vim.keymap.set({ "x", "o" }, "im", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "选中函数内部 (inner function)" })

-- 选中整个类
vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "选中整个类 (around class)" })

-- 选中类的内部
vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "选中类内部 (inner class)" })

-- -- 将光标下的参数与【下一个】参数交换位置
-- vim.keymap.set("n", "<leader>a", function()
--   require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
-- end, { desc = "与下一个参数交换位置" })
--
-- -- 将光标下的参数与【上一个】参数交换位置
-- vim.keymap.set("n", "<leader>A", function()
--   require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
-- end, { desc = "与上一个参数交换位置" })
--

-- 跳转到【下一个函数】的开头
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "跳转到下一个函数开头" })

-- 跳转到【上一个函数】的开头
vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "跳转到上一个函数开头" })

-- 跳转到【下一个函数】的结尾
vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "跳转到下一个函数结尾" })

-- 跳转到【上一个类】的开头
vim.keymap.set({ "n", "x", "o" }, "[[", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "跳转到上一个类开头" })

-- 跳转到【下一个折叠点】(基于语法树)
vim.keymap.set({ "n", "x", "o" }, "]z", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end, { desc = "跳转到下一个折叠区域" })

-- local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

-- -- 重复上一次的移动操作，按 ; 继续往前找
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next, 
--   { desc = "重复上次文本对象移动 (向前)" })
--
-- -- 反向重复上一次的移动操作，按 , 往回找
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, 
--   { desc = "重复上次文本对象移动 (向后)" })
