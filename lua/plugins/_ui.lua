return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
      color_overrides = {
        latte = {
          rosewater = "#cc7983",
          flamingo = "#bb5d60",
          pink = "#d54597",
          mauve = "#a65fd5",
          red = "#b7242f",
          maroon = "#db3e68",
          peach = "#e46f2a",
          yellow = "#bc8705",
          green = "#1a8e32",
          teal = "#00a390",
          sky = "#089ec0",
          sapphire = "#0ea0a0",
          blue = "#017bca",
          lavender = "#8584f7",
          text = "#444444",
          subtext1 = "#555555",
          subtext0 = "#666666",
          overlay2 = "#777777",
          overlay1 = "#888888",
          overlay0 = "#999999",
          surface2 = "#aaaaaa",
          surface1 = "#bbbbbb",
          surface0 = "#cccccc",
          base = "#ffffff",
          mantle = "#eeeeee",
          crust = "#dddddd",
        },
        frappe = {
          rosewater = "#efc9c2",
          flamingo = "#ebb2b2",
          pink = "#f2a7de",
          mauve = "#b889f4",
          red = "#ea7183",
          maroon = "#ea838c",
          peach = "#f39967",
          yellow = "#eaca89",
          green = "#96d382",
          teal = "#78cec1",
          sky = "#91d7e3",
          sapphire = "#68bae0",
          blue = "#739df2",
          lavender = "#a0a8f6",
          text = "#b5c1f1",
          subtext1 = "#a6b0d8",
          subtext0 = "#959ec2",
          overlay2 = "#848cad",
          overlay1 = "#717997",
          overlay0 = "#63677f",
          surface2 = "#505469",
          surface1 = "#3e4255",
          surface0 = "#2c2f40",
          base = "#1a1c2a",
          mantle = "#141620",
          crust = "#0e0f16",
        },
      },
      custom_highlights = function(c)
        return {
          TreesitterContext = { bg = c.base },
          TreesitterContextBottom = { underline = true, sp = c.surface1 },
          TreesitterContextLineNumber = { bg = c.base },
        }
      end,
      integrations = {
        diffview = true,
        dropbar = true,
        mason = true,
        noice = true,
        notify = true,
        nvim_surround = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd [[colorscheme catppuccin]]
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      cer = { icon = "󱆆", color = "#ebcb8b", name = "cer" },
      css = { icon = "", color = "#61afef", name = "css" },
      cnf = { icon = "󱙌", color = "#898998", name = "cnf" },
      db = { icon = "󱘲", color = "#ff75a0", name = "db" },
      html = { icon = "", color = "#de8c92", name = "html" },
      js = { icon = "", color = "#ebcb8b", name = "js" },
      jsx = { icon = "", color = "#519aba", name = "jsx" },
      md = { icon = "", color = "#898998", name = "dm" },
      py = { icon = "", color = "#61afef", name = "py" },
      sh = { icon = "", color = "#6d9086", name = "sh" },
      sql = { icon = "󱘲", color = "#ff75a0", name = "sql" },
      ts = { icon = "", color = "#519aba", name = "ts" },
      tsx = { icon = "", color = "#519aba", name = "ts" },
      toml = { icon = "", color = "#61afef", name = "toml" },
      jpg = { icon = "", color = "#bd77dc", name = "jpg" },
      jpeg = { icon = "", color = "#bd77dc", name = "jpeg" },
      key = { icon = "", color = "#7a0d21", name = "key" },
      pdf = { icon = "", color = "#e8274b", name = "pdf" },
      pem = { icon = "", color = "#e8274b", name = "pem" },
      png = { icon = "", color = "#bd77dc", name = "png" },
      svg = { icon = "", color = "#ffb13b", name = "svg" },
      ttf = { icon = "", color = "#ff75a0", name = "truetypefont" },
      yaml = { icon = "", color = "#ebcb8b", name = "yaml" },
      yml = { icon = "", color = "#ebcb8b", name = "yml" },
      webp = { icon = "", color = "#a1b7ee", name = "webp" },
      [".gitignore"] = { icon = "", color = "#6d8086", name = "GitIgnore" },
      ["robots.txt"] = { icon = "󰚩", color = "#74ba4b", name = "robots" },
      ["package.json"] = { icon = "", color = "#e8274b", name = "PackageJson" },
      ["package-lock.json"] = { icon = "", color = "#7a0d21", name = "PackageLockJson" },
      ["docker-compose.yml"] = { icon = "󰡨", color = "#f55385", name = "DockerCompose" },
      ["docker-compose.yaml"] = { icon = "󰡨", color = "#f55385", name = "DockerCompose" },
    },
    config = function(_, opts)
      require("nvim-web-devicons").set_icon(opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      hijack_cursor = true,
      disable_netrw = true,
      respect_buf_cwd = true,
      view = {
        centralize_selection = true,
        preserve_window_proportions = true,
        width = 35,
      },
      renderer = {
        add_trailing = true,
        group_empty = false,
        full_name = false,
        root_folder_label = ":t:gs?$?/..?",
        hidden_display = "simple",
        highlight_git = "all",
        highlight_diagnostics = "all",
        highlight_opened_files = "icon",
        highlight_modified = "icon",
        highlight_hidden = "name",
        highlight_bookmarks = "icon",
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            modified = false,
          },
          glyphs = {
            default = require("octopus._icons").hl.DefaultFile,
            symlink = require("octopus._icons").hl.Symlink,
            bookmark = require("octopus._icons").hl.Bookmarks,
            modified = require("octopus._icons").hl.FileModified,
            hidden = require("octopus._icons").hl.Hidden,
            folder = {
              arrow_open = require("octopus._icons").hl.FoldOpened,
              arrow_closed = require("octopus._icons").hl.FoldClosed,
              default = require("octopus._icons").hl.FolderClosed,
              open = require("octopus._icons").hl.FolderOpen,
              empty = require("octopus._icons").hl.FolderEmpty,
              empty_open = require("octopus._icons").hl.FolderOpen,
              symlink = require("octopus._icons").hl.FolderSymlink,
              symlink_open = require("octopus._icons").hl.FolderSymlinkO,
            },
            git = {
              unstaged = require("octopus._icons").hl.GitUnstaged,
              staged = require("octopus._icons").hl.GitStaged,
              unmerged = require("octopus._icons").hl.GitBranch,
              renamed = require("octopus._icons").hl.GitRenamed,
              untracked = require("octopus._icons").hl.GitUntracked,
              deleted = require("octopus._icons").hl.GitDelete,
              ignored = require("octopus._icons").hl.GitIgnored,
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = true,
          ignore_list = { "diffview" },
        },
      },
      diagnostics = {
        enable = true,
        icons = {
          hint = require("octopus._icons").hl.DiagnosticHint,
          info = require("octopus._icons").hl.DiagnosticInfo,
          warning = require("octopus._icons").hl.DiagnosticWarn,
          error = require("octopus._icons").hl.DiagnosticError,
        },
      },
      modified = {
        enable = true,
      },
      filters = {
        custom = {
          ".git",
          "node_modules",
          ".cache",
        },
        exclude = {
          "gitsigns",
          ".gitignore",
          ".env",
        },
      },
      actions = {
        change_dir = {
          global = true,
        },
        open_file = {
          quit_on_open = true,
        },
      },
      tab = {
        sync = {
          open = true,
        },
      },
      ui = {
        confirm = {
          trash = false,
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "NvimTree_*",
        callback = function()
          local layout = vim.fn.winlayout()
          if layout[1] == "leaf" and vim.bo[vim.fn.winbufnr(layout[2])].filetype == "NvimTree" and not layout[3] then
            vim.cmd "confirm quit"
          end
        end,
      })
    end,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Open Explorer" },
      { "ñ", "<cmd>NvimTreeToggle<cr>", desc = "Open Explorer" },
      { "Ñ", "<cmd>NvimTreeFocus<cr>", desc = "Focus Explorer" },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      indent = {
        char = "▏",
      },
      scope = {
        char = "▏",
        show_start = true,
        show_end = false,
        include = {
          node_type = {
            ["*"] = {
              "argument_list",
              "arguments",
              "assignment_statement",
              "Block",
              "chunk",
              "class",
              "ContainerDecl",
              "dictionary",
              "do_block",
              "do_statement",
              "element",
              "except",
              "FnCallArguments",
              "for",
              "for_statement",
              "function",
              "function_declaration",
              "function_definition",
              "if_statement",
              "IfExpr",
              "IfStatement",
              "import",
              "InitList",
              "jsx_self_closing_element",
              "list_literal",
              "method",
              "object",
              "ParamDeclList",
              "repeat_statement",
              "return_statement",
              "selector",
              "SwitchExpr",
              "table",
              "table_constructor",
              "try",
              "tuple",
              "type",
              "var",
              "while",
              "while_statement",
              "with",
            },
          },
        },
        exclude = {
          language = { "fish", "yaml" },
        },
      },
      exclude = {
        filetypes = {
          "markdown",
          "text",
          "tex",
        },
      },
    },
    keys = { { "<leader>,i", "<cmd>IBLToggle<cr>", desc = "Toggle IndentBlankline" } },
  },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      render = "wrapped-compact",
      timeout = 2150,
      max_width = function()
        return math.floor(vim.o.columns * 0.60)
      end,
      stages = "fade",
    },
    init = function()
      vim.notify = require "notify"
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      icons = {
        kinds = {
          symbols = require("octopus._icons").vs,
        },
      },
    },
    init = function()
      vim.opt.mousemoveevent = true
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    tag = "v4.4.7",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = {
          enabled = false,
          auto_open = {
            trigger = false,
          },
        },
        progress = {
          enabled = false,
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "double",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "double",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      },
    },
  },
  {
    "lewis6991/satellite.nvim",
    event = "VeryLazy",
    opts = {
      current_only = true,
      winblend = 40,
      excluded_filetypes = {
        "NvimTree",
        "terminal",
        "prompt",
        "TelescopePrompt",
        "noice",
        "notify",
      },
      handlers = {
        gitsigns = {
          signs = {
            delete = "│",
          },
        },
      },
    },
  },
}
