require("plugins.plugins")
local dir = vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "configs")

for file, kind in vim.fs.dir(dir) do
	if kind == "file" and file:match("%.lua$") then
		local ok, err = pcall(dofile, vim.fs.joinpath(dir, file))
		if not ok then
			vim.notify(("加载 %s 失败: %s"):format(file, err), vim.log.levels.ERROR)
		end
	end
end
