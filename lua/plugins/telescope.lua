return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install'
    }
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
    })

    telescope.load_extension('fzf')
  end,
  cmd = 'Telescope',
  keys = {
    { '<Leader>fg', function() require('telescope.builtin').live_grep() end },
    { '<Leader>ff', function() require('telescope.builtin').find_files() end },
    { '<Leader>fb', function() require('telescope.builtin').current_buffer_fuzzy_find() end },
    { '<Leader>fc', function() require('telescope.builtin').colorscheme() end },
    { '<Leader>fh', function() require('telescope.builtin').help_tags() end }
  }
}
