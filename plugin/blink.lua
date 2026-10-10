vim.pack.add({
  -- 代码补全和代码片段库
  { src = "https://github.com/saghen/blink.lib" }, -- 代码前置补全
  { src = "https://github.com/Saghen/blink.cmp" }, -- 代码补全
  { src = "https://github.com/L3MON4D3/LuaSnip" }, -- 代码片段模板
  { src = "https://github.com/rafamadriz/friendly-snippets" }, -- 代码片段库
})

vim.diagnostic.config({ virtual_text = true }) -- 代码提示在右边
vim.opt.undofile = true -- 持久化撤回

require('blink.cmp').build():pwait()

require('blink.cmp').setup({
  -- 全局启用/禁用逻辑（可选）
  enabled = function()
    -- markdown' 文件中禁用补全
    return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
  end,
  -- 快捷键预设（可选，不写则使用默认值）
  keymap = {
    -- preset = 'default' 
    preset = 'super-tab',
    ['<A-y>'] = { 'show', 'fallback' }, -- 新增自定义快捷键
  },
  -- 命令行补全（独立于主补全功能）
  cmdline = { enabled = false },
  -- 补全核心行为
  completion = {
    -- 关键字匹配范围：'prefix' 仅匹配光标前，'full' 匹配光标前后
    keyword = { range = 'full' },

    -- 接受补全时的行为：启动自动括号
    accept = { auto_brackets = { enabled = true } },

    -- 补全列表的选择行为
    -- 注意：此处只保留一份 list 配置，且 preselect 不支持函数
    list = {
      selection = {
        preselect = true,    -- 是否默认预选第一项
        auto_insert = true    -- 选择后是否自动插入
      }
    },

    -- 补全菜单外观
    menu = {
      border = 'rounded',        -- 设置边框为圆角样式
      winblend = 0,             -- 设置半透明程度，0为不透明，100为完全透明
      winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
      draw = {                   -- 保持你之前的菜单列布局
        gap = 3,
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind", gap = 1 },
          { "source_name", gap = 1 }, -- 加上这一列，显示来源（lsp/clangd/path等）
        },
      },
      auto_show = false, -- 是否自动弹出菜单
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

    providers = {
      lsp = {
        transform_items = function(_, items)
          for _, item in ipairs(items) do
            -- 针对 C/C++ 头文件补全，移除文本末尾的 '>'
            if item.kind == require('blink.cmp.types').CompletionItemKind.File then
              item.label = item.label:gsub('>$', '')
              -- 如果补全项包含 textEdit，也需要同步修改
              if item.textEdit and item.textEdit.newText then
                item.textEdit.newText = item.textEdit.newText:gsub('>$', '')
              end
            end
          end
          return items
        end,
      },
    },
  },

  -- 代码片段引擎预设
  -- 注意：此处必须使用具体的字符串，不能写 'default' | 'luasnip'
  -- 可选值：'default'（内置）, 'luasnip', 'mini_snippets', 'vsnip'
  snippets = {
    preset = 'default',
    score_offset = 10,
  },

  -- 实验性签名帮助
  signature = {
    enabled = true,
    window = {
    show_documentation = true, -- 改回 true
    border = 'rounded',   -- 设置圆角边框
    winblend = 10
    }
  },

})

--
-- require("luasnip.loaders.from_snipmate").lazy_load()
-- -- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/home/firefly/.config/nvim/snippets" } })
--
--



