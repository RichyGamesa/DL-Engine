friction = 0.2
image_alpha = 0.8
if (instance_exists(obj_mainchara) && getdepth)
    depth = (obj_mainchara.depth + 100)
var remx = x
var remy = y
x += random_range(1, -1)
y += random_range(1, -1)
hspeed += random_range(-0.5, 0.5)
vspeed += random_range(-0.5, 0.5)
image_angle += random_range(10, -10)
if (place_meeting(x, y, oWall) || (place_meeting(x, y, obj_chest_bug) && getdepth == 1))
{
    x = remx
    y = remy
}
if (y > room_height)
    y = remy

if (image_alpha < 0.05)
    instance_destroy()
if (y <= (starty - 20))
    getdepth = 1


if start_fading
{
	image_alpha -= 0.05
}

show_debug_message(alarm[0])