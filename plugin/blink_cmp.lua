vim.pack.add({
  { src = "https://github.com/Saghen/blink.cmp" },
})


require 'blink.cmp'.setup {
  -- list = {
  --   selection = {
  --     preselect = true,  -- 开启自动预选
  --   },
  -- },
  keymap = {

    ["<Tab>"] = { "select_next", "fallback" }, --向下选择片段
    ["<S-Tab>"] = { "select_prev", "fallback" }, -- 向上选择片段
    ["<C-h>"] = { "show_signature", "hide_signature", "fallback" }, -- 参数信息 
    ["<C-j>"] = { "snippet_forward", "fallback" }, -- 向下移动参数
    ["<C-k>"] = { "snippet_backward", "fallback" }, -- 向上移动参数
    ['<C-e>'] = { 'accept', 'fallback' }
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  signature = { enabled = true },
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    documentation = {
      auto_show = false,
    },
  },

  sources = {
    default = { "snippets", "lsp", "path", "buffer" },
  },

  snippets = { preset = 'luasnip' }, -- 关键配置

  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
}


vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("luasnip").setup({})
-- 加载 friendly-snippets 提供的片段
require("luasnip.loaders.from_vscode").lazy_load() -- 这会加载 friendly-snippets
-- 加载 我自己的片段
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath('config') .. "/plugin/ff_snippets" } })


