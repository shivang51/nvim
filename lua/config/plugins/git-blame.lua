return {
  "f-person/git-blame.nvim",
  setup = function()
    require('gitblame').setup {
      enabled = true,
    }
  end
}
