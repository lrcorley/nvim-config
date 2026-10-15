return {
  'mason-org/mason.nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  cmd = {
    'Mason', 'MasonUpdate', 'MasonInstall',
    'MasonUninstall', 'MasonUninstallAll',
    'MasonLog'
  },
  opts = {}
}
