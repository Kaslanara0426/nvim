-- 光标跳转插件
vim.pack.add({
  { src = "https://github.com/sphamba/smear-cursor.nvim" }
})

require('smear_cursor').setup({
  defaults = {
    mappings = {
      i = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
}
      }
    }
  }
})

