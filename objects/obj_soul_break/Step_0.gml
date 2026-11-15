// obj_soul_break - Step Event

x = room_width/2 + 70;
y = room_height/2 + 210;

timer += 1;

// TIMER 1 - Stop sounds
if (timer == 1)
{
    audio_stop_all();
}

// TIMER 30 - Reveal the soul
if (timer == 30)
{
    image_alpha = 1;
}

// TIMER 31 - Delete screenshot
if (timer == 31)
{
	if variable_global_exists("screenshot")
    if (global.screenshot != -1)
    {
        if (sprite_exists(global.screenshot))
            sprite_delete(global.screenshot);

        global.screenshot = -1;
    }
	
	image_speed = 1.05;
}


// TIMER 50 - First break
if (timer == 50)
{
    audio_play_sound(snd_break1, 1, false);

    image_speed = 0.40;
}


// TIMER 90 - Second break and fragments
if (timer == 90)
{
    audio_play_sound(snd_break2, 1, false);

    visible = false;

    for (var i = 0; i < 6; i += 1)
    {
        var fragment = instance_create_layer(
            x, y, "Instances", obj_heartshards
        );

        with (fragment)
        {
            direction = random(360);
            speed = 7;

            gravity_direction = 270;
            gravity = 0.2;

            sprite_index = spr_heartshards;
            image_speed = 0.2;
        }
    }

    shards_created = true;
}


// TIMER 166 - Game Over
if (timer == 166)
{
    instance_create_depth(0, -32, -99, obj_gameover);
    instance_destroy();
}

draw_text(20, 20, "Timer: " + string(timer));

if variable_global_exists("screenshot")
draw_text(20, 40, "Screenshot: " + string(global.screenshot));
