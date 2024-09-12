return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      {
        "AstroNvim/astrolsp",
        opts = {
          features = {
            codelens = true,
            inlay_hints = true,
            semantic_tokens = true,
            signature_help = true,
          },
          autocmds = {
            lsp_document_highlight = {
              cond = "textDocument/documentHighlight",
              {
                event = { "CursorHold", "CursorHoldI" },
                desc = "Document Highlighting",
                callback = function()
                  vim.lsp.buf.document_highlight()
                end,
              },
              {
                event = { "CursorMoved", "CursorMovedI", "BufLeave" },
                desc = "Document Highlighting Clear",
                callback = function()
                  vim.lsp.buf.clear_references()
                end,
              },
            },
            lsp_codelens_refresh = {
              cond = "textDocument/codeLens",
              {
                event = { "InsertLeave", "BufEnter" },
                desc = "Refresh codelens (buffer)",
                callback = function(args)
                  if require("astrolsp").config.features.codelens then
                    vim.lsp.codelens.refresh { bufnr = args.buf }
                  end
                end,
              },
            },
            lsp_auto_signature_help = {
              cond = "textDocument/signatureHelp",
              {
                event = "TextChangedI",
                desc = "Automatically show signature help if enabled",
                callback = function(args)
                  local signature_help = vim.b[args.buf].signature_help
                  if signature_help == nil then
                    signature_help = require("astrolsp").config.features.signature_help
                  end
                  if signature_help then
                    local trigger = vim.b[args.buf].signature_help_triggerCharacters or {}
                    local retrigger = vim.b[args.buf].signature_help_retriggerCharacters or {}
                    local pos = vim.api.nvim_win_get_cursor(0)[2]
                    local cur_char = vim.api.nvim_get_current_line():sub(pos, pos)
                    if
                      vim.g.signature_help_triggered and (cur_char:match "%s" or retrigger[cur_char])
                      or trigger[cur_char]
                    then
                      vim.g.signature_help_triggered = true
                      vim.lsp.buf.signature_help()
                      return
                    end
                  end
                  vim.g.signature_help_triggered = false
                end,
              },
              {
                event = "InsertLeave",
                desc = "Clear automatic signature help internals when leaving insert",
                callback = function()
                  vim.g.signature_help_triggered = false
                end,
              },
            },
            lsp_auto_format = {
              cond = "textDocument/formatting",
              {
                event = "BufWritePre",
                desc = "Autoformat on save",
                callback = function(_, _, bufnr)
                  local astrolsp = require "astrolsp"
                  local autoformat = assert(astrolsp.config.formatting.format_on_save)
                  local buffer_autoformat = vim.b[bufnr].autoformat
                  if buffer_autoformat == nil then
                    buffer_autoformat = autoformat.enabled
                  end
                  if buffer_autoformat and ((not autoformat.filter) or autoformat.filter(bufnr)) then
                    vim.lsp.buf.format(vim.tbl_deep_extend("force", astrolsp.format_opts, { bufnr = bufnr }))
                  end
                end,
              },
            },
          },
          capabilities = vim.lsp.protocol.make_client_capabilities(),
          config = {
            basedpyright = {
              settings = {
                basedpyright = {
                  disableOrganizeImports = true,
                  analysis = {
                    typeCheckingMode = "standard",
                  },
                },
              },
            },
            cssls = { init_options = { provideFormatter = false } },
            html = { init_options = { provideFormatter = false } },
            lua_ls = {
              settings = {
                Lua = {
                  hint = { enable = true, arrayIndex = "Disable" },
                  diagnostics = {
                    globals = { "vim" },
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            },
            ruff = {
              on_attach = function(client)
                client.server_capabilities.hoverProvider = false
              end,
            },
          },
          formatting = {
            format_on_save = {
              enabled = false,
            },
          },
          handlers = {
            function(server, server_opts)
              require("lspconfig")[server].setup(server_opts)
            end,
          },
          mappings = {
            n = {
              gd = {
                function()
                  vim.lsp.buf.definition()
                end,
                desc = "[LSP] Goto definition",
                cond = "textDocument/definition",
              },
              gD = {
                function()
                  vim.lsp.buf.declaration()
                end,
                desc = "[LSP] Goto declaration",
                cond = "textDocument/declaration",
              },
              gl = {
                function()
                  vim.diagnostic.open_float()
                end,
                desc = "[LSP] Hover diagnostics",
              },
              gt = {
                function()
                  vim.lsp.buf.type_dehinition()
                end,
                desc = "[LSP] Type definition",
              },
              gp = {
                function()
                  vim.lsp.buf.code_action()
                end,
                desc = "[LSP] Code Action",
              },
              gr = {
                function()
                  vim.lsp.buf.references()
                end,
                desc = "[LSP] Goto References",
              },
              gs = {
                function()
                  vim.lsp.buf.signature_help()
                end,
                desc = "[LSP] Signature help",
              },
              ["<leader>f"] = {
                function()
                  vim.lsp.buf.format()
                end,
                desc = "[LSP] Format buffer",
              },
              gh = {
                function()
                  require("astrolsp.toggles").buffer_inlay_hints()
                end,
                desc = "[LSP] Toggle inlay hints",
                cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
              },
            },
          },
          servers = {},
          on_attach = nil,
        },
        keys = {
          {
            "gf",
            function()
              vim.diagnostic.open_float()
            end,
            desc = "Hover [Diagnostic]",
          },
          {
            "g{",
            function()
              vim.diagnostic.goto_prev()
            end,
            desc = "Previous [Diagnostic]",
          },
          {
            "g}",
            function()
              vim.diagnostic.goto_next()
            end,
            desc = "Next [Diagnostic]",
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          "williamboman/mason.nvim",
          opts = {
            ui = {
              icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "",
              },
              keymaps = { uninstall_package = "d" },
            },
          },
          keys = { { "<leader>,a", "<cmd>Mason<cr>", desc = "Open [Mason]" } },
        },
        opts = function()
          return {
            ensure_installed = {
              "basedpyright",
              "bashls",
              "cssls",
              "html",
              "lua_ls",
              "ruff",
            },
            handlers = {
              function(server)
                require("astrolsp").lsp_setup(server)
              end,
            },
          }
        end,
      },
    },
    config = function()
      local diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          prefix = "",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = require("octopus._icons").hl.Bug,
            [vim.diagnostic.severity.WARN] = require("octopus._icons").hl.Bug,
            [vim.diagnostic.severity.HINT] = require("octopus._icons").hl.DiagnosticHint,
            [vim.diagnostic.severity.INFO] = require("octopus._icons").hl.Bug,
          },
        },
      }

      if type(diagnostics.signs) ~= "boolean" then
        for name, icon in pairs(diagnostics.signs.text) do
          local hl = "DiagnosticSign" .. name
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
      end

      vim.diagnostic.config(vim.deepcopy(diagnostics))
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.capabilities =
        vim.tbl_deep_extend("force", opts.capabilities, require("cmp_nvim_lsp").default_capabilities())
      opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities, {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
          completion = {
            completionItem = {
              documentationFormat = { "markdown", "plaintext" },
              snippetSupport = true,
              preselectSupport = true,
              insertReplaceSupport = true,
              labelDetailsSupport = true,
              deprecatedSupport = true,
              commitCharactersSupport = true,
              tagSupport = { valueSet = { 1 } },
              resolveSupport = { properties = { "documentation", "detail", "additionalTextEdits" } },
            },
          },
        },
      })
    end,
  },
}
