
// obj_soul_break - Create Event

//x = room_width/2;
//y = room_height/2;

image_index = 0;
image_speed = 0;


timer = 0;

// Sequence
shards_created = false;

timer = 0;

if variable_global_exists("screenshot") //If the screenshot exists then the soul is invisible
if (global.screenshot != -1)             //Screnshot exists
image_alpha = 0;                        // soul invisible


room_scale = (room_width / 320 * 1.5)*0.3;

image_xscale = room_scale;
image_yscale = room_scale;
