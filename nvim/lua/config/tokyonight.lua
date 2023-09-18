-- https://github.com/folke/tokyonight
require('tokyonight').setup({
    style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
    day_brightness = 0.3 -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
})

vim.cmd [[colorscheme tokyonight]]
