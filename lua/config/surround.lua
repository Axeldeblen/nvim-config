local supported_chars = {
  ['`'] = '`',
  ['"'] = '"',
  ["'"] = "'",
  ['('] = ')',
  ['|'] = '|',
  ['{'] = '}',
  ['['] = ']',
  ['<'] = '>',
}

local function insert_char_at_pos(line_num, char, pos)
  local line = vim.fn.getline(line_num)
  local next_line = line:sub(1, pos) .. char .. line:sub(pos + 1)
  vim.fn.setline(line_num, next_line)
end

local function insert_char_at_end(line_num, char)
  local line = vim.fn.getline(line_num)
  local next_line = line .. char
  vim.fn.setline(line_num, next_line)
end

local function surround(startChar, endChar)
  return function()
    local _, startRow, startCol, _ = unpack(vim.fn.getpos("v"))
    local _, endRow, endCol, _ = unpack(vim.fn.getpos("."))

    local mode = vim.api.nvim_get_mode().mode
    local opts = {
      open = startChar,
      close = endChar,
      startOffset = -1,
      endOffset = 1
    }

    if mode == 'v' then
      if startRow > endRow or (startRow == endRow and startCol >= endCol) then
        opts.open, opts.close, opts.startOffset, opts.endOffset = endChar, startChar, 0, -1
      elseif startRow < endRow then
        opts.endOffset = 0
      end

      insert_char_at_pos(startRow, opts.open, startCol + opts.startOffset)
      insert_char_at_pos(endRow, opts.close, endCol + opts.endOffset)
    elseif mode == 'V' then
      local lowerRow, upperRow = math.min(startRow, endRow), math.max(startRow, endRow)
      insert_char_at_pos(lowerRow, startChar, 0)
      insert_char_at_end(upperRow, endChar)
    end
  end
end

for k, v in pairs(supported_chars) do
  vim.keymap.set('v', '<leader>' .. k, surround(k, v), { noremap = true, silent = true })
end
