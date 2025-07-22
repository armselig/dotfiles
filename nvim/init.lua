require("default.options")

if vim.g.vscode then
	-- VSCode extension
	-- Add the current directory's lua path to runtime path
	local current_dir = vim.fn.expand("<sfile>:p:h")
	vim.opt.rtp:prepend(current_dir)

	require("vsc-nvim.keys")
	require("vsc-nvim.lazy")
else
	require("default.plugins")
	require("default.keys")
	require("default.lsp")
end
