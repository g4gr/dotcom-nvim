local status , gruvbox = pcall( require , 'gruvbox' )
if ( not status ) then return end

gruvbox.setup = {
  default = {
    gruvbox_transparent_bg = true ,
    gruvbox_contrast_dark = 'hard' ,
    gruvbox_hls_cursor = 'blue' ,
  }
}
