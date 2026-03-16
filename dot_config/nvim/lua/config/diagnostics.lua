-- setup diagnostics
vim.diagnostic.config({
	virtual_text = false
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		if #clients > 0 then
			vim.diagnostic.open_float(nil, { focus = false })
		end
	end,
})


-- set up LSP signs
for type, icon in pairs({
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

