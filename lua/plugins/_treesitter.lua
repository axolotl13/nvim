return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        max_lines = 5,
      },
    },
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
