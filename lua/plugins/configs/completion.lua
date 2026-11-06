local source_icons = {
	buffer = "",
	cmdline = "",
	lsp = "",
	path = "",
	snippets = "",
}
local function setup_blink_keyamp()
	return {
		preset = "none",
		["<A-u>"] = { "show_signature", "hide_signature" },
		["<A-n>"] = { "scroll_documentation_down", "fallback" },
		["<A-p>"] = { "scroll_documentation_up", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<A-h>"] = { "hide", "show", "fallback" },
		["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		["<A-j>"] = { "select_next", "select_prev", "fallback" },
		["<A-k>"] = { "select_prev", "fallback" },
	}
end

require("blink.cmp").setup({
  keymap = setup_blink_keyamp(),
  completion = {
    keyword = { range = "full" },
    accept = { auto_brackets = { enabled = true } },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
    menu = {
      border = "single",
      max_height = 8,
      min_width = 26,
      scrollbar = false,
      auto_show = true,
      draw = {
        components = {
          source_icon = {
            ellipsis = false,
            text = function(ctx)
              local source_name = ctx.source_name and ctx.source_name:lower() or ""
              return source_icons[source_name] or "?"
            end,
            highlight = "BlinkCmpSource",
          },
        },
        columns = {
          { "source_icon" },
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
          { "source_name" },
        },
      },
    },
    documentation = { auto_show = true, auto_show_delay_ms = 666 },
    ghost_text = { enabled = true },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {},
  },
  snippets = { preset = "default" },
  signature = { enabled = true },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- 代码片段
require("luasnip").setup({
  history = true,
  update_events = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",
  enable_autosnippets = false,
})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets" })

-- 自动括号
require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,          -- 自动闭合标签
    enable_rename = true,         -- 自动重命名配对标签
    enable_close_on_slash = false -- 输入 /> 时自动闭合为自闭合标签
  },
  -- -- 针对特定文件类型进行覆盖，优先级高于全局 opts
  -- per_filetype = {
  --   ["html"] = {
  --     enable_close = false      -- 例如，在 HTML 文件中关闭自动闭合功能
  --   }
  -- }
})
-- 自动括号
require("nvim-autopairs").setup({})
