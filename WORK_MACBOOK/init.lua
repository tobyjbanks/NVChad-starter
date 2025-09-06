require "core"

vim.env.HTTP_PROXY  = "http://proxy.bloomberg.com:81"
vim.env.HTTPS_PROXY = "http://proxy.bloomberg.com:81"
vim.env.NO_PROXY    = "localhost,127.0.0.1,.dx.bloomberg.com,.dev.bloomberg.com,.bdns.bloomberg.com,.bcs.bloomberg.com,.tdmz1.bloomberg.com"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
