vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" }
})



require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'rust', 'lua' }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "rust", "c", },
  callback = function() vim.treesitter.start() end,
})
