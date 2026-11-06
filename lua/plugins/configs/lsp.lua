require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		-- "ts_ls", -- TypeScript 与 JavaScript
    "vtsls",
		"html", -- HTML
		"cssls", -- CSS / SCSS / LE
		"gopls",
		"pyright",
    "emmet_language_server"
		-- "clangd",
	},
	--  自动启用服务器
	automatic_enable = true,
})
vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local map = vim.keymap.set
		-- ========== 导航跳转 ==========
		map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "跳转到定义" })
		map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "跳转到声明" })
		map("n", "gt", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "跳转到类型定义" })
		map("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "跳转到实现" })
		map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "查找引用" })

		-- ========== 文本操作 ==========
		map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "重命名符号" })
		map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "代码操作" })

		map({ "n", "v" }, "<leader>fo", function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = bufnr, desc = "格式化缓冲区" })

		-- ========== 信息查看 ==========
		map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "显示悬浮文档" })
		map("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "显示函数签名" })

		-- ========== 工作区 ==========
		map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = "添加工作区文件夹" })
		map( "n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = "移除工作区文件夹" })
    map("n", "<leader>lwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = bufnr, desc = "列出工作区文件夹" })

		map("n", "<leader>lws", function()
			vim.ui.input({ prompt = "Workspace symbol: " }, function(query)
				if query and query ~= "" then
					vim.lsp.buf.workspace_symbol(query)
				end
			end)
		end, { buffer = bufnr, desc = "工作区符号搜索" })

		-- ========== 调用关系 ==========
		map("n", "<leader>ci", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "查看被调用处" })
		map("n", "<leader>co", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "查看调用了谁" })

		-- ========== 其他实用函数 ==========
		map("n", "<leader>ds", vim.lsp.buf.document_symbol, { buffer = bufnr, desc = "文档符号列表" })
		map("n", "<leader>dh", vim.lsp.buf.document_highlight, { buffer = bufnr, desc = "高亮符号引用" })
		map("n", "<leader>cr", vim.lsp.buf.clear_references, { buffer = bufnr, desc = "清除引用高亮" })

		map("n", "<leader>ths", function()
			vim.lsp.buf.typehierarchy("subtypes")
		end, { buffer = bufnr, desc = "查看子类型" })

		map("n", "<leader>thS", function()
			vim.lsp.buf.typehierarchy("supertypes")
		end, { buffer = bufnr, desc = "查看超类型" })

		map("n", "<leader>se", function()
			vim.lsp.buf.selection_range(1, 200)
		end, { buffer = bufnr, desc = "扩大语法选择范围" })

		map("n", "<leader>sc", function()
			vim.lsp.buf.selection_range(-1, 200)
		end, { buffer = bufnr, desc = "缩小语法选择范围" })

		map("n", "<leader>wd", function()
			vim.lsp.buf.workspace_diagnostics({})
		end, { buffer = bufnr, desc = "工作区诊断" })

		-- ========== 诊断 ==========
		vim.keymap.set("n", "gEj", function()
			vim.diagnostic.jump({ count = 1 })
		end, { desc = "下一条诊断" })
		vim.keymap.set("n", "gEk", function()
			vim.diagnostic.jump({ count = -1 })
		end, { desc = "上一条诊断" })

		-- 查看
		vim.keymap.set("n", "gEe", vim.diagnostic.open_float, { desc = "显示诊断详情" })

		-- 列表
		vim.keymap.set("n", "gEa", vim.diagnostic.setqflist, { desc = "诊断到快速修复列表" })
		vim.keymap.set("n", "gEg", vim.diagnostic.setloclist, { desc = "诊断到位置列表" })

		vim.diagnostic.config({
			-- 1. 左侧边栏图标 (Sign Column)
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "", -- 错误图标
					[vim.diagnostic.severity.WARN] = "", -- 警告图标
					[vim.diagnostic.severity.HINT] = "", -- 提示图标
					[vim.diagnostic.severity.INFO] = "", -- 信息图标
				},
			},

			-- 2. 行尾虚拟文本 (Virtual Text)
			virtual_text = {
				prefix = "●", -- 前缀符号
				spacing = 1, -- 与代码的间距
				source = "if_many", -- 如果多个 LSP 报错，显示来源 (如 [pyright])
			},

			-- 3. 下划线高亮错误代码
			underline = true,

			-- 4. 警告/错误按严重程度排序（错误排在最上面）
			severity_sort = true,

			-- 5. 光标悬浮时，在浮动窗口显示完整信息
			float = {
				border = "rounded",
				source = true,
			},
		})
	end,
})
