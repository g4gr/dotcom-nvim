local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

--Aumentar / Decrementar
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Borrar palabras hacia atras
keymap.set('n', 'dw', 'vb"_d')

-- Tabs
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'vs', ':vsplit<Return><C-w>w', { silent = true })
keymap.set('n', '<Leader>c', ':close<Return><C-w>w', { silent = true })

-- Movimiento entre ventanas
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')


-- Configuracion teclas F

-- Configuracion Teclas numericas
keymap.set('n', '<C-1>', ':ColorizerToggle<Return>', { silent = true })
keymap.set('n', '<C-2>', ':RN<Return>', { silent = true }) -- RelativeNumbers
