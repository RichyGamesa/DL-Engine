function scr_weaponinfo_mine() //gml_Script_scr_weaponinfo_mine
{
    for (var i = 0; i < 6; i += 1)
    {
        scr_weaponinfo(global.charweapon[i])
        charweaponname[i] = weaponnametemp
        charweapondesc[i] = global.weapondesctemp
        charweaponat[i] = global.weaponattemp
        charweapondf[i] = global.weaponattemp
        charweaponmag[i] = global.weaponmagtemp
        charweaponbolts[i] = weaponboltstemp
        charweaponstyle[i] = weaponstyletemp
        charweapongrazeamt[i] = weapongrazeamttemp
        charweapongrazesize[i] = weapongrazesizetemp
        charweaponability[i] =  global.weaponabilitytemp
        charweaponabilityicon[i] = global.weaponabilityicontemp
        charweaponicon[i] = global.weaponicontemp
        global.itemat[i][0] = global.weaponattemp
        global.itemdf[i][0] = global.weaponattemp
        global.itemmag[i][0] = global.weaponmagtemp
        global.itembolts[i][0] = weaponboltstemp
        global.itemgrazeamt[i][0] = weapongrazeamttemp
        global.itemgrazesize[i][0] = weapongrazesizetemp
    }
}

