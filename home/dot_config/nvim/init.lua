-- ============================================================================
-- Neovim Initialization File
-- ============================================================================


-- 1. Load general options
require("config.options")

-- 2. Load keymaps
require("config.keymaps")

-- 3. Load autocommands
require("config.autocmds")

-- 4. Load plugin manager (must be loaded last)
require("config.lazy")
