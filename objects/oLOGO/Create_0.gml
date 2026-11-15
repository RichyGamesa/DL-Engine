// oLogo Create Event

// LOGO SPRITE
sprite_index = IMAGE_LOGO;
image_index = 0;

logo_width = sprite_get_width(IMAGE_LOGO);
logo_height = sprite_get_height(IMAGE_LOGO);

// SCALE
image_xscale = 1.5;
image_yscale = 1.5;

logo_scale = 1.5;

// POSITION
x = (room_width / 2) - (logo_width * logo_scale / 2);
y = (room_height / 2) - (logo_height * logo_scale / 2) - 35;

// CHAPTER NUMBER
chapter_sprite = IMAGE_LOGO_CENTER_CHAPTERNUMBER;
chapter_index = global.chapter;

chapter_width = sprite_get_width(chapter_sprite);
chapter_height = sprite_get_height(chapter_sprite);

chapter_x = room_width / 2;
chapter_y = y + (logo_height * logo_scale)
    + (chapter_height * logo_scale / 2) + 8;

chapter_alpha = 0;

// LOGO REVEAL
logotimer = 0;
logopieces = 0;

drawlogopart = array_create(9, false);
reveal_order = [0, 8, 1, 7, 2, 6, 3, 5, 4];

// ANIMATION
logo_phase = 0;
logo_timer = 0;

logo_sound_played = false;
transition_started = false;

//SOUNDS ASSETS
letter_noise = snd_noise;
Chapter_noise = Mlaught

// TEMPORARY TITLE ROOM
Title = rm_naming; // Until I write the save-file code