//draw event
pillarsiner++
draw_self()
var dist = 0
if instance_exists(obj_mainchara)
    dist = (point_distance(x, y, (obj_mainchara.x + 20), (obj_mainchara.y + 30)) - 30)
if (dist < 0)
    dist = 0
var alphadist = (dist / 1500)
if (alphadist >= 0.3)
    alphadist = 0.3
draw_sprite_ext(spr_dtrans,0,x,y,2,2,0,c_white,pillaralpha)
if (bottom == 1)
{
    if (draw_kris == 1)
    {
        fake_v -= 0.2
        kris_y += fake_v
        sus_y += fake_v
        siner += (1 + (siner / 60))
        if (global.member[1])
            draw_sprite_ext(spr_susie_dw_fall_d, (siner / 6), sus_x, sus_y, 2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_kris_d_fall, (siner / 6), kris_x, kris_y, 2, 2, 0, c_white, 1)
    }
}
