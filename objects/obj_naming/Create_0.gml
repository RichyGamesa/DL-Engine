/// obj_namescreen Create Event

al_ucase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
codename = "";
sel = 0;
siner = 0;
text = "ENTER YOUR OWN NAME.";
confirm_name = "Is this name correct?"
confirm_font = fnt_dt_mono_BIG
confirm_scale = 1
confirm_color = c_white
can_name = true
menu = 1;
time_ch = 0;
timer = 220
go = false
_w = 240;
tran = noone

image_xscale = 1

volume = false;

uc_letters = array_create(26);

for (var i = 0; i < 26; i++)
{
    uc_letters[i] = string_char_at(al_ucase, i + 1);
}



controls = false;
selected_a_control = false;
selected_color = c_aqua //The color of the selected option 



window_set_caption("Deltarune Chapter " + string(global.chapter))
