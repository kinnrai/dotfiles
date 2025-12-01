-- ============================================================================
-- UI plugins configuration
-- ============================================================================

if vim.g.vscode then
  return {}
end

return {
  -- Status line
  -- @see https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    name = 'lualine',
    event = "VeryLazy",
    opts = {
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        refresh_time = 8, -- ~120fps (1000ms ÷ 120 = 8.33ms)
      }
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- A collection of QoL plugins for Neovim
  -- @see https://github.com/folke/snacks.nvim
  {
    "folke/snacks.nvim",
    name = "snacks",
    priority = 1000,
    opts = {
      -- Deal with big files
      bigfile = { enabled = true },
      -- Beautiful declarative dashboards
      dashboard = { enabled = true },
      -- Focus on the active scope by dimming the rest
      dim = { enabled = true },
      -- Indent guides and scopes
      indent = { enabled = true },
      -- Better `vim.ui.input`
      input = { enabled = true },
      -- Pretty `vim.notify`
      notifier = { enabled = true },
      -- Picker for selecting items
      pickers = { enabled = true },
      -- When doing `nvim somefile.txt`, it will render the file as quickly as possible, before loading your plugins.
      quickfile = { enabled = true },
      -- Scope detection, text objects and jumping based on treesitter or indent
      scope = { enabled = true },
      -- Smooth scrolling
      scroll = { enabled = true },
      -- Pretty status column
      statuscolumn = { enabled = true },
      -- Auto-show LSP references and quickly navigate between them
      words = { enabled = true },
    }
  },

  -- Enhanced UI for messages, cmdline and the popupmenu
  -- @see https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    name = "noice",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
}
