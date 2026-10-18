//step event

if global.darkworld == false
{
 image_xscale = 1
 image_yscale = 1
}
else
{
 image_xscale = 2
 image_yscale = 2
}

if x = xprevious and y = yprevious and cutscene == false and global.battle == false
{
 image_index = 0;
 image_speed = 0;
}