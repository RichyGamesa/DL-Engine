x = obj_mainchara.x;
y = obj_mainchara.y;
depth = -9999;
xspd = 0;
yspd = 0;
move_spd = 1;
//how fast you move
image_alpha = 1;
walk_spd = 1.2;
run_spd = 2.4;



global.memberData = [
    {
        name: "Kris",
        hp_points: global.hp_K,
        maxHp: global.maxhp_K,
		face: spr_kris_head,
        faceSprite: spr_krisb_face,
        hpBarColor: c_aqua
    },
    {
        name: "Susie",
        hp_points: global.hp_S,
        maxHp: global.maxhp_S,
		face: spr_suzy_head,
        faceSprite: spr_susieb_face,
        hpBarColor: c_fuchsia
    },
    {
        name: "Ralsei",
        hp_points: global.hp_R,
        maxHp: global.maxhp_R,
		face: spr_ralsei_head,
        faceSprite: spr_ralseib_face,
        hpBarColor: c_lime
    },
    {
        name: "Toriel",
        hp_points: global.hp_T,
        maxHp: global.maxhp_T,
		face: spr_kris_head,
        faceSprite: spr_torielb_face_shop,
        hpBarColor: c_orange
    }
];