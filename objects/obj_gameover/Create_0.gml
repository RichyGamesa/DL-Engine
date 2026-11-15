
// obj_gameover - Create Event

image_speed = 0;
image_alpha = 0;

// Position
x = 0;
y = -32;

// Sequence
event = 0;
timer = 0;

// Dialogue
speak = irandom(1);

draw_char = 0;
old_draw_char = 0;
text_speed = 1;

// Choices
// 0 = Center
// 1 = Continue
// 2 = Give up
choice = 0;

// Soul cursor position
soul_draw_x = 300;
soul_draw_y = 205;

// Animation
choice_alpha = 0;


failure_started = false;

transition_noise = Deltarune_intro_noise_short;

