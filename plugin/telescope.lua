vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-file-browser.nvim" }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<leader>s', function()
  builtin.live_grep({
    search_dirs = { vim.api.nvim_buf_get_name(0) },
    prompt_title = 'Live Grep in Current File',
  })
end, { desc = 'Live grep in current file' })


vim.keymap.set('n', '<leader>S', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-l>"] = "select_default",
      }
    }
  },
  pickers = {
    live_grep = {
      additional_args = { '--hidden' },
    },
  },
  extensions = {
    file_browser = {
      hidden = true, -- 关键设置：显示隐藏文件
      -- 其他 file_browser 选项...
    },
  },
})

