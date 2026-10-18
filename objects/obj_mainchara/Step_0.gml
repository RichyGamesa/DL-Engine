//obj_mainchara step event
//a Step-Event runs code every SINGLE frame

depth = -y;
//The depth depends on the y

var down_key = keyboard_check(global.down);
var left_key = keyboard_check(global.left);
var right_key = keyboard_check(global.right);
var up_key = keyboard_check(global.up);
//the variable when the arrow keys are pressed


xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;
//when the right/left key is pressed it means it's xspd
//when the down/up key is pressed it means it's yspd

//collision
if place_meeting(x+xspd, y, oWall) or place_meeting(x+xspd, y, oCollision) or place_meeting(x+xspd, y, oWall_cutscene)  {
xspd= 0;
}
if place_meeting(x, y+yspd, oWall) or place_meeting(x, y+yspd, oCollision) or place_meeting(x+xspd, y, oWall_cutscene){
yspd= 0;
}
//if the x or y are the wall they will set the movement to 0 making the character not move.
if instance_exists(Obj_slide)
{
if Obj_slide.interacted == true and sliding == false and y> Obj_slide.y
{
	if place_meeting(x, y+yspd, Obj_slide){
yspd= 0;
}
}
}


if sliding == false {object_set_mask(obj_mainchara,KrisD)}
if sliding == true {object_set_mask(obj_mainchara,spr_kris_dark_slide)}

if global.battle
{
	xspd = 0;
	yspd = 0;
}

// running or walking
if global.darkworld = false
{
    
	if autorun == false
	{
	walk_spd = 1.2;
    run_spd = 2.4;
	}
	else
	{
	walk_spd = 2.4;
    run_spd = 1.2;
	}
}
else
{
    if autorun == false
	{
	walk_spd = 2.4;
    run_spd = 3.6;
	}
	else
  {
	  	walk_spd = 3.6;
        run_spd = 2.4;
  }
}

if sliding == false 
{
if keyboard_check(vk_shift) or keyboard_check(global.cancel)
{move_spd = run_spd} 
else
{move_spd = walk_spd}
}

if global.darkworld = false
{
if sliding == false
{
if(can_move){
//animate
if xspd > 0 {
	sprite_index = sprite_right;
	//overlap.sprite_index = sprite_right_dark
} else if xspd < 0 {
	sprite_index = sprite_left;
	//overlap.sprite_index = sprite_left_dark
} else if yspd > 0 {
	sprite_index = sprite_down;
	//overlap.sprite_index = sprite_down_dark
} else if yspd < 0 {
	sprite_index = sprite_up;
	//overlap.sprite_index = sprite_up_dark
}
}
}
else
sprite_index = sprite_slide;
}
else
if global.darkworld = true
{
	if sliding == false
	{
	if(can_move)
	{
//animate
if xspd > 0 {
	sprite_index = sprite_right_dark;
} else if xspd < 0 {
	sprite_index = sprite_left_dark;
} else if yspd > 0 {
	sprite_index = sprite_down_dark;
} else if yspd < 0 {
	sprite_index = sprite_up_dark;
}
}
}
else
sprite_index = sprite_slide_dark;
}


if(xspd != 0 or yspd != 0){
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
//image index is the frame of the animation
}

// how the x and y update

x += xspd; 
if sliding == false 
{
y += yspd;
}
else
{
	if global.bulletzone {y += yspd + 3}
	else
	{y += yspd + 6}
}

if (x != xprevious or y!= yprevious) 
{
for(var i = array_size-1; i > 0; i--){
	
        pos_x[i] = pos_x[i-1];
		pos_y[i] = pos_y[i-1];
		 }
		 
		  pos_x[0] = x;
		  pos_y[0] = y;
		
	


}
if x = xprevious and y = yprevious {image_index = 0}

if can_move = false {move_spd = 0};


if (global.darkworld = true)
{
    image_xscale = 2;
    image_yscale = 2;
}

if image_index = sprite_slide and place_meeting(x,y,oCollision) and y = yprevious and x = xprevious and sliding = true
{
  x = Obj_slide	
}
if keyboard_check(ord("H"))
image_alpha = 0;
/*
if !instance_exists(obj_soul_blush)
{instance_create_depth(x,y,depth,obj_soul_blush)}