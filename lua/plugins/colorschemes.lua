return {
  'ficd0/ashen.nvim',
  'rebelot/kanagawa.nvim',
  'ramojus/mellifluous.nvim',
  'xero/miasma.nvim',
  'folke/tokyonight.nvim',
  'olivercederborg/poimandres.nvim',
  {
    'rose-pine/neovim',
    config = function()
      require('rose-pine').setup({
        dim_inactive_windows = true,
        styles = {
          italic = false,
          transparency = false
        }
      })

      vim.cmd('colorscheme rose-pine')
    end
  },
  { 'lunacookies/vim-colors-xcode' },
  { 'vague-theme/vague.nvim', opts = { italic = false } }
}
