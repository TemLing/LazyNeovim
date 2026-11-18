return {
    {
        "mikavilpas/yazi.nvim",
        dependencies = {
            "folke/snacks.nvim",
        },
        keys = {
            {
                "<leader>fy",
                function()
                    require("yazi").yazi()
                end,
                desc = "Open Yazi file manager",
            },
        },
        opts = {
            open_for_directories = true,
            keymaps = {
                show_help = "`",
                open_vertical = "<C-v>",
            },
        },
    },
}
