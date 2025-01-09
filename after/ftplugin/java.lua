-- Folds
vim.opt_local.foldmethod = 'expr'

-- Comments
vim.opt_local.commentstring = '// %s'

-- LSP Stuff
local root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1])
local workspace_dir = vim.fn.expand '$HOME/.cache/jdtls/workspace'
local config_dir = vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/config_linux'
local equinox_fp = vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'

local classpath = vim.env.CLASSPATH == nil and '.' or vim.env.CLASSPATH
vim.print(classpath)

local config = {
  cmd = {
    vim.fn.exepath 'jdtls',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-jar',
    equinox_fp,
    '-configuration',
    config_dir,
    '-data',
    workspace_dir,
  },
  root_dir = root_dir,
  settings = {
    java = {
      project = {
        referencedLibraries = vim.fn.split(classpath, ':'),
      },
    },
  },
}
require('jdtls').start_or_attach(config)
