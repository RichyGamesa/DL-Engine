//obj_dw_transition create event
if instance_number(obj_dw_transition) <= 1
started = false
else
started = true
con = 8
timer = 0
index = 0
image_alpha =  1;
image_xscale = 0.01;
image_yscale = 0.01;
camerax = obj_darkdoor.x
cameray = obj_darkdoor.y
instance_created = 0;
go_away = 0;
last_x = 0;
last_y = 0;
alarm[4] = 30
