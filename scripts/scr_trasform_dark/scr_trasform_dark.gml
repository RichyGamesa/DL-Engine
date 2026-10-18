function scr_trasform_dark(argument0){

argument0 = con
if global.member[1] == true
{
if con == 0
{
if instance_exists(obj_follower_suzy) 
	 {
  
   if !instance_exists(obj_suzy)
   {instance_create_depth(obj_follower_suzy.x,obj_follower_suzy.y,obj_follower_suzy.depth,obj_suzy)}
   obj_follower_suzy.image_alpha = 0;
   s = obj_suzy;
	 }
}
if con == 1
{
 with (s)
 {
	 cutscene = true
	 x = 315;
	 y = 90;
 sprite_index = spr_suzyU;
 vspeed = 3;
 image_speed = 0
 }
}
if con == 3
{

with (s)
{
 image_index = 0
 image_speed = 0
 vspeed = 0;	
}
	
}
if con == 5
{
	
	with (s)
	{
	  sprite_index = spr_suzy_run_up;
	  image_speed = 3.5
	  vspeed = -6	
	}
	
}
if con == 7
{
with (s)
{
 vspeed = 0;	
 image_speed = 0
 image_index = 0
}
}
if con == 8 or con == 9
{
    with (s)
  {
	  if obj_darkdoor.susie_jumped == false
	  {
	if y < 85
	{vspeed = -8}
	else
	{
		vspeed = 0
		obj_darkdoor.susie_jumped = true
    }
	  }
	sprite_index = spr_suzy_jump_dw
	if image_index > 1 {image_index = 0}
	image_speed = 6
	
  }  

	
	}
if con == 10
{
with (s)
	{
	  sprite_index = spr_suzy_transform
	  image_index = obj_mainchara.image_index
}
}
if con == 11
{
with (s)
{
	sprite_index = spr_suzy_dw_fall
	image_speed = 1.2
}
}
if con == 13
{
with (s)
{
  sprite_index = spr_suzy_dw_final	
  image_speed = 0.5
}

}
if con == 14
{
 with (s)
 {
     sprite_index = spr_suzy_dw_falling
	 image_speed = 0.9
	 vspeed = 10
 }

}

}
}
