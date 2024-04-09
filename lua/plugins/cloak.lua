return {
  'laytan/cloak.nvim',
  commit = '951b163e55ce7639eb320c450bde9283c4fe968b',
  opts = {
    patterns = {
      {
        file_pattern = '.env*',
        cloak_pattern = '=.+',
        replace = nil,
      },
      {
        file_pattern = '*credentials*',
        cloak_pattern = '=.+',
        replace = nil,
      }
    },
  }
}
