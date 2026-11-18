-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("i", "jj", "<Esc>", {
    desc = "Exit insert mode",
})

map("t", "nn", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("i", "<C-BS>", "<C-W>", { desc = "Delete word backward" }) -- Ctrl-Backspase
map("i", "<C-Del>", "<C-o>de", { desc = "Delete word forward" })
map("n", "<C-CR>", "o<Esc>", { desc = "Newline below in normal mode" })

-- navigasi di insert mode
-- map("i", "<C-h>", "<Left>", { desc = "Move left" })
-- map("i", "<C-k>", "<Up>", { desc = "Move up" })
-- map("i", "<C-j>", "<Down>", { desc = "Move down" })
-- map("i", "<C-l>", "<Right>", { desc = "Move right" })

-- vim.keymap.set("n", "j", "jzz", { desc = "Auto center when change line" })
-- vim.keymap.set("n", "k", "kzz", { desc = "Auto center when change line" })


-- toggle auto center
local center_cursor = false

local function set_center_cursor()
  if center_cursor then
    vim.keymap.set("n", "j", "jzz", { desc = "Auto center down" })
    vim.keymap.set("n", "k", "kzz", { desc = "Auto center up" })
  else
    vim.keymap.set("n", "j", "j", { desc = "Move down" })
    vim.keymap.set("n", "k", "k", { desc = "Move up" })
  end
end

vim.keymap.set("n", "<leader>uj", function()
  center_cursor = not center_cursor
  set_center_cursor()
  vim.notify("Auto center: " .. (center_cursor and "ON" or "OFF"))
end, { desc = "Toggle auto center cursor" })

set_center_cursor()
