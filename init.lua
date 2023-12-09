require('zeindevs.base')
require('zeindevs.highlights')
require('zeindevs.maps')
require('zeindevs.plugins')

local has = vim.fn.has
local is_mac = has 'macunix'
local is_win = has 'win32'
local is_wsl = has 'wsl'

if is_wsl then
  require('zeindevs.macos')
end
if is_win then
  require('zeindevs.windows')
end
if is_wsl then
  require('zeindevs.wsl')
end
