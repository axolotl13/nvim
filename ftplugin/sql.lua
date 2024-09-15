vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd("Filetype", {
  desc = "Disable left and right arrows",
  pattern = "sql",
  callback = function()
    vim.keymap.del("i", "<left>", { buffer = true })
    vim.keymap.del("i", "<right>", { buffer = true })
  end,
})
