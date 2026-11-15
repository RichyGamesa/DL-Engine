// obj_menu_wave Step Event

if (BGMADE == 1 && SUBTYPE == 1)
{
    ANIM_SINER += 1;
    ANIM_SINER_B += 1;
    BG_SINER += 1;

    if (BG_ALPHA < 0.5)
        BG_ALPHA += (0.04 - (BG_ALPHA / 14));

    if (BG_ALPHA > 0.5)
        BG_ALPHA = 0.5;

    T_SINER_ADD = (sin(ANIM_SINER_B / 10) * 0.6) - 0.25;

    if (T_SINER_ADD >= 0)
        TRUE_ANIM_SINER += T_SINER_ADD;
}