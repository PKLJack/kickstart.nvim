vim.opt_local.foldlevel = 6
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt_local.colorcolumn = { 81, 120 }

vim.keymap.set('n', '<LocalLeader>tp', '<cmd>PlenaryBustedFile %<CR>', {
  desc = 'Run PlenaryBustedFile on current file',
  buffer = 0,
})
