return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          { "<leader>b", group = "Buffer" },
          { "<leader>d", group = "Diffview", icon = { icon = "󰕛 ", color = "green" } },
          { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } },
          { "<leader>g", group = "Git" },
          { "<leader>p", group = "Lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>t", group = "Tabs" },
          { "<leader>,", group = "Extra", icon = { icon = " ", color = "pink" } },
          { "z", group = "fold" },
        },
      },
      plugins = {
        register = false,
        spelling = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps [Which-key]",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
      signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "┃" },
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┃" },
      },
      current_line_blame_opts = {
        ignore_whitespace = true,
      },
      max_file_length = 20000,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "<leader>gg", gs.stage_hunk, "[Gitsigns] Stage git hunk")
        map("n", "<leader>gu", gs.reset_hunk, "[Gitsigns] Reset git hunk")
        map("n", "<leader>ga", gs.stage_buffer, "[Gitsigns] Stage git buffer")
        map("n", "<leader>gq", gs.undo_stage_hunk, "[Gitsigns] Unstage git hunk")
        map("n", "<leader>gr", gs.reset_buffer, "[Gitsigns] Reset git buffer")
        map("n", "<leader>g}", gs.next_hunk, "[Gitsigns] Next git hunk")
        map("n", "<leader>g{", gs.prev_hunk, "[Gitsigns] Previous git hunk")
        map("n", "<leader>gp", gs.preview_hunk, "[Gitsigns] Preview git hunk")
        map("n", "<leader>gd", gs.diffthis, "[Gitsigns] View git diff")
        map("n", "<leader>gt", gs.blame, "[Gitsigns] Show git blame")
        map("n", "<leader>gD", function()
          gs.diffthis "~"
        end, "[Gitsigns] View git diff")
        map("n", "<leader>gl", gs.toggle_current_line_blame, "[Gitsigns] Toggle git blame")
        map("n", "<leader>gh", gs.toggle_deleted, "[Gitsigns] Toggle deleted")
        map("n", "<leader>gn", gs.toggle_numhl, "[Gitsigns] Toggle numhl")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = { { "<leader>gc", "<cmd>Git commit<cr>", desc = "[Fugitive] Git commit" } },
  },
}
