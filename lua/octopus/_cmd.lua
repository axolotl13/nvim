local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  desc = "Highlight text on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("BufEnter", {
  desc = "Don't auto comment new line",
  pattern = "*",
  command = "setlocal fo-=c fo-=r fo-=o",
})

autocmd("BufReadPost", {
  desc = "Jump to the last position when reopening a file",
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd("TermOpen", {
  desc = "Start insert open terminal",
  pattern = "*",
  command = "startinsert",
})

autocmd("TermOpen", {
  desc = "Disable number in terminal",
  pattern = "*",
  command = "setlocal nonumber norelativenumber",
})
