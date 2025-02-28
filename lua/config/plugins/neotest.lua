return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("neotest").setup({
      consumers = {
        playwright = require('neotest-playwright.consumers').consumers,
      },
      adapters = {
        require('neotest-playwright').adapter({
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        }),
      }
    });
  end
}
