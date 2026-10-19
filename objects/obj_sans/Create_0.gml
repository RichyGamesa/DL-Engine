
image_xscale = global.darkworld ? 2 : 1;
image_yscale = global.darkworld ? 2 : 1;

image_speed = 0;

wall = instance_create_depth(x, y, depth, oWall);

if (instance_exists(wall))
{
    wall.image_xscale = 0.25;
    wall.image_yscale = 0.15;
}

tx = noone;
