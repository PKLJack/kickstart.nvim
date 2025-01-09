vim.opt_local.foldlevel = 6
vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt_local.cuc = true

local filename = vim.api.nvim_buf_get_name(0)
local file_tr = vim.fn.fnamemodify(filename, ':t:r')

if string.match(file_tr, 'compose') then
  vim.opt_local.filetype = 'yaml.docker-compose'
end
