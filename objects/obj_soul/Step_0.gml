// Step Event of obj_soul
if global.bulletzone == true 
{
	if instance_exists(obj_kris_target) == true {
		x = obj_kris_target.x+14;
		y = obj_kris_target.y+33;
		depth = obj_kris_target.depth - 1

}
}

//When SOUL is hit


// Flashing effect
if (hit_by_bullet) 
{
    // Flashing effect for the soul object
    if (soul_flash_timer < soul_flash_duration) {
        soul_flash_timer++;

        if (soul_flash_timer % 2 == 0) { // Toggle visibility every other step
            soul_visible = !soul_visible;
        }
    } else {
        // Reset flashing effect variables
        soul_flash_timer = 0;
        soul_visible = true;

        // Reset hit_by_bullet to false
        hit_by_bullet = false;
    }

    // Set visibility
    image_alpha = soul_visible ? 1 : 0; // Set alpha based on visibility
}

if global.battle
{
	if instance_exists(obj_battle_box)
	{
if place_meeting(x,y,obj_battle_box)
{
var down_key = keyboard_check(global.down);
var left_key = keyboard_check(global.left);
var right_key = keyboard_check(global.right);
var up_key = keyboard_check(global.up);
//the variable when the arrow keys are pressed


xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

x += xspd;
y += yspd;
	 }
}
}