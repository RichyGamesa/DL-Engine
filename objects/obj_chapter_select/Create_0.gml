// Create Event
selected_chapter = 1;
selected_button = 0;
button_count = 6; // Assuming there are four buttons (Ch1, Ch2, Ch3,Ch4,Ch5, Quit)
confirmed_a_chapter = false;
anim_start = false;
opacity = 1

depth = 0;

_chapter_icons =
[
spr_chapterIcon, //This is here so that the index is equal to the chapter
spr_chapterIcon_1,
spr_chapterIcon_2,
spr_chapterIcon_3,
spr_chapterIcon_4,
spr_chapterIcon_5,
spr_chapterIcon,
spr_chapterIcon
]

_chapter_title =
[
"- -",         //This is here so that the index is equal to the chapter
"The Beginning",
"A Cyber's World",
"Late Night",
"Prophecy",
"Festival Day",
"Happy Holidays",
"- -"
]

_chapter_noise =
[
snd_nosound,  //This is here so that the index is equal to the chapter
snd_lancerlaugh,
snd_queen_laugh_0_bc,
Mlaught,
snd_cd_bagel_noelle
]


_color = c_white;
_alpha = 1;
_font = fnt_dt_mono

_scale = 2;

_enabled = true;
_title_enabled = true;
_icon_index = 0;

menu_stretch = 1;
menu_surface = -1;

application_surface_draw_enable(false);