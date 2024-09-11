return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

      local cmp = require "cmp"
      local icons = require("octopus._icons").vs

      local opts = {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        formatting = {
          format = function(_, item)
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                local buf = vim.api.nvim_get_current_buf()
                local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                if byte_size > 1024 * 1024 then
                  return {}
                end
                return { buf }
              end,
            },
          },
          { name = "path" },
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        window = {
          completion = {
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            scrollbar = false,
          },
          -- documentation = cmp.config.disable,
          documentation = {},
        },
        mapping = cmp.mapping.preset.insert {
          ["<up>"] = cmp.mapping.select_prev_item(),
          ["<down>"] = cmp.mapping.select_next_item(),
          ["<c-p>"] = cmp.mapping.select_prev_item(),
          ["<c-n>"] = cmp.mapping.select_next_item(),
          ["<pageup>"] = cmp.mapping.scroll_docs(-4),
          ["<pagedown>"] = cmp.mapping.scroll_docs(4),
          ["<c-space>"] = cmp.mapping.complete(),
          ["<c-e>"] = cmp.mapping.abort(),
          ["<s-cr>"] = cmp.mapping.confirm(),
          ["<cr>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace },
          ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      }
      cmp.setup(opts)
    end,
  },
}
