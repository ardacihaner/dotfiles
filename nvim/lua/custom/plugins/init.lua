-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'github/copilot.vim',
    opts = {},
    event = {
      'InsertEnter',
    },
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.keymap.set('i', '<M-f>', 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
    end,
  },
}
