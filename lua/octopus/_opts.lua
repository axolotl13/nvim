local opt = vim.opt

opt.cmdheight = 0 -- Hide command line unless needed
opt.list = true -- Show invisible characters
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  diff = "╱",
  eob = " ",
}
opt.listchars = {
  eol = "↩",
  trail = "·",
  lead = "·",
  tab="..",
}
opt.expandtab = true -- Enable the use of space in tab
opt.shiftwidth = 2 -- Number of space inserted for indentation
opt.tabstop = 2 -- Number of space in a tab
opt.smartindent = true -- Smarter autoindentation
opt.smartcase = true -- Case sensitivie searching
opt.ignorecase = false -- Case insensitive searching
opt.encoding = "utf-8" -- File content encoding for the buffer
opt.fileencoding = "utf-8" -- File content encoding for the buffer
opt.pumheight = 15 -- Height of the pop up menu
opt.background = "dark" -- Background color
opt.cursorline = true -- Highlight the text line of the cursor
opt.mouse = "a" -- Enable mouse support
opt.number = true -- Show numberline
opt.guicursor = "n:blinkon200,i-ci-ve:ver25" -- Enable cursor blink
opt.relativenumber = true -- Show relative numberline
opt.showmode = false -- Disable showing modes in command line
opt.termguicolors = true -- Enable 24-bit RGB color
opt.title = true -- Set terminal title
opt.wrap = false -- Disable wrapping of lines longer than the width of window
opt.backup = false -- Make backups before writing
opt.clipboard = "unnamedplus" -- System clipboard
opt.hidden = true -- Allows you to hide buffers with unsaved changes
opt.laststatus = 3 -- Global statusline
opt.iskeyword = "@,48-57,_,192-255,-"
opt.splitbelow = true -- Splitting a new window below the current one
opt.splitright = true -- Splitting a new window at the right of the current one
opt.spelllang = "en" -- Spellchecking in english by default
opt.swapfile = false -- Ask what state to recover when opening a file that was not saved
opt.smoothscroll = true
opt.scrolloff = 6 -- Number of lines to leave before/after the cursor when scrolling
opt.sidescrolloff = 6 -- Same but for side scrolling.
opt.undofile = true -- Enable persistent undo
opt.writebackup = false -- Disable making a backup before overwriting a file
opt.whichwrap = "b,s,<,>,[,],h,l" -- Go to previous/next line
opt.timeoutlen = 300 -- Shorten key timeout length a little bit for which-key
opt.updatetime = 300 -- Length of time to wait before triggering the plugin
opt.equalalways = true -- Windows are automatically made the same size after splitting or closing a window.
opt.shortmess:append { s = true, I = true, c = true } -- Disable search count wrap and startup messages
opt.backspace:append { "nostop" } -- Don't stop backspace at insert
