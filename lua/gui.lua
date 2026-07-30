local function has(feature)
  return vim.fn.has(feature) == 1
end

-- Set fonts
if has('gui_running') then
  if has('win32') then
    vim.o.guifont = 'Cascadia Mono:h12'
  elseif has('mac') then
    vim.o.guifont = 'Menlo:h12'
  end
end

-- Neovide-specific settings
local function update_title_colors()
  local id = vim.api.nvim_get_hl_id_by_name('Normal')
  local hl = vim.api.nvim_get_hl(0, { id = id })

  for key, value in pairs(hl) do
    hl[key] = string.format('%x', value)
  end

  vim.g.neovide_title_text_color       = hl.fg
  vim.g.neovide_title_background_color = hl.bg
end

if vim.g.neovide then
  vim.g.neovide_theme = 'auto'

  vim.keymap.set('n', '<F11>', function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end)

  if has('win32') then
    update_title_colors()

    vim.api.nvim_create_autocmd('ColorScheme', {
      group    = vim.api.nvim_create_augroup('UpdateTitleColors', { clear = true }),
      callback = update_title_colors
    })
  end
end
