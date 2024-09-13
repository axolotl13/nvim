return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          { "<leader>b", group = "Buffer" },
          { "<leader>c", icon = { icon = " ", color = "gray" } },
          { "<leader>d", group = "Diffview", icon = { icon = "󰕛 ", color = "green" } },
          { "<leader>e", icon = { icon = "󰉌 ", color = "orange" } },
          { "<leader>g", group = "Git" },
          { "<leader>p", group = "Lazy", icon = { icon = "󰒲 ", color = "cyan" } },
          { "<leader>s", group = "Search" },
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
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable "make" == 1,
        lazy = true,
      },
    },
    cmd = "Telescope",
    opts = function()
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          mappings = {
            i = {
              ["<esc>"] = require("telescope.actions").close,
              ["<c-n>"] = require("telescope.actions").cycle_history_next,
              ["<c-p>"] = require("telescope.actions").cycle_history_prev,
            },
          },
          prompt_prefix = "  ",
          selection_caret = "  ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_ignore_patterns = { "node_modules" },
        },
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          },
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {},
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "fzf"
    end,
    keys = {
      {
        "<leader>sw",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "[Telescope] Search words in current buffer",
      },
      { "<leader>sx", "<cmd>Telescope command_history<cr>", desc = "[Telescope] Search command history" },
      { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "[Telescope] Search words" },
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[Telescope] Search files" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[Telescope] Search diagnostics" },
      { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "[Telescope] Git commits (repository)" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[Telescope] Search keymaps" },
      { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "[Telescope] Search history" },
      { "<leader>st", "<cmd>Telescope git_status<cr>", desc = "[Telescope] Git status" },
      { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "[Telescope] Git branches" },
      { "<leader>sm", "<cmd>Telescope fd cwd=$HOME<cr>", desc = "[Telescope] Search files in HOME" },
      { "<leader>sn", "<cmd>Telescope notify<cr>", desc = "[Telescope] Search notifications" },
      { "<leader>sq", "<cmd>Telescope buffers<cr>", desc = "[Telescope] Search buffers" },
      { "<leader>sr", "<cmd>Telescope colorscheme<cr>", desc = "[Telescope] Search themes" },
      { "<leader>se", "<cmd>Telescope grep_string<cr>", desc = "[Telescope] Search words under cursor" },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      search = {
        exclude = {
          "NvimTree",
          "mason",
          "lazy",
          "notify",
          "terminal",
          "cmp_menu",
          "fugitive",
          "flash_prompt",
          function(win)
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
      modes = {
        char = {
          keys = { "f", "F", "t", "T" },
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "o", "x" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash treesitter",
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = "markdown",
    opts = {},
    keys = { { "<leader>,v", "<cmd>Markview<cr>", desc = "Toggle [Markview]" } },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          laststatus = 0,
        },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Enable [ZenMode]" } },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          winbar_info = true,
        },
        file_history = {
          winbar_info = true,
        },
      },
    },
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open [Diffview]" },
      { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "Close [Diffview]" },
      { "<leader>df", "<cmd>DiffviewToggleFiles<cr>", desc = "[Diffview] Toggle files" },
      { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "[Diffview] Open file history" },
      { "<leader>dd", "<cmd>DiffviewFileHistory %<cr>", desc = "[Diffview] Open file history %" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = { { "<leader>,m", "<cmd>MarkdownPreviewToggle<cr>", desc = "[Markdown] Toggle preview" } },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = { { "<leader>,n", "<cmd>lua require('neogen').generate()<cr>", desc = "[Neogen] Generate annotations" } },
    config = true,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    keys = { { "<leader>c", "<cmd>HighlightColors Toggle<cr>", desc = "Toggle [HighlightColors]" } },
    config = true,
  },
  {
    "uga-rosa/ccc.nvim",
    keys = { { "<leader>,c", "<cmd>CccPick<cr>", desc = "Enable [ColorPick]" } },
    config = true,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-telescope/telescope.nvim" },
    },
    branch = "regexp",
    opts = {
      settings = {
        options = {
          enable_default_searches = false,
          notify_user_on_venv_activation = true,
        },
        search = {
          venv = {
            command = "fd '/bin/python$' . --full-path --color never -HI -a -L",
          },
        },
      },
    },
    keys = {
      { "<leader>,p", "<cmd>VenvSelect<cr>", desc = "Select [Venv]" },
    },
  },
}
