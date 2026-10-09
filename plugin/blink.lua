vim.pack.add({
  -- 代码补全和代码片段库
  { src = "https://github.com/saghen/blink.lib" }, -- 代码补全
  { src = "https://github.com/Saghen/blink.cmp" }, -- 代码补全
  { src = "https://github.com/L3MON4D3/LuaSnip" }, -- 代码片段模板
  { src = "https://github.com/rafamadriz/friendly-snippets" }, -- 代码片段库
})

require('blink.cmp').build():pwait()

require('blink.cmp').setup({
  -- 全局启用/禁用逻辑（可选）
  enabled = function()
    -- 默认在 'lua' 和 'markdown' 文件中禁用补全
    return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
  end,
  -- 快捷键预设（可选，不写则使用默认值）
  keymap = { preset = 'default' },

  -- 命令行补全（独立于主补全功能）
  cmdline = { enabled = false },

  -- 补全核心行为
  completion = {
    -- 关键字匹配范围：'prefix' 仅匹配光标前，'full' 匹配光标前后
    keyword = { range = 'full' },

    -- 接受补全时的行为：禁用自动括号
    accept = { auto_brackets = { enabled = false } },

    -- 补全列表的选择行为
    -- 注意：此处只保留一份 list 配置，且 preselect 不支持函数
    list = { 
      selection = { 
        preselect = false,    -- 是否默认预选第一项
        auto_insert = true    -- 选择后是否自动插入
      } 
    },

    -- 补全菜单外观
    menu = {
      border = 'rounded',        -- 设置边框为圆角样式
      winblend = 0,             -- 设置半透明程度，0为不透明，100为完全透明
      winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
      draw = {                   -- 保持你之前的菜单列布局
        gap = 6,
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", gap = 1 },
        },
      },
      auto_show = true, -- 是否自动弹出菜单
    },

    -- 文档窗口
    documentation = { 
      auto_show = true, 
      auto_show_delay_ms = 500 
    },

    -- 幽灵文本预览
    ghost_text = { enabled = true },
  },

  -- 补全来源
  sources = {
    -- 默认启用的来源，按优先级排序
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- 代码片段引擎预设
  -- 注意：此处必须使用具体的字符串，不能写 'default' | 'luasnip'
  -- 可选值：'default'（内置）, 'luasnip', 'mini_snippets', 'vsnip'
  snippets = { preset = 'default' },

  -- 实验性签名帮助
  signature = { enabled = true },
})




-- require("luasnip.loaders.from_snipmate").lazy_load()
-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/firefly/.config/nvim/snippets/snippets" } })
