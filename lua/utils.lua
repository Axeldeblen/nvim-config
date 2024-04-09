local M = {}

---@param table table
---@param val any
---@return boolean
M.includes = function(table, val)
  for _, value in ipairs(table) do
    if value == val then
      return true
    end
  end
  return false
end

M.has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

return M
