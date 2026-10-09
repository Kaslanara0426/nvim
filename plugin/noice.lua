vim.pack.add({
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/rcarriga/nvim-notify' },
  { src = 'https://github.com/folke/noice.nvim' }
})

require("noice").setup({
})

vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#1e1e2e" })
