return {
  -- Snacks: explorer shows hidden/ignored files; autosave on 5s idle
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            layout = { preset = "sidebar", layout = { position = "right" }, preview = false },
          },
        },
      },
      autosave = {
        enabled = true,
        debounce = 5000,
        notify = false,
        events = { "InsertLeave", "TextChanged" },
      },
    },
    -- Save immediately on focus lost or buffer/window leave
    init = function()
      vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "WinLeave" }, {
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          if vim.bo[buf].modified and vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= "" then
            vim.cmd("silent! write")
          end
        end,
      })
    end,
  },

  -- Auto session save/restore per directory
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },

  -- Image preview using Kitty graphics protocol
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      backend = "kitty",
      kitty_method = "normal",
      integrations = {
        markdown = { enabled = true, download_remote_images = false },
      },
      max_width_window_percentage = 50,
      max_height_window_percentage = 40,
    },
  },
}
