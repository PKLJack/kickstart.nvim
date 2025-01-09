vim.opt_local.commentstring = '// %s'

vim.opt_local.foldlevel = 6
vim.opt_local.foldmethod = 'indent'
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt_local.colorcolumn = { 81 }
