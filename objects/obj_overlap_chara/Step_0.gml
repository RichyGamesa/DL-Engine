if invert
{
if image_alpha > 0
image_alpha -= fade_speed;
else
{
	if flag == 0
	{
	alarm[0] = time;
	flag = 1
	}
}
}
else
{
if image_alpha < 1
image_alpha += fade_speed
else
{
	if flag == 0
	{
	alarm[0] = time;
	flag = 1
	}
}
}

if chara != noone
{
	if instance_exists(chara)
	{
	x = chara.x;
	y = chara.y;
	depth = chara.depth-1;
	image_index = chara.image_index;
	}
}

if keyboard_check(ord("P"))
image_alpha = 0;