-- Use four-space indentation by default for C/C++ code.
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4

-- vim.bo.cinoptions = {}

-- Do not indent namespace declaration bodies.
-- https://stackoverflow.com/questions/2549019
vim.bo.cinoptions =  'N-s'

-- Do not indent visibility labels in classes.
-- https://stackoverflow.com/questions/7622564
vim.bo.cinoptions = vim.bo.cinoptions .. ',g0'
