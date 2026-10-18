//obj_chest create event
myinteract = 0
talked = false
image_speed = 0
close = 0



image_xscale = 2;
image_yscale = 2;
wall = instance_create_depth(x,y,depth,oWall)
wall.image_xscale = 0.3;
wall.image_yscale = 0.3;



flag_index = 5;
flag = global.flag[flag_index]