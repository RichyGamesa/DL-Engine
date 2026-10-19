
if (!instance_exists(obj_mainchara))
{
    exit;
}

// Follow Kris.
x = obj_mainchara.x - 1.2;
y = obj_mainchara.y - 0.5;

if (global.bulletzone == true)
{
    // Fade to 65% opacity without going below it.
    if (image_alpha > 0.65)
    {
        image_alpha = max(0.65, image_alpha - 0.05);
    }

    visible = true;

    image_xscale = 2;
    image_yscale = 2;

    // Match the heart sprite to Kris's current animation.
    if (obj_mainchara.sprite_index == KrisD_dark)
        sprite_index = spr_Kris_heartD;
    else if (obj_mainchara.sprite_index == KrisR_dark)
        sprite_index = spr_Kris_heartR;
    else if (obj_mainchara.sprite_index == KrisU_dark)
        sprite_index = spr_Kris_heartU;
    else if (obj_mainchara.sprite_index == KrisL_dark)
        sprite_index = spr_Kris_heartL;
    else if (obj_mainchara.sprite_index == spr_kris_dark_slide)
        sprite_index = spr_kris_heart_slide;

    image_index = obj_mainchara.image_index;

    // Create the soul if it doesn't already exist.
    if (!instance_exists(obj_soul) && instance_exists(obj_kris_target))
    {
        instance_create_depth(
            obj_kris_target.x,
            obj_kris_target.y,
            obj_kris_target.depth - 1,
            obj_soul
        );
    }
}
else
{
    instance_destroy();
    exit;
}

// Handle death.
if (global.total_hp <= 0)
{
    room_goto(rm_death);
    instance_destroy();
    exit;
}
