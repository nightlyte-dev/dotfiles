return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- Show hidden files by default
      hidden = true,
      ignored = true,
    },
    -- Also ensure pickers (like find files) show hidden files
    picker = {
      hidden = true,
      ignored = true,
    },
  },
}
