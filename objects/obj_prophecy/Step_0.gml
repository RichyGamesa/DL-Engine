if place_meeting(x,y-60,obj_mainchara)
{
start = true	
}

if start
{
if image_alpha < 1 
image_alpha += 0.1

image_index = 0;
}

instance_destroy()