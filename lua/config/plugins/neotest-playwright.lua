return {
  'StevanFreeborn/neotest-playwright',
  dependencies = {
    "nvim-neotest/neotest",
  },
  config = function()
    require('neotest-playwright').adapter({
      options = {
        persist_project_selection = false,
        enable_dynamic_test_discovery = false
      }
    })
  end,
  branch = "fork",
  keys = {
    {
      '<leader>ta',
      function()
        require('neotest').playwright.attachment();
      end,
      desc = 'Launch test attachment',
    },
  },
}
