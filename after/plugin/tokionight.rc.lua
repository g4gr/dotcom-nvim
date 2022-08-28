local status, tokionight = pcall(require, 'tokionight')
if (not status) then
  return
end

tokionight.setup = {
  style = 'night',
  transparent = true,
}
