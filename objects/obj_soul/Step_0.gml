// Step Event of obj_soul

/// Follow the target outside of bullet-zone movement.
if (global.bulletzone)
{
    if (instance_exists(obj_kris_target))
    {
        x = obj_kris_target.x;
        y = obj_kris_target.y;
        depth = obj_kris_target.depth - 1;
    }
}

/// Handle being hit and start invincibility.
if (hit_by_bullet && invincible_timer <= 0)
{
    invincible_timer = invincible_duration;
    soul_flash_timer = 0;
    soul_visible = true;

    // Consume the hit signal.
    hit_by_bullet = false;
}

/// Invincibility frames and flashing.
if (invincible_timer > 0)
{
    invincible_timer--;

    // Toggle visibility every few steps.
    soul_flash_timer++;

    if (soul_flash_timer >= 3)
    {
        soul_flash_timer = 0;
        soul_visible = !soul_visible;
    }

    image_alpha = soul_visible ? 1 : 0;
}
else
{
    soul_visible = true;
    image_alpha = 1;
    soul_flash_timer = 0;
}

/// SOUL movement during battle.
if (global.battle && !global.bulletzone)
{
    if (instance_exists(obj_battle_box))
    {
        var _left = keyboard_check(global.left);
        var _right = keyboard_check(global.right);
        var _up = keyboard_check(global.up);
        var _down = keyboard_check(global.down);

        xspd = (_right - _left) * move_spd;
        yspd = (_down - _up) * move_spd;

        // Normalize diagonal movement.
        if (xspd != 0 && yspd != 0)
        {
            xspd *= 0.70710678;
            yspd *= 0.70710678;
        }

        // Move horizontally and vertically separately.
        // Stop if the next position leaves the battle box.
        if (place_meeting(x + xspd, y, obj_battle_box))
            x += xspd;

        if (place_meeting(x, y + yspd, obj_battle_box))
            y += yspd;
    }
}
