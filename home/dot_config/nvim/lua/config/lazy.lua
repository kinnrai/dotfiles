-- ============================================================================
-- Bootstrap plugin manager: lazy.nvim
-- @see https://www.lazyvim.org/configuration/lazy.nvim
-- ============================================================================


-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", -- shallow clone to save time and space
    "--branch=stable",    -- use stable branch
    lazyrepo,
    lazypath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath) -- add lazy.nvim to runtime path

-- Configure lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- import plugins from lua/plugins/
  },
  defaults = {
    lazy = false,    -- don't lazy-load by default
    version = false, -- always use the latest git commit
  },
  checker = {
    enabled = true, -- enable automatic plugin update checking
    notify = false, -- don't notify about available updates
  },
  performance = {
    rtp = {
      -- disable some default neovim plugins in runtime path
      disabled_plugins = {
        "gzip",
        "man",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "osc52",
        "rplugin",
        "spellfile",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
