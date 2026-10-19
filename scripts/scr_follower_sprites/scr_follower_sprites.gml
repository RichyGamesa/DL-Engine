
function scr_follower_setup(_follower, _character)
{
    switch (_character)
    {
        case "Susie":
            _follower.down_light = spr_suzyD;
            _follower.right_light = spr_suzyR;
            _follower.up_light = spr_suzyU;
            _follower.left_light = spr_suzyL;
            _follower.slide_sprite_light = spr_suzy_slide;

            _follower.down_dark = spr_suzyD_dark;
            _follower.right_dark = spr_suzyR_dark;
            _follower.up_dark = spr_suzyU_dark;
            _follower.left_dark = spr_suzyL_dark;
            _follower.slide_sprite_dark = spr_suzy_slide;
        break;

        // Add Ralsei and other characters here.
    }
}
