-- ============================================================================
-- Theme plugins configuration
-- ============================================================================

if vim.g.vscode then
  return {}
end

return {
  -- Based on system theme, automatically switch between light and dark mode
  -- @see https://github.com/f-person/auto-dark-mode.nvim
  {
    "f-person/auto-dark-mode.nvim",
    name = "auto-dark-mode",
  },

  -- Color scheme: Catppuccin
  -- @see https://github.com/catppuccin/nvim
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      auto_integrations = true,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
