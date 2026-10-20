
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

            // Names used by the Step Event.
            _follower.sprite_down = spr_suzyD;
            _follower.sprite_right = spr_suzyR;
            _follower.sprite_up = spr_suzyU;
            _follower.sprite_left = spr_suzyL;

            _follower.sprite_down_dark = spr_suzyD_dark;
            _follower.sprite_right_dark = spr_suzyR_dark;
            _follower.sprite_up_dark = spr_suzyU_dark;
            _follower.sprite_left_dark = spr_suzyL_dark;
        break;
		
      
        case "Ralsei":
	    _follower.down_light = spr_ralseiD;
	    _follower.right_light = spr_ralseiR;
	    _follower.up_light = spr_ralseiU;
	    _follower.left_light = spr_ralseiL;

	    _follower.down_dark = spr_ralseiD;
	    _follower.right_dark = spr_ralseiR;
	    _follower.up_dark = spr_ralseiU;
	    _follower.left_dark = spr_ralseiL;

	    _follower.slide_sprite_light = spr_ralsei_slide;
	    _follower.slide_sprite_dark = spr_ralsei_slide;

	    _follower.sprite_down = spr_ralseiD;
	    _follower.sprite_right = spr_ralseiR;
	    _follower.sprite_up = spr_ralseiU;
	    _follower.sprite_left = spr_ralseiL;

	    _follower.sprite_down_dark = spr_ralseiD;
	    _follower.sprite_right_dark = spr_ralseiR;
	    _follower.sprite_up_dark = spr_ralseiU;
	    _follower.sprite_left_dark = spr_ralseiL;
	break;

        // Add Noelle and other characters here.
 }
}
