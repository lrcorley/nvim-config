return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    'saghen/blink.lib'
  },
  opts = {
    completion = {
      list = { selection = { preselect = false, auto_insert = false } },
      ghost_text = { enabled = true }
    },

    keymap = {
      preset = 'none',
      [ '<C-Space>' ] = { 'show' },
      [ '<Esc>' ]     = { 'hide', 'fallback' },
      [ '<S-K>' ]     = { 'show_documentation', 'hide_documentation', 'fallback' },
      [ '<Tab>' ]     = { 'select_next', 'snippet_forward', 'fallback' },
      [ '<S-Tab>' ]   = { 'select_prev', 'snippet_backward', 'fallback' },
      [ '<Down>' ]    = { 'select_next', 'fallback' },
      [ '<Up>' ]      = { 'select_prev', 'fallback' },
      [ '<CR>' ]      = { 'accept', 'fallback' },
    },

    appearance = {
      kind_icons = {
        Text        = '≡',

        Keyword     = '◆',

        Constant    = 'π',
        EnumMember  = 'π',

        Method      = 'ƒ',
        Function    = 'ƒ',
        Constructor = 'ƒ',

        Variable    = '●',
        Field       = '●',
        Property    = '●',
        Value       = '●',

        Class       = '■',
        Struct      = '■',
        Enum        = '■',
        Interface   = '■',
        Module      = '■',

        Unit        = '°',

        Snippet     = '⋯',
        Color       = ' ',

        Reference   = '→',
        File        = '▼',
        Folder      = '▶',

        Event       = '⌁',

        Operator    = '±',

        TypeParameter = 'T',
      }
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },

    cmdline = { enabled = false }
  }
}
