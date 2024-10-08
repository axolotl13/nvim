local map = vim.keymap.set

vim.g.mapleader = " "

local keybinds = {
  -- Disable
  { "n", "<esc>", "<cmd>noh<cr>", "General clear highlight" },
  { "n", "<c-z>", "<nop>", "Disable ctrl+z" },
  -- Cursor
  { "n", "|", "^", "Move cursor beginning of line" },
  -- Spell
  { "n", "<leader>,e", "<cmd>set spell<cr>", "Enable Spell" },
  { "n", "<leader>,q", "<cmd>set nospell<cr>", "Disable Spell" },
  -- Diffmode
  { "n", "<leader>dt", "<cmd>diffthis<cr>", "Diffthis" },
  { "n", "<leader>dz", "<cmd>diffoff<cr>", "Diffoff" },
  { "n", "<leader>du", "<cmd>diffput<cr>", "Diffput" },
  -- Move line
  { "n", "<a-up>", ":m .-2<cr>==", "Move line up" },
  { "n", "<a-down>", ":m .+1<cr>==", "Move line down" },
  { "x", "<a-up>", ":m '<-2<CR>gv-gv", "Move line up" },
  { "x", "<a-down>", ":m '>+1<CR>gv-gv", "Move line down" },
  -- Indent
  { "v", "<", "<gv" },
  { "v", ">", ">gv" },
  -- Switch Windows
  { "n", "<c-l>", "<C-w>l", "Switch window right" },
  { "n", "<c-h>", "<C-w>h", "Switch window left" },
  { "n", "<c-k>", "<C-w>k", "Switch window up" },
  { "n", "<c-j>", "<C-w>j", "Switch window down" },
  -- Resize Windows
  { "n", "<c-right>", ":vert resize +2<cr>", "Resize window right" },
  { "n", "<c-left>", ":vert resize -2<cr>", "Resize window left" },
  -- { "n", "<c-up>", ":resize +2<cr>", "Resize window up" },
  -- { "n", "<c-down>", ":resize -2<cr>", "Resize window down" },
  -- Save Files
  { "n", "<c-s>", "<cmd>w!<cr>", "Save File" },
  { "i", "<c-s>", "<cmd>w!<cr><esc>", "Save File" },
  -- Buffers
  { "n", "<leader>ba", "<cmd>%y+<cr>", "Copy Buffer" },
  { "n", "<leader>bq", "<cmd>bd!<cr>", "Close Buffer" },
  { "n", "<leader>bn", "<cmd>enew<cr>", "New Buffer" },
  { "n", "<c-x>", "<cmd>qa!<cr>", "Close all buffer" },
  -- { "n", "<tab>", "<cmd>bnext<cr>", "Next Buffer" },
  -- { "n", "<s-tab>", "<cmd>bprevious<cr>", "Previous Buffer" },
  -- Tabs
  { "n", "<leader>tn", "<cmd>tabnew<cr>", "New Tab" },
  { "n", "<leader>tk", "<cmd>tabnext<cr>", "Next Tab" },
  { "n", "<leader>tj", "<cmd>tabprevious<cr>", "Previous Tab" },
  { "n", "<leader>tq", "<cmd>tabclose<cr>", "Close Tab" },
  -- Terminal
  { "t", "<esc>", "<C-\\><C-n>", "Escape terminal mode" },
  -- Misc
  { "n", "<leader>n", "<cmd>set rnu!<cr>", "Toggle Relativenumber" },
  -- Lazy
  { "n", "<leader>ps", "<cmd>Lazy<cr>", "Lazy" },
  { "n", "<leader>pu", "<cmd>Lazy update<cr>", "Update Plugins" },
  { "n", "<leader>py", "<cmd>Lazy sync<cr>", "Lazy Sync" },
  { "n", "<leader>pc", "<cmd>Lazy clean<cr>", "Clean Plugins" },
}

for _, keybind in ipairs(keybinds) do
  local mode, lhs, rhs, desc = unpack(keybind)
  map(mode, lhs, rhs, { desc = desc or "None", silent = true })
end
