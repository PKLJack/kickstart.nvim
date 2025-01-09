-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['d'] = function(state)
            local path = state.tree:get_node().path
            vim.fn.system { 'trash-put', vim.fn.fnameescape(path) }
            require('neo-tree.sources.manager').refresh(state.name)
          end,
        },
      },
    },
    default_component_configs = {
      icon = {
        folder_closed = '',
        folder_open = '🗁',
        --
        -- folder_open = '📂',
      },
      git_status = {
        symbols = {
          -- Change type
          added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = '✖', -- this can only be used in the git_status source
          renamed = '󰁕', -- this can only be used in the git_status source
          -- Status type
          untracked = '',
          ignored = '☒',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
    },
  },
}
