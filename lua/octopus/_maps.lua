local map = vim.keymap.set

vim.g.mapleader = " "

local keybinds = {
  -- Disable
  { "n", "<esc>", "<cmd>noh<cr>", "General clear highlight" },
  { "n", "<c-z>", "<nop>", "Disable ctrl+z" },
  -- Cursor
  { "n", "|", "^", "Move [Cursor] beginning of line" },
  -- Spell
  { "n", "<leader>,e", "<cmd>set spell<cr>", "Enable [Spell]" },
  { "n", "<leader>,q", "<cmd>set nospell<cr>", "Disable [Spell]" },
  -- Diffmode
  { "n", "<leader>dt", "<cmd>diffthis<cr>", "[Diffmode] this" },
  { "n", "<leader>dz", "<cmd>diffoff<cr>", "[Diffmode] off" },
  { "n", "<leader>du", "<cmd>diffput<cr>", "[Diffmode] put" },
  -- Move line
  { "n", "<a-up>", ":m .-2<cr>==", "[Move] line up" },
  { "n", "<a-down>", ":m .+1<cr>==", "[Move] line down" },
  { "x", "<a-up>", ":m '<-2<CR>gv-gv", "[Move] line up" },
  { "x", "<a-down>", ":m '>+1<CR>gv-gv", "[Move] line down" },
  -- Indent
  { "v", "<", "<gv" },
  { "v", ">", ">gv" },
  -- Switch Windows
  { "n", "<c-l>", "<C-w>l", "Switch [Window] right" },
  { "n", "<c-h>", "<C-w>h", "Switch [Window] left" },
  { "n", "<c-k>", "<C-w>k", "Switch [Window] up" },
  { "n", "<c-j>", "<C-w>j", "Switch [Window] down" },
  -- Resize Windows
  { "n", "<c-right>", ":vert resize +2<cr>", "Resize [Window] right" },
  { "n", "<c-left>", ":vert resize -2<cr>", "Resize [Window] left" },
  -- { "n", "<c-up>", ":resize +2<cr>", "Resize [Window] up" },
  -- { "n", "<c-down>", ":resize -2<cr>", "Resize [Window] down" },
  -- Save Files
  { "n", "<c-s>", "<cmd>w!<cr>", "[Save] File" },
  { "i", "<c-s>", "<cmd>w!<cr><esc>", "[Save] File" },
  -- Buffers
  { "n", "<leader>ba", "<cmd>%y+<cr>", "Copy [Buffer]" },
  { "n", "<leader>bq", "<cmd>bd!<cr>", "Close [Buffer]" },
  { "n", "<leader>bn", "<cmd>enew<cr>", "New [Buffer]" },
  { "n", "<c-x>", "<cmd>qa!<cr>", "Close all [Buffer]" },
  -- Tabs
  { "n", "<leader>tn", "<cmd>tabnew<cr>", "New [Tab]" },
  { "n", "<leader>tk", "<cmd>tabnext<cr>", "Next [Tab]" },
  { "n", "<leader>tj", "<cmd>tabprevious<cr>", "Previous [Tab]" },
  { "n", "<leader>tq", "<cmd>tabclose<cr>", "Close [Tab]" },
  -- { "n", "<tab>",      "<cmd>bnext<cr>",                "Next [Buffer]" },
  -- { "n", "<s-tab>",    "<cmd>bprevious<cr>",            "Previous [Buffer]" },
  -- Terminal
  { "t", "<esc>", "<C-\\><C-n>", "Escape [Terminal] mode" },
  -- Misc
  { "n", "<leader>n", "<cmd>set rnu!<cr>", "Toggle [Relativenumber]" },
}

for _, keybind in ipairs(keybinds) do
  local mode, lhs, rhs, desc = unpack(keybind)
  map(mode, lhs, rhs, { desc = desc or "None", silent = true })
end

