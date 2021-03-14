-- Some utilities/tools for helping in editing
local M = {}


-- If there isn't one, append a ; at the end of the current line
function M.append_semicolon()
  if vim.api.nvim_get_current_line():find(';', -1) == nil then
    local save_cursor = vim.api.nvim_win_get_cursor('.')
    vim.api.nvim_command("s/$/;/")
    vim.api.nvim_win_set_cursor('.', save_cursor)
    vim.api.nvim_command("nohls")
  end
end


return M
