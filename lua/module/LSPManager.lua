local logger = require("utils.logger")
local lspconfig = require("lspconfig")

local lspregister = {}

local on_attach_build = function(LSPOption)
	return function(client, bufnr)
		local opts = LSPOption and LSPOption.mapopt or { noremap = true, silent = true, buffer = bufnr }
		local map = vim.keymap.set

		map("n", "<space>ll", "<cmd>Lspsaga finder<CR>", opts)                -- 综合查找器
		map("n", "<space>ld", "<cmd>Lspsaga peek_definition<CR>", opts)       -- 预览定义
		map("n", "<space>lk", "<cmd>Lspsaga hover_doc<CR>", opts)             -- 悬浮文档
		map("n", "<space>li", "<cmd>Lspsaga implementation<CR>", opts)        -- 查找实现
		map("n", "<space>lk", "<cmd>Lspsaga signature_help<CR>", opts)        -- 签名帮助
		map("n", "<space>lt", "<cmd>Lspsaga peek_type_definition<CR>", opts)  -- 预览类型定义
		map("n", "<space>lr", "<cmd>Lspsaga rename<CR>", opts)                -- 重命名
		map("n", "<space>la", "<cmd>Lspsaga code_action<CR>", opts)           -- 代码操作
		map("v", "<space>lA", "<cmd>Lspsaga range_code_action<CR>", opts)     -- 范围代码操作
		map("n", "<space>lp", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- 显示行诊断
		map("n", "<space>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- 显示光标诊断
		map("n", "<space>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)  -- 上一个诊断
		map("n", "<space>]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)  -- 下一个诊断
		map("n", "<space>lo", "<cmd>Lspsaga outline<CR>", opts)               -- 大纲视图
		map("n", "<space>ls", "<cmd>Lspsaga symbol<CR>", opts)                -- 文档符号
		map("n", "<space>lI", "<cmd>Lspsaga incoming_calls<CR>", opts)        -- 传入调用
		map("n", "<space>lO", "<cmd>Lspsaga outgoing_calls<CR>", opts)        -- 传出调用

		map("n", "<leader>Wa", vim.lsp.buf.add_workspace_folder, opts)
		map("n", "<leader>Wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<leader>WL", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
		map("n", "<space>lf", function() vim.lsp.buf.format { async = true } end, opts)
	end
end

---@return boolean
---@param name string
---@param option table?
local launch = function(name, option)
	if name == "" then return false end -- nil
	-- option = option or { on_attach = on_attach_build() }
	option.on_attach = option.on_attach or on_attach_build()
	vim.lsp.config(name, option)
	vim.lsp.enable(name)
	return true
end


---@return nil
---@param LSPName string
---@param LSPOption table?
return function(LSPName, LSPOption)
	if lspregister[LSPName] then return end
	lspregister[LSPName] = true
	if launch(LSPName, LSPOption) then
		logger.log_title(logger.constant.info, "Load server: " .. LSPName .. " was loaded", "LSPManager")
	else
		logger.log_title(logger.constant.warning, LSPName .. " wasn't loaded", "LSPManager")
	end
end
