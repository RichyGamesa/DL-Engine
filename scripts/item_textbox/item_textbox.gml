//@argument0 Text[0]
//@argument1 Text[1] if you want it to be just one text write " "
//@argument2 speaker_sprite[0] if it's just text write noone, otherwise write the sprite
//@argument3 speaker_sprite[1] write noone even if the argument1 is = to " ", it won't matter just write a sprite.
function item_textbox(argument0,argument1,argument2,argument3,argument4){

if !instance_exists(oTextbox_dark)
{
instance_create_depth(x,y,-999999,oTextbox_dark)
}

oTextbox_dark.text[0] = argument0
if argument1 != " "
{oTextbox_dark.text[1] = argument1}

oTextbox_dark.speaker_sprite[0] = argument2;

if argument1 != " "
{oTextbox_dark.speaker_sprite[1] = argument3}

oTextbox_dark.txtb_sound = argument4

if instance_exists(obj_menu_dark)
{instance_destroy(obj_menu_dark)}
if instance_exists(obj_soul)
{instance_destroy(obj_soul)}

}