-- Set colorscheme
vim.cmd('colorscheme retrobox')

-- Set leader
vim.g.mapleader = ' '

-- Ignore case when searching unless search contains uppercase
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- Disable highlight when searching
vim.opt.hlsearch = false

-- Tab & Indent
vim.opt.expandtab  = false
vim.opt.tabstop    = 4
vim.opt.shiftwidth = 0  -- Uses tabstop value
vim.opt.autoindent = true
vim.opt.cindent    = true
vim.opt.cinoptions = 'l1,g0,E-s,(0,Ws,m1'

-- Configure list mode
vim.opt.listchars = { tab = '→ ', space = '·', trail = '-' }

-- Line numbers
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.signcolumn     = 'yes:1'

-- Set scrolling offset
vim.opt.scrolloff     = 8
vim.opt.sidescrolloff = 24

-- Disable text wrapping
vim.opt.wrap = false

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set max popup menu height
vim.opt.pumheight = 12

-- Set border style of floating windows
vim.opt.winborder = 'none'
vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'NormalFloat' })

vim.api.nvim_create_autocmd('ColorScheme', {
  group    = vim.api.nvim_create_augroup('FloatBorderLinking', { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'NormalFloat' })
  end
})

-- Configure text formatting
local file_type_group = vim.api.nvim_create_augroup('FileTypeSettings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group    = file_type_group,
  pattern  = '*',
  callback = function()
    -- Disable comment leader continuation
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o'})
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group    = file_type_group,
  pattern  = { 'markdown' },
  callback = function()
    vim.opt_local.spell       = true
    vim.opt_local.colorcolumn = '80'
  end
})
