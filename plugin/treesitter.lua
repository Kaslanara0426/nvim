vim.pack.add({
  -- 语法树和高亮和跳转
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'https://github.com/aaronik/treewalker.nvim' },
  -- 颜色代码显示色块
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" }, })


-- treesitter
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 'rust', 'c', 'lua'}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'rust' },
  callback = function() vim.treesitter.start() end,
})


-- 颜色代码显示色块
require('nvim-highlight-colors').setup({})

-- 代码高亮颜色自定义
  -- 设置全局高亮组
  -- @comment             注释
  -- @function            函数名
  -- @function.call       函数调用
  -- @variable            变量
  -- @variable.parameter  函数参数
  -- @keyword             关键字（if、return 等）
  -- @string              字符串
  -- @number              数字
  -- @type                类型
  -- @constant            常量
  -- @operator            运算符
  -- @property            属性/字段

vim.api.nvim_set_hl(0, '@comment',            { fg = '#00A853', italic = true })
vim.api.nvim_set_hl(0, '@keyword',            { fg = '#FF79C6', bold = true })
vim.api.nvim_set_hl(0, '@string',             { fg = '#D19A66' })
vim.api.nvim_set_hl(0, '@function',           { fg = '#FF00FF', bold = true })
vim.api.nvim_set_hl(0, '@function.call',      { fg = '#61AFEF' })
vim.api.nvim_set_hl(0, '@variable',           { fg = '#F0FF0F' })
vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#D19A66', italic = true })
vim.api.nvim_set_hl(0, '@number',             { fg = '#BD93F9' })
vim.api.nvim_set_hl(0, '@type',               { fg = '#00FFFF' })
vim.api.nvim_set_hl(0, '@constant',           { fg = '#BD93F9', bold = true })
vim.api.nvim_set_hl(0, '@operator',           { fg = '#ABB2BF' })
vim.api.nvim_set_hl(0, '@property',           { fg = '#00FFFF' })




