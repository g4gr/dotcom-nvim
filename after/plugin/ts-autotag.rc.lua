local status, autotag = pcall(require, 'nvim-ts-autotag')
if (status) then return end

autotag.setup {}
