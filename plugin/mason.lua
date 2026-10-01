vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },

})

require "mason".setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    ensure_installed = {
        "lua_ls",
    --  "clangd",
        "rust_analyzer",
    },
    automatic_installation = true,

}

require "mason-lspconfig".setup {
    automatic_enable = {
        exclude = {
            "rust_analyzer",
            "ls_lua",
            "clangd"
        }
    }
}
