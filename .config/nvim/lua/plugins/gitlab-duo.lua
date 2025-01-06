return {
  'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git',
  enabled = false,
  -- Activate when a file is created/opened
  event = { 'BufReadPre', 'BufNewFile' },
  -- Activate when a supported filetype is open
  ft = { 'go', 'javascript', 'python', 'ruby' },
  cond = function()
    -- Only activate if token is present in environment variable.
    -- Remove this line to use the interactive workflow.
    return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ''
  end,
  opts = {
    statusline = {
      -- Hook into the built-in statusline to indicate the status
      -- of the GitLab Duo Code Suggestions integration
      enabled = true,
    },
  },
  keys = {
    -- Toggle Code Suggestions on/off with CTRL-g in normal mode:
    { '<leader>gls', '<Plug>(GitLabToggleCodeSuggestions)', desc = "GiLab Duo: Toggle code suggestions" },
    { '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)', desc = "GitLab Duo: Toggle code suggestions" },
  }
}
