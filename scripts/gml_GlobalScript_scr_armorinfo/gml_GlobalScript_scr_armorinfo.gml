function scr_armorinfo(argument0) //gml_Script_scr_armorinfo
{
    armorchar4temp = true
    armornametemp = stringsetloc(" ")
    armorelementtemp = 0
    armorelementamounttemp = 0
    switch argument0
    {
        case " ":
            armornametemp = stringsetloc(" ")
            global.armordesctemp = stringsetloc(" ")
            amessage2temp = stringsetloc("Hey, hands off!")
            amessage3temp = stringsetloc(" ")
            amessage4temp = stringsetloc(" ")
			amessage5temp = stringsetloc(" ")
            global.armorattemp = 0
            global.armordftemp = 0
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_empty 
            global.value = 0
            break
        case "Amber Card":
            armornametemp = stringsetloc("Amber Card")
            global.armordesctemp = stringsetloc("A thin square charm that sticks to you, increasing defense.")
            amessage2temp = stringsetloc("... better than nothing.")
            amessage3temp = stringsetloc("It's sticky, huh, Kris...")
            amessage4temp = stringsetloc("It's like a name-tag!")
			amessage5temp = stringsetloc("Thank you Kris.")
            global.armorattemp = 0
            global.armordftemp = 1
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 100
            break
        case "Dice Brace":
            armornametemp = stringsetloc("Dice Brace")
            global.armordesctemp = stringsetloc("A bracelet made out of various symbol-inscribed cubes.")
            amessage2temp = stringsetloc("... okay.")
            amessage3temp = stringsetloc("It says \"Friendship!\"")
            amessage4temp = stringsetloc("Hey, y-you jumbled it...")
            global.armorattemp = 0
            global.armordftemp = 2
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 150
            break
        case "Pink Ribbon":
            armornametemp = stringsetloc("Pink Ribbon")
            global.armordesctemp = stringsetloc("A cute hair ribbon that increases the range bullets increase tension.")
            amessage2temp = stringsetloc("Nope. Not in 1st grade anymore.")
            amessage3temp = stringsetloc("Um... D-do I look cute...?")
            amessage4temp = stringsetloc("... feels familiar.")
            if (global.chapter != 2)
            {
                amessage2temp = stringsetloc("I said NO! C'mon already!")
                amessage3temp = stringsetloc("It's nice dressing up...")
            }
            global.armorattemp = 0
            global.armordftemp = 1
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 20
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = true
            armorchar4temp = true
            global.armorabilitytemp = stringsetloc("GrazeArea")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 100
            break
        case "White Ribbon":
            armornametemp = stringsetloc("White Ribbon")
            global.armordesctemp = stringsetloc("A crinkly hair ribbon that slightly increases your defense.")
            amessage2temp = stringsetloc("Nope. Not in 1st grade anymore.")
            amessage3temp = stringsetloc("Um... D-do I look cute...?")
            if (global.chapter == 2)
            {
                amessage2temp = stringsetloc("I said NO! C'mon already!")
                amessage3temp = stringsetloc("It's nice being dressed up...")
            }
            amessage4temp = stringsetloc("... feels familiar.")
            global.armorattemp = 0
            global.armordftemp = 2
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = true
            global.armorabilitytemp = stringsetloc("Cuteness")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 90
            break
        case "IronShackle":
            armornametemp = stringsetloc("IronShackle")
            global.armordesctemp = stringsetloc("Shackle that ironically increases your attack and defense.")
            amessage2temp = stringsetloc("(Damn, it's actually cool...)")
            amessage3temp = stringsetloc("* jingle jangle* Haha!")
            amessage4temp = stringsetloc("I'm the ghost of holidays past!")
            global.armorattemp = 1
            global.armordftemp = 2
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 150
            break
        case "MouseToken":
            armornametemp = stringsetloc("MouseToken")
            global.armordesctemp = stringsetloc("A golden coin with a once-powerful mousewizard engraved on it.")
            amessage2temp = stringsetloc("This guy's... familiar?")
            amessage3temp = stringsetloc("Chu! Healing power UP!")
            amessage4temp = stringsetloc("... from the family entertainment center?")
			amessage5temp = stringsetloc("It's making a clicking sound")
            global.armorattemp = 0
            global.armordftemp = 0
            global.armormagtemp = 2
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 120
            armorelementtemp = 7
            armorelementamounttemp = 0.5
            break
        case "Jevilstail":
            armornametemp = stringsetloc("Jevilstail")
            global.armordesctemp = stringsetloc("A J-shaped tail that gives you devilenergy.")
            amessage2temp = stringsetloc("Figured I'd grow one someday.")
            amessage3temp = stringsetloc("I'm a good devil, OK?")
            amessage4temp = stringsetloc("... (I like it...)")
			amessage5temp = stringsetloc("It would go great with your headband")
            global.armorattemp = 2
            global.armordftemp = 2
            global.armormagtemp = 2
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 0
            break
        case "Silver Card":
            armornametemp = stringsetloc("Silver Card")
            global.armordesctemp = stringsetloc("A square charm that increases dropped money by 5%")
            amessage2temp = stringsetloc("Money, that's what I need.")
            amessage3temp = stringsetloc("Do they take credit?")
            amessage4temp = stringsetloc("It goes with my watch!")
			amessage5temp = stringsetloc("Did Carol gave you this?")
            global.armorattemp = 0
            global.armordftemp = 2
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc("$ +5%")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 200
            break
        case "TwinRibbon":
            armornametemp = stringsetloc("TwinRibbon")
            global.armordesctemp = stringsetloc("Two ribbons. You'll have to put your hair into pigtails.")
            amessage2temp = stringsetloc("... it gets worse and worse.")
            amessage3temp = stringsetloc("Try around my horns!")
            amessage4temp = stringsetloc("... nostalgic, huh.")
			amessage5temp = stringsetloc("It's perfect for my hat")
            global.armorattemp = 0
            global.armordftemp = 3
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 20
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc("GrazeArea")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 400
            break
        case "GlowWrist":
            armornametemp = stringsetloc("GlowWrist")
            global.armordesctemp = stringsetloc("A tough bracelet made of green wires, and studded with sharp glowing lights.")
            amessage2temp = stringsetloc("Whoops, it's tangled.")
            amessage3temp = stringsetloc("Let me just untangle this...")
            amessage4temp = stringsetloc("It's like holiday lights...")
			amessage5temp = stringsetloc("It's hurting my eyes")
            global.armorattemp = 0
            global.armordftemp = 2
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = false
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 200
            break
        case "ChainMail":
            armornametemp = stringsetloc("ChainMail")
            global.armordesctemp = stringsetloc("Chain-armor. Send it to 10 others or it'll lose its defensive rating")
            amessage2temp = stringsetloc("Damn, guess I'm cursed.")
            amessage3temp = stringsetloc("A letter?... For me...?")
            amessage4temp = stringsetloc("Armor? (It's cool...)")
			amessage5temp = stringsetloc("kris, you sent me a letter?")
            global.armorattemp = 0
            global.armordftemp = 3
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 300
            break
        case "B.ShotBowtie":
            armornametemp = stringsetloc("B.ShotBowtie")
            global.armordesctemp = stringsetloc("A handsome bowtie. Looks like the brand name has been cut off.")
            amessage2temp = stringsetloc("Ugh, I look like a nerd.")
            amessage3temp = stringsetloc("Can I have suspenders?")
            amessage4temp = stringsetloc("... do I put it in my hair?")
            global.armorattemp = 0
            global.armordftemp = 2
            global.armormagtemp = 1
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 300
            break
        case "SpikeBand":
            armornametemp = stringsetloc("SpikeBand")
            global.armordesctemp = stringsetloc("A black wristband covered in spikes. Has the tendency to get stuck to itself.")
            amessage2temp = stringsetloc("Can't say no to spikes.")
            amessage3temp = stringsetloc("Um, do I... look tough?")
            amessage4temp = stringsetloc("(Maybe Susie would like this look?)")
			amessage5temp = stringsetloc("It's making me look SHARP")
            global.armorattemp = 2
            global.armordftemp = 1
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 300
            break
        case "Silver Watch":
            armornametemp = stringsetloc("Silver Watch")
            global.armordesctemp = stringsetloc("Grazing bullets affects the turn length by 10% more")
            amessage2temp = stringsetloc("It's clobbering time.")
            amessage3temp = stringsetloc("I'm late, I'm late!")
            amessage4temp = stringsetloc("(Th-this was mine...)")
			amessage5temp = stringsetloc("Kris we will be late")
            global.armorattemp = 0
            global.armordftemp = 2
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc("GrazeTime")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 1000
            break
        case "TensionBow":
            armornametemp = stringsetloc("TensionBow")
            global.armordesctemp = stringsetloc("Gain 10% more tension from grazing bullets")
            amessage2temp = stringset(" ")
            amessage3temp = stringset(" ")
            amessage4temp = stringset(" ")
            global.armorattemp = 0
            global.armordftemp = 2
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
            global.armorabilitytemp = stringsetloc("TPGain")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 400
            break
        case "Mannequin":
            armornametemp = stringsetloc("Mannequin")
            global.armordesctemp = stringsetloc("It's a mannequin with the clothes permanently attached. Useless")
            amessage2temp = stringsetloc("Not even gonna ask.")
            amessage3temp = stringsetloc("Um, the d-dress is cute...")
            amessage4temp = stringsetloc("(Why did they spend $300 on this!?)")
			amessage5temp = stringsetloc("Kris, it's stuck on the mannequin")
            global.armorattemp = 0
            global.armordftemp = 0
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = false
            armorchar4temp = false
			armorchar5temp = false
            global.armorabilitytemp = stringsetloc("???")
            global.armorabilityicontemp = spr_symbol_mini_alarm
            global.armoricontemp = spr_symbol_mini_empty
            global.value = 300
            armorelementtemp = 6
            armorelementamounttemp = 0.35
            break
        case "DarkGoldBand":
            armornametemp = stringsetloc("DarkGoldBand")
            global.armordesctemp = stringsetloc("A black metal with a golden shine.")
            amessage2temp = stringsetloc("Not even gonna ask.")
            amessage3temp = stringsetloc("Um, the d-dress is cute...")
            amessage4temp = stringsetloc("(Why did they spend $300 on this!?)")
			amessage5temp = stringsetloc("No thank you")
            global.armorattemp = 0
            global.armordftemp = 0
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = false
            armorchar4temp = false
			armorchar5temp = false
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = ((global.chapter * 200) + ((global.chapter - 1) * 220))
            break
        case "SkyMantle":
            armornametemp = stringsetloc("SkyMantle")
            global.armordesctemp = stringsetloc("A cape that shimmers fluorescently. Protects against Elec and Holy attacks.")
            amessage2temp = stringset("SO COOL!")
            amessage3temp = stringset("I'M THE HERO!")
            amessage4temp = stringset(" ")
            global.armorattemp = 0
            global.armordftemp = 1
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
            global.armorabilitytemp = stringsetloc("Elec/Holy")
            global.armorabilityicontemp = 4
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 1
            armorelementtemp = 1
            armorelementamounttemp = 0.5
            break
        case "SpikeShackle":
            armornametemp = stringsetloc("SpikeShackle")
            global.armordesctemp = stringsetloc(" ")
            amessage2temp = stringsetloc("Get a load of THIS!")
            amessage3temp = stringsetloc("Looking SHARP!")
            amessage4temp = stringsetloc("(It's tearing my sleeves...)")
			
			if instance_exists(obj_follower_Toriel_dark){
				amessage2temp = stringsetloc("(Toriel wouldn't like this)")
            amessage3temp = stringsetloc("(She is staring at me)")
            amessage4temp = stringsetloc("(Miss Toriel is looking)")
			}
			amessage5temp = stringsetloc("It would destroy my sleeves")
            global.armorattemp = 3
            global.armordftemp = 1
            global.armormagtemp = 0
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
			if instance_exists(obj_follower_Toriel_dark){
			armorchar1temp = false
            armorchar2temp = false
            armorchar3temp = false
            armorchar4temp = false
			}
			else
			{
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			}
			armorchar5temp = false
            global.armorabilitytemp = stringsetloc("Attack")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 300
            break
        case "FrayedBowTie":
            armornametemp = stringsetloc("FrayedBowTie")
            global.armordesctemp = stringsetloc("An old bowtie. It seems to have lost much of its defensive global.value.")
            amessage2temp = stringsetloc("Look. I have standards.")
            amessage3temp = stringsetloc("It's still wearable!")
            amessage4temp = stringsetloc("(Reminds me of Asgore...)")
			amessage5temp = stringsetloc("No, need for it.  (Why does it make me think of ...)")
            global.armorattemp = 1
            global.armordftemp = 1
            global.armormagtemp = 1
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = false
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 100
            armorelementtemp = 6
            armorelementamounttemp = 0.15
            break
        case "Dealmaker":
            armornametemp = stringsetloc("Dealmaker")
            global.armordesctemp = stringsetloc("Fashionable pink and yellow glasses. Greatly increase $ gained, and...?")
            amessage2temp = stringsetloc("Money, that's what I need.")
            amessage3temp = stringsetloc("Two pairs of glasses?")
            amessage4temp = stringsetloc("(Seems... familiar?)")
			amessage5temp = stringsetloc("This look doesn't make lents! ")
            global.armorattemp = 0
            global.armordftemp = 5
            global.armormagtemp = 5
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
			armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc("$ +30%")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 0
            armorelementtemp = 6
            armorelementamounttemp = 0.4
            break
        case "RoyalPin":
            armornametemp = stringsetloc("RoyalPin")
            global.armordesctemp = stringsetloc("A brooch engraved with Queen's face. Careful of the sharp part.")
            amessage2temp = stringsetloc("ROACH? Oh, brooch. Heh.")
            amessage3temp = stringsetloc("I'm a cute little corkboard!")
            amessage4temp = stringsetloc("Queen... gave this to me.")
			amessage5temp = stringsetloc("Who is she Kris?")
            global.armorattemp = 0
            global.armordftemp = 3
            global.armormagtemp = 1
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_shield
            global.value = 1000
            break
			 case "Golden star":
            armornametemp = stringsetloc("Golden star")
            global.armordesctemp = stringsetloc("A golden star with round ends")
            amessage2temp = stringsetloc("Who is the nerd now?!")
            amessage3temp = stringsetloc("I'm a good cowboy!")
            amessage4temp = stringsetloc("Another one?")
			amessage5temp = stringsetloc("You are giving me a golden star?")
            global.armorattemp = 1
            global.armordftemp = 1
            global.armormagtemp = 2
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = false
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc(" ")
            global.armorabilityicontemp = spr_symbol_mini_empty
            global.armoricontemp = spr_symbol_mini_empty
            global.value = 2000
            break
			 case "Bandana":
            armornametemp = stringsetloc("Bandana") //the name
            global.armordesctemp = stringsetloc("An orange bandana with muscle draw on it") //description
            amessage2temp = stringsetloc("I'M THE BEST!") //Susie reaction
            amessage3temp = stringsetloc("Thank you") //ralsei reaction
            amessage4temp = stringsetloc("(Azzy?)")//noelle's reaction
			amessage5temp = stringsetloc("(Is this your brother's?)")//Toriel reaction
            global.armorattemp = 5
            global.armordftemp = 1
            global.armormagtemp = 2
            armorboltstemp = 0
            armorgrazeamttemp = 0
            armorgrazesizetemp = 0
            armorchar1temp = true
            armorchar2temp = true
            armorchar3temp = true
            armorchar4temp = true
			armorchar5temp = true
            global.armorabilitytemp = stringsetloc("Bravery UP")
            global.armorabilityicontemp = spr_symbol_mini_buff
            global.armoricontemp = spr_symbol_mini_shield //this is the only thing that changes,this should always be a shield, but if you want it can change
            global.value = 0
            break
    }

}

