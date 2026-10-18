x = obj_mainchara.x-1.2;
y = obj_mainchara.y-0.5;

if global.bulletzone = true {
if image_alpha != 0.65
{
image_alpha = image_alpha - 0.05;	
}
visible = true;

image_xscale = 2;
image_yscale = 2;
if obj_mainchara.sprite_index == KrisD_dark {sprite_index = spr_Kris_heartD}
if obj_mainchara.sprite_index == KrisR_dark {sprite_index = spr_Kris_heartR}
if obj_mainchara.sprite_index == KrisU_dark {sprite_index = spr_Kris_heartU}
if obj_mainchara.sprite_index == KrisL_dark {sprite_index = spr_Kris_heartL}
if obj_mainchara.sprite_index == spr_kris_dark_slide {sprite_index = spr_kris_heart_slide}
image_index = obj_mainchara.image_index; //the frame is the same as the mainchara frame.
if instance_exists(obj_soul) == false {
instance_create_depth(obj_kris_target.x+14,obj_kris_target.y+33,obj_kris_target.depth-1,obj_soul);
}

}
else
{
instance_destroy()	
}


if global.total_hp <= 0
{room = rm_death; instance_destroy()}
show_debug_message(global.total_hp)
