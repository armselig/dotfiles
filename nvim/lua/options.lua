-- check for .vimrc and source it
local vimrc_path = vim.fn.expand("~/.vimrc")
if vim.fn.filereadable(vimrc_path) == 1 then
    vim.cmd("source " .. vimrc_path)
end

local opt = vim.opt

opt.inccommand = "split"

