return {
  'folke/zen-mode.nvim',
  dependencies = {
    'folke/twilight.nvim'
  },
  opts = {
    window = {
      width = 80,
      options = {
        number         = false,
        relativenumber = false
      }
    }
  },
  keys = {
    { '<Leader>z', function() require('zen-mode').toggle() end }
  }
}
