local status , n = pcall( require , 'palenight')
if ( not status ) then return end

local colorbuddy = require( 'colorbuddy.init' )

local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local Groups = colorbuddy.Groups
local styles = colorbuddy.styles

Color.new( 'black' , '#0000' )
Color.new( 'blue' , '#2474AC' )
Color.new( 'green' , '#4BA35A' )
Color.new( 'white' , '#ddddd' )
Color.new( 'yellow' , '#f2da4b' )
Color.new( 'red' , '#D73E2A')

Group.new( 'CursorLine' , colors.none , colors.blue , styles.NONE , colors.blue )
Group.new( 'CursorLineNr' , colors.blue , colors.black , styles.NONE , colors.base1 )
Group.new( 'Visual' , colors.none , colors.yellow , styles.reverse )

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new( "DiagnosticVirtualTextError" , cError , cError:dark():dark():dark():dark(), styles.NONE )
Group.new( "DiagnosticVirtualTextInfo" , cInfo , cInfo:dark():dark():dark() , styles.NONE )
Group.new( "DiagnisticVirtualTextWarn" , cWarn , cWarn:dark():dark():dark() , styles.NONE )
Group.new( "DiagnisticVirtualTextHint" , cHint , cHint:dark():dark():dark() , styles.NONE )
Group.new( "DiagnisticUnderlineError" , colors.none , colors , none , styles.undercurl , cError )
Group.new( "DiagnisticUnderlineWarn" , colors.none , colors , none , styles.undercurl , cWarn )
Group.new( "DiagnisticUnderlineInfo" , colors.none , colors , none , styles.undercurl , cInfo )
Group.new( "DiagnisticUnderlineHint" , colors.none , colors , none , styles.undercurl , cHint )
