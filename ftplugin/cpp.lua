vim.bo.tabstop = 4      -- size of a hard tabstop (ts).
vim.bo.shiftwidth = 4   -- size of an indentation (sw).
vim.bo.expandtab = true -- always uses spaces instead of tab characters (et).
vim.bo.softtabstop = 4  -- number of spaces a <Tab> counts for. When 0, feature is off (sts).

-- c++ compile
vim.api.nvim_set_keymap(
    "n", "<C-b>",
    "<cmd>!g++ -fsanitize=address -std=c++17 -DONPC -O2 % &> output.txt && timeout 4s ./a.out < input.txt &> output.txt <CR>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n", "<C-S-b>",
    "<cmd>!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 % &> output.txt && timeout 4s ./a.out < input.txt &> output.txt <CR> && test -f .clang-format && echo -e \"BasedOnStyle: Google\nIndentWidth: 4\" > .clang-format",
    { noremap = true }
)
