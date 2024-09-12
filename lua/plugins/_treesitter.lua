return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        max_lines = 5,
      },
    },
    { "HiPhish/rainbow-delimiters.nvim" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    ensure_installed = {
      "bash",
      "bibtex",
      "c",
      "cmake",
      "comment",
      "cpp",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "glimmer",
      "go",
      "hlsplaylist",
      "html",
      "http",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "latex",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "perl",
      "php",
      "phpdoc",
      "python",
      "requirements",
      "robot",
      "rst",
      "ruby",
      "rust",
      "scss",
      "sql",
      "ssh_config",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "xml",
      "yaml",
    },
    highlight = {
      enable = true,
      disable = function(_, bufnr)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "g+",
        node_incremental = "g+",
        scope_incremental = false,
        node_decremental = "g-",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ab"] = "@statement.outer",
          ["ib"] = "@statement.inner",
          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        include_surrounding_whitespace = true,
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["<a-}>"] = { query = "@function.outer", desc = "Next method/function def start" },
          ["]c"] = { query = "@class.outer", desc = "Next class start" },
        },
        goto_previous_start = {
          ["<a-{>"] = { query = "@function.outer", desc = "Prev method/function def start" },
          ["[c"] = { query = "@class.outer", desc = "Prev class start" },
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  init = function()
    local opt = vim.opt
    opt.foldenable = true
    opt.foldcolumn = "1"
    opt.foldlevelstart = 99
    opt.foldlevel = 99
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    opt.foldtext = ""
    vim.api.nvim_create_autocmd("BufReadPre", {
      callback = function(v)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(v.buf))
        if ok and stats and stats.size > max_filesize then
          opt.foldmethod = "manual"
        else
          opt.foldmethod = "expr"
        end
      end,
    })
  end,
  keys = {
    { "g+", desc = "Increment Selection" },
    { "g-", desc = "Decrement Selection", mode = "x" },
  },
}
