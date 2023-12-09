local status, toggleterm = pcall(require, 'toggleterm')
if (not status) then return end

toggleterm.setup({
  direction = 'horizontal',
  size = 20,
  open_mapping = [[<M-j>]]
})
