//step event
if instance_exists(obj_menu_dark) 
{if obj_menu_dark.key_menu == false {instance_destroy()}}
else
{instance_destroy()}
if sleep == false {
if image_index >= 7 and sprite_index = spr_lancer_wave
{
	sprite_index = spr_lancer_flip;
}

if rotate == false 
{
if started == false 
{
	if sprite_index = spr_lancer_flip
{
if chosen == false 
{
	if once == false
	{last_x = x; once = true}
	rando = random(2)
	show_debug_message(rando)
	if rando >= 1 {hspeed = 2}
	if rando < 1 {hspeed = -2}
	chosen = true 
}
	if chosen = true
	{
	if x > (last_x + 110) or x < (last_x - 125) 
	{
		hspeed = 0;
		rotate = true;
		}
	alarm[0] = 1800;
}
}
}
}
if (rotate) 
{
	
    sprite_index = spr_Lancer_rotate;

    image_speed = 1; // Adjust the rotation speed
    
    if (image_index >= 3) {
        
		 if (rando >= 1) {hspeed = -2}
        else {hspeed = 2}
        
		image_speed = 1.5;
        sprite_index = spr_lancer_flip;
		image_index = 0;
		started = true;
	    rotate = false;
	}
}

if started = true
{
	if rotate == false {
		
  	if rando >= 1 and x < (last_x - 125) {image_speed = 1.5; hspeed = 2; rando = 0.5}
	if rando < 1 and x > (last_x + 125) {image_speed = 1.5;; hspeed = -2; rando = 1.5}
	if rando >= 1 and x > (last_x + 125) {rotate = true}
	if rando < 1 and x < (last_x - 125) {rotate = true}
	}
	
}
}
if sleep == true {
{
	sprite_index = spr_lacer_sleep;
	hspeed = 0;
}
}

show_debug_message("alarm is " + string(alarm[0]))