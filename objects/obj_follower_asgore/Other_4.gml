if instance_exists(obj_mainchara)
{
for (var i = 0; i <= record; i++) 
{
obj_mainchara.pos_x[i] = obj_mainchara.x
obj_mainchara.pos_y[i] = obj_mainchara.y
}

}


if !global.flag[10]
{
if instance_exists(obj_follower_susie)
instance_destroy(obj_follower_susie)
}
else
instance_destroy()

/*
instance_destroy()
instance_create_depth(x,y,depth,obj_follower_susie)