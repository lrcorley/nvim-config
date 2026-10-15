local ok, registry = pcall(require, 'mason-registry')

local function lsp_enable(package)
  if package.spec.neovim and package.spec.neovim.lspconfig then
    vim.lsp.enable(package.spec.neovim.lspconfig)
  end
end

if ok then
  local installed_packages = registry.get_installed_packages()

  -- Enable installed lsp configs
  for _, package in ipairs(installed_packages) do
    lsp_enable(package)
  end

  -- Enable new lsp configs
  registry:on('package:install:success', vim.schedule_wrap(function(package)
    lsp_enable(package)
  end))
end

-- Configure LSP keymappings
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, '<Cmd>lua vim.' .. rhs .. '()<CR>', { buffer = true })
    end

    map('n', 'K',    'lsp.buf.hover')
    map('n', 'gd',   'lsp.buf.definition')
    map('n', 'go',   'lsp.buf.type_definition')
    map('n', 'gr',   'lsp.buf.references')
    map('n', '<F2>', 'lsp.buf.rename')
    map('n', '<F4>', 'lsp.buf.code_action')
    map('x', '<F4>', 'lsp.buf.range_code_action')
    map('n', 'gl',   'diagnostic.open_float')
    map('n', '[d',   'diagnostic.goto_prev')
    map('n', ']d',   'diagnostic.goto_next')
  end
})

-- Configure diagnostics
vim.diagnostic.config({
  severity_sort = true,
  float = {
    focusable = false,
    source = false,
    header = '',
    suffix = '',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '◆',
      [vim.diagnostic.severity.WARN]  = '◆',
      [vim.diagnostic.severity.INFO]  = '◆',
      [vim.diagnostic.severity.HINT]  = '◆'
    }
  }
})
