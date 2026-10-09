vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup {
  options = {
    theme = 'dracula'
  }
}


local base_statusline_highlights = {
  'StatusLine', 'StatusLineNC', 'Tabline', 'TabLineFill',
  'TabLineSel', 'Winbar', 'WinbarNC',
}
for _, hl_group in ipairs(base_statusline_highlights) do
  vim.api.nvim_set_hl(0, hl_group, { bg = 'none', ctermbg = 'none' })
end

local custom_theme = {
  normal = {
    a = { bg = 'none', fg = '#f8f8f2', gui = 'bold' },
    b = { bg = 'none', fg = '#f8f8f2' },
    c = { bg = 'none', fg = '#f8f8f2' },
  },
  insert = { a = { bg = 'none', fg = '#a6e3a1', gui = 'bold' } },
  -- 为 visual, replace, command 等模式重复上述配置...
}

require('lualine').setup {
  options = { theme = custom_theme }
}
