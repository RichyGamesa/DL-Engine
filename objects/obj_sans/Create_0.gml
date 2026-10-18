//obj_sans Create event

image_xscale = 1;
image_yscale = 1;

if global.darkworld 
{
image_xscale = 2
image_yscale = 2
}

image_speed = 0;

wall = instance_create_depth(x,y,depth,oWall)
wall.image_xscale = 0.25;
wall.image_yscale = 0.15;
tx = noone;