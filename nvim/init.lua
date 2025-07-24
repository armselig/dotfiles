if vim.g.vscode then
	-- VSCode extension
	-- Add the current directory's lua path to runtime path
	local current_dir = vim.fn.expand("<sfile>:p:h")
	vim.opt.rtp:prepend(current_dir)

	require("vsc-nvim.lazy")
	require("default.options")
	require("vsc-nvim.keys")
else
	require("default.options")
	require("default.plugins")
	require("default.lsp")
	require("default.keys")
end
