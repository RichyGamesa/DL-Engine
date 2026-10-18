depth = -y;

image_xscale = 1
if animated
image_speed = 1;

if mainchara.x > x-3
sprite_index = left_sprite

if mainchara.y > y + 2
sprite_index = down_sprite

if mainchara.x > x + 3
{
sprite_index = right_sprite
if flip_it
image_xscale = -1
}
