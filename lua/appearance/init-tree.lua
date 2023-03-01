-- tree


require("nvim-tree").setup({
  sort_by = "case_sensitive",
  hijack_cursor = true,

  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        bookmark = " ",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "★",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  actions = {
      open_file = {
          quit_on_open = true
      }
  },
})


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1




