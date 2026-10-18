if room = rm_kris_home
{
if place_meeting(x,y,obj_mainchara) and obj_mainchara.can_move and !instance_exists(oTextbox_light)
if keyboard_check(global.confirm) or keyboard_check(vk_enter)
{
keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))

//this makes it so it sets the pressed as false so the textbox doesn't skip
if !instance_exists(oTextbox_light)
{
instance_create_depth(x,y,-100,oTextbox_light)
}
//if the textbox doesn't exist create it.
if !array_contains(global.light_items,"CD")
{
oTextbox_light.text[0] = "* You got the CD"
var lenght = array_length(global.light_items) //get the lenght of the array
array_insert(global.light_items,lenght,"CD")
}
else
{
oTextbox_light.text[0] = "* You already have the CD"	
}
//if we don't have the CD then give it to us otherwise say we already have it.
}
}
