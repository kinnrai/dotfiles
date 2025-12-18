-- ============================================================================
-- General Neovim options configuration
-- ============================================================================


--------------------
-- Visuals and UI --
--------------------

-- Line numbers
vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- Always show the sign column to avoid text shifting
vim.opt.signcolumn = "yes"

-- Enable 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Highlight the current line
vim.opt.cursorline = true

-- Keep context
vim.opt.scrolloff = 10    -- keep 10 lines above and below the cursor
vim.opt.sidescrolloff = 8 -- keep 8 columns to the left and right

-- Disable mode display since we use a statusline plugin
vim.opt.showmode = false


-------------------------------
-- Characters and Typography --
-------------------------------

-- Show invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
  extends = "›",
  precedes = "‹",
}

-- Customize fill characters
vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
  vert = "│",
  horiz = "─",
  msgsep = "─",
}

-- Wrapping and breaking
vim.opt.wrap = true        -- enable line wrapping
vim.opt.breakindent = true -- enable break indent
vim.opt.showbreak = "↳ "   -- string to put at the start of wrapped lines


------------------------------
-- Interaction and Workflow --
------------------------------

-- Search settings
vim.opt.ignorecase = true    -- ignore case in search patterns
vim.opt.smartcase = true     -- override 'ignorecase' if search pattern contains uppercase letters
vim.opt.hlsearch = false     -- do not highlight all matches on previous search pattern
vim.opt.incsearch = true     -- show the match while typing
vim.opt.inccommand = "split" -- show the effects of a command incrementally in a split

-- Window splitting
vim.opt.splitbelow = true -- open new vertical splits to the bottom of the current window
vim.opt.splitright = true -- open new horizontal splits to the right of the current window

-- Tabs and indentation
vim.opt.tabstop = 4        -- number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4     -- number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true   -- use spaces instead of tabs
vim.opt.autoindent = true  -- copy indent from current line when starting a new line
vim.opt.smartindent = true -- add indents automatically


------------------------
-- System integration --
------------------------

-- Use system clipboard
-- vim.schedule(function()
--   vim.opt.clipboard = "unnamedplus"
-- end)

-- Enable mouse support in all modes
vim.opt.mouse = "a"

-- Persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state").. "/undo"

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false


-----------------
-- Performance --
-----------------

-- Faster completion (default is 4000 ms)
vim.opt.updatetime = 250

-- Decrease time to wait for a mapped sequence to complete (default is 1000 ms)
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0


--------------------
-- Code assisting --
--------------------

-- Folds
vim.opt.foldmethod = "expr"                          -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldcolumn = "0"                             -- do not show fold column
vim.opt.foldtext = ""                                -- use default fold text
vim.opt.foldlevel = 99                               -- start with all folds open
vim.opt.foldlevelstart = 99                          -- start with all folds open

-- Completion options
vim.opt.completeopt = "menu,menuone,noselect" -- better completion experience
vim.opt.pumheight = 10                        -- limit popup menu height
