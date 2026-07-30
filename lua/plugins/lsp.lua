return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = { 'clangd', 'lua_ls', 'ts_ls', 'denols' }
  },
  dependencies = {
    { 'mason-org/mason.nvim', config = true },
    'neovim/nvim-lspconfig'
  },
  config = function(_, opts)
    require('mason-lspconfig').setup(opts)

    -- Configure LSP keymappings
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function()
        local function map(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, '<Cmd>lua ' .. rhs .. '<CR>', { buffer = true })
        end

        -- Displays hover information about the symbol under the cursor
        map('n', 'K', 'vim.lsp.buf.hover()')

        -- Jump to the definition
        map('n', 'gd', 'vim.lsp.buf.definition()')

        -- Jumps to the definition of the type symbol
        map('n', 'go', 'vim.lsp.buf.type_definition()')

        -- Lists all the references
        map('n', 'gr', 'vim.lsp.buf.references()')

        -- Displays a function's signature information
        map('n', 'gs', 'vim.lsp.buf.signature_help()')
        map('i', '<C-Space>', 'vim.lsp.buf.signature_help()')

        -- Renames all references to the symbol under the cursor
        map('n', '<F2>', 'vim.lsp.buf.rename()')

        -- Selects a code action available at the current cursor position
        map('n', '<F4>', 'vim.lsp.buf.code_action()')
        map('x', '<F4>', 'vim.lsp.buf.range_code_action()')

        -- Show diagnostics in a floating window
        map('n', 'gl', 'vim.diagnostic.open_float()')

        -- Move to the previous diagnostic
        map('n', '[d', 'vim.diagnostic.goto_prev()')

        -- Move to the next diagnostic
        map('n', ']d', 'vim.diagnostic.goto_next()')
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
  end
}
