// @Item literally just write the item name and call this function somewhere, a place where i use it is the shop
function add_items_dark(argument0)
{

var longness = array_length(global.items_dark)
show_debug_message("LONGness before = " + string(longness))

if longness < 12
{
	array_insert(global.items_dark,longness,argument0)
	show_debug_message("LONGness AFTER = " + string(longness))
	return
}
else
{
longness = array_length(global.items_dark_save)
show_debug_message("SAVE = " + string(longness))
if longness < 48
array_insert(global.items_dark_save,longness,argument0)	
return
}
	


}