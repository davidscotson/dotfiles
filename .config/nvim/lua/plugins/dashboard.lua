return {
  { "nvimdev/dashboard-nvim", enabled = false },

  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}

      -- Replace <leader> with spacebar icon in key display
      opts.dashboard.formats = opts.dashboard.formats or {}
      opts.dashboard.formats.key = function(item, ctx)
        local key = item.key:gsub("<[Ll]eader>", "󱁐 ")
        return { key, hl = "key" }
      end

      -- Remap single-key shortcuts to full LazyVim equivalents
      local mappings = {
        f = "<leader>ff",
        n = "<leader>fn",
        p = "<leader>fp",
        g = "<leader>sg",
        r = "<leader>fr",
        c = "<leader>fc",
        s = "<leader>qs",
        l = "<leader>l",
      }
      local keys = (opts.dashboard.preset or {}).keys or {}
      local result = {}
      for _, item in ipairs(keys) do
        if mappings[item.key] then
          item.key = mappings[item.key]
        end
        table.insert(result, item)
      end
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.keys = result

      opts.dashboard.preset.header = [[
              __
___     ___    ___   __  __ /\_\    ___ ___
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\
 /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \
  \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]]

      return opts
    end,
  },
}
