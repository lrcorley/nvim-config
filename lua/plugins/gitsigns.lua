return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '▶' },
      topdelete    = { text = '▶' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' }
    }
  },
  keys = {
    { '<Leader>r', function() require('gitsigns').reset_hunk() end }
  }
}
