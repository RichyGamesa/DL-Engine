//create event
if instance_exists(obj_dw_transition)
{
    instance_destroy()
    return;
}
depth = 50000
image_xscale = 2
image_yscale = 2
image_speed = 0
con = 0
kris_dist = 0
draw_kris = 0
kris_only = 1
kris_x = (x - 24)
kris_y = (y - 80)
sus_x = (x - 60)
sus_y = (y - 94)
if global.member[1]
{
    kris_only = 0
    kris_x = (x + 12)
    kris_y = (y - 80)
}
fake_v = 0
siner = 0
drawpillar = 1
pillarsiner = 0
pillaralpha = 0
pillarscale = 2
bottom = 1
done = true;


