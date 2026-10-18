function scr_weaponinfo_all() //gml_Script_scr_weaponinfo_all
{
    for (var i = 0; i < 48; i += 1)
    {
        scr_weaponinfo(global.weapon[i])
        weaponname[i] = weaponnametemp
        weapondesc[i] = global.weapondesctemp
        amessage2[i] = amessage2temp
        amessage3[i] = amessage3temp
        amessage4[i] = amessage4temp
        weaponat[i] = global.weaponattemp
        weapondf[i] = global.weaponattemp
        weaponmag[i] = global.weaponmagtemp
        weaponbolts[i] = weaponboltstemp
        weaponstyle[i] = weaponstyletemp
        weapongrazeamt[i] = weapongrazeamttemp
        weapongrazesize[i] = weapongrazesizetemp
        weaponchar1[i] = weaponchar1temp
        weaponchar2[i] = weaponchar2temp
        weaponchar3[i] = weaponchar3temp
        weaponchar4[i] = weaponchar4temp
        weaponglobal.value[i] = global.value
        weaponability[i] =  global.weaponabilitytemp
        weaponabilityicon[i] = global.weaponabilityicontemp
        weaponicon[i] = weaponicontemp
    }
}

