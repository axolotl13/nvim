for _, module in ipairs {
  "octopus._opts",
  "octopus._maps",
  "octopus._cmd",
  "octopus._lazy",
} do
  local ok, core = pcall(require, module)
  if not ok then
    vim.api.nvim_echo({
      { "Failed to load " .. module .. "\n", "ErrorMsg" },
      { core, "WarningMsg" },
    }, true, {})
  end
end
