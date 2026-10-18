function scr_memb(){
global.memberData = [
    {
        name: "Kris",
        hp_points: global.hp_K,
        maxHp: global.maxhp_K,
		face: spr_kris_head,
        faceSprite: spr_krisb_face,
        hpBarColor: c_aqua
        // No amessage for Kris
    },
    {
        name: "Susie",
        hp_points: global.hp_S,
        maxHp: global.maxhp_S,
		face: spr_suzy_head,
        faceSprite: spr_susieb_face,
        hpBarColor: c_fuchsia,
        amessage2temp: "" // Initialize with appropriate default global.value or empty string
    },
    {
        name: "Ralsei",
        hp_points: global.hp_R,
        maxHp: global.maxhp_R,
		face: spr_ralsei_head,
        faceSprite: spr_ralseib_face,
        hpBarColor: c_lime,
        amessage3temp: "" // Initialize with appropriate default global.value or empty string
    },
    {
        name: "Toriel",
        hp_points: global.hp_T,
        maxHp: global.maxhp_T,
		face: spr_kris_head,
        faceSprite: spr_torielb_face_shop,
        hpBarColor: c_orange,
        amessage5temp: "" // Initialize with appropriate default global.value or empty string
    }
];
}