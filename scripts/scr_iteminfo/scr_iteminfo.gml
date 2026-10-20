function scr_iteminfo(argument0) //gml_Script_scr_iteminfo
{
    global.usable = true
    replaceable = false
	more_reactions = false;
    global.value = 0
	hp = 0
    global.itemtarget = 0
	amessage1temp = ""; //kris doesn't speak;
    itemnameb = " ";
    itemdescb = " ";
	var text0 = " ";
	var text1 = " ";
	var speaker_1 = noone;
	var speaker_2 = noone;
	var sound = snd_text;
	//these are the default condions, to change them you have to put them in the object
	 
           if argument0 == " "{
            global.item_desc = " "
		   }
            
            if argument0 == stringsetloc("Dark Candy")
			{
            global.item_desc = stringsetloc("Heals 40 HP. A red-and-black star that tastes like marshmallows.")
            global.itemtarget = 1
			hp = 40
            global.value = 25
			
			if eaten
			{
			if selected_party_member != 1
			{amessage2temp = "Hey, feed ME!!!"}
			}
			else
			{
			amessage2temp = "Yeahh!! That's good!"
			}
			amessage3temp = "Yummy!!! Marshmallows!!"
			amessage5temp = "It's very good"
			more_reactions = true
            global.usable = true
			}

            if argument0 == stringsetloc("ReviveMint")
			{
            global.item_desc = stringsetloc("Heals a fallen ally to MAX HP.A minty green crystal.")
            global.itemtarget = 1
			amessage2temp = "I'm ALIVE!!!"
			amessage3temp = "(You weren't dead)"
			amessage5temp = "Kris i'm okay.,don't worry"
            global.value = 400
			hp = 90
			more_reactions = false
            global.usable = true
			}
            
			if argument0 == stringsetloc("Glowshard")
			{
            global.item_desc = stringsetloc("A shimmering shard.Its global.value increases each Chapter.")
            global.itemtarget = 0
            global.value = (200 + (global.chapter * 100))
			amessage2temp = "It's kinda cool"
			amessage3temp = "So pretty"
			amessage5temp = "(Are they afraid of the dark?)"
			more_reactions = false
            global.usable = false
			
			}

            if argument0 == stringsetloc("Manual"){
            global.item_desc = stringsetloc("Read out of battle")
            global.itemtarget = 2
            global.value = 1
			more_reactions = false
            global.usable = false
			
			}
 
            if argument0 == stringsetloc("BrokenCake")
			{
            global.item_desc = stringsetloc("Heals 20HP")
            global.itemtarget = 1
            global.value = 5
			hp = 20
			amessage2temp = "Where did it appear from?"
			amessage3temp = "How did you get it?"
			amessage5temp = "It should be a Key item dear"
			more_reactions = true
            global.usable = true
			}
            
			if argument0 ==stringsetloc("Top Cake")
			{
            global.item_desc = stringsetloc("Heals team 160HP")
            global.itemtarget = 2
            global.value = 150
			hp = 999
			amessage2temp = "Delicious"
			amessage3temp = "It was perfect"
			amessage5temp = "It's beutiful"
			more_reactions = true
            global.usable = true
			}


            var healamount = (global.chapter == 1 ? 80 : 140)
            if argument0 == stringsetloc("Spincake")
			{
            global.item_desc = ("This cake will make your taste buds spin! Heals " + string(healamount) + "HP to the team")
            global.itemtarget = 2 //heals the whole party 
            global.value = 5
			hp = healamount
			amessage2temp = "I'm dizzy."
			amessage3temp = "Mmm, thank you!"
			amessage5temp = "Almost as good as our usual pie"
			more_reactions = true
            global.usable = true
			}
            
			if argument0 == stringsetloc("Darkburger")
			{
            global.item_desc = stringsetloc("Heals 70HP")
            global.itemtarget = 1
            global.value = 70
			hp = 70
			amessage2temp = "Cooked to perfection."
			amessage3temp = "(A bit burned)"
			amessage5temp = "Did sans give you this?"
			more_reactions = false
            global.usable = true
			}

            if argument0 == stringsetloc("LancerCookie")
			{
            global.item_desc = stringsetloc("A cookie shaped like Lancer's face.Maybe not a cookie. Heals 1 HP?")
            global.itemtarget = 1
            global.value = 10
			hp = (global.chapter * 25)
			amessage2temp = "Mmm... face"
			amessage3temp = "(A little better)"
			amessage5temp = "Is it one of your friends?"
			more_reactions = false
            global.usable = true
			}

            if argument0 == stringsetloc("GigaSalad")
			{
            global.item_desc = stringsetloc("Heals 4HP")
            global.itemtarget = 1
            global.value = 10
			hp = 4
			amessage2temp = "Why this!?"
			amessage3temp = "Let's be healthy"
			amessage5temp = "A very healthy food"
			more_reactions = false
            global.usable = true
			}
            
			if argument0 == stringsetloc("ClubsSandwich")
			{
            global.item_desc = stringsetloc("A sandwich that can be split into 3.Heals 70 HP to the team.")
            global.itemtarget = 2
            global.value = 70
			hp = 70
			amessage2temp = "Quit hogging!"
			amessage3temp = "Perfectly cut"
			amessage5temp = "You can have the other part Kris."
			more_reactions = true
			
            global.usable = true
			}
 
            if argument0 == stringsetloc("HeartsDonut")
			{
            global.item_desc = stringsetloc("Healing varies")
            global.itemtarget = 1
            global.value = 40
			amessage2temp = "Mmm, blood!"
			amessage3temp = "Aah, sticky..."
			amessage5temp = "It seems out of an horror movie"
			more_reactions = false
			if global.party_order[selected_party_member] == "Susie" or global.party_order[selected_party_member] == "Ralsei" 
			{
			  hp = 80	
			}
            global.usable = true
			}
    
            if argument0 == stringsetloc("ChocDiamond")
			{
            global.item_desc = stringsetloc("Healing varies")
            global.itemtarget = 1
            global.value = 40
			amessage2temp = "THAT'S it?"
			amessage3temp = "Aah, thank you KRIS"
			amessage5temp = "(I don't really like chocolate)"
			more_reactions = false
			if global.party_order[selected_party_member] == "Toriel"
			{
			
			hp = random_range(0, 35)
			
			}
            global.usable = true
			}
     
            if argument0 == stringsetloc("Favwich")
			{
            global.item_desc = stringsetloc("Heals ALL HP")
            global.itemtarget = 1
            global.value = 10
			hp = 999
			amessage2temp = "(It's SO good!)"
			amessage3temp = "Kris....I"
			amessage5temp = "(Since when does Kris eat this?)"
			more_reactions = false
            global.usable = true
			}
      
            if argument0 == stringsetloc("RouxlsRoux")
			{
            global.item_desc = stringsetloc("Heals 50 HP")
            global.itemtarget = 1
            global.value = 50
			hp = 50
			amessage2temp = "Cool, it's wriggling."
			amessage3temp = "Yum, is this spaghetti?"
			amessage5temp = "Tastes like... jumprope?"
			more_reactions = false
            global.usable = true
			}
 
            if argument0 == stringsetloc("CD Bagel")
			{
            global.item_desc = stringsetloc("A bagel with a reflective inside.Makes music with each bite. +80HP")
            global.itemtarget = 1
            global.value = 100
			hp = 80
			amessage2temp = "It's got crunch."
			amessage3temp = "How elegant!"
			amessage5temp = "Classy"
			if eaten == true 
			{ //makes the sound play when eaten
			if global.party_order[selected_party_member] == "Kris"
			{snd_play(snd_cd_bagel_kris)}
			if global.party_order[selected_party_member] == "Susie"
			{snd_play(snd_cd_bagel_susie)}
			if global.party_order[selected_party_member] == "Ralsei"
			{snd_play(snd_cd_bagel_ralsei)}
			if global.party_order[selected_party_member] == "Toriel"
			{snd_play(snd_cd_bagel_kris)}
			}
			more_reactions = false
            global.usable = true
			}
 
            if argument0 == stringsetloc("Mannequin")
			{
            global.item_desc = stringsetloc("Useless")
            global.itemtarget = 0
            global.value = 300
            global.usable = false
			}
 
            if argument0 == stringsetloc("Kris Tea")
			{
            global.item_desc = stringsetloc("It's own-flavored tea.The flavor just says KRIS")
            global.itemtarget = 1
            global.value = 10
			amessage5temp = "I never felt this flavor"
			more_reactions = true
			if eaten == true
			{
			if global.party_order[selected_party_member] == "Kris"
			{amessage2temp = "No reaction?"
			 amessage3temp = "Uhm, Kris?"
			 amessage5temp = "Was it too bad?"
			}
			if global.party_order[selected_party_member] == "Susie"
			{
			amessage2temp = "Hell yeah, apple juice!!"
			amessage3temp = "Slow down Susie!"
			amessage5temp = "Is it really that good?"
			}
			if global.party_order[selected_party_member] == "Ralsei"
			{
			 amessage3temp = "Tastes like blueberries!"
			 amessage2temp = "Really?"
			 amessage5temp = "Is it really that good?"
			}
			}
			if eaten == true
			{
			if global.party_order[selected_party_member] == "Kris"
			{hp = 20}
			if global.party_order[selected_party_member] == "Susie"
			{hp = 120}
			if global.party_order[selected_party_member] == "Ralsei"
			{hp = 100}
			if global.party_order[selected_party_member] == "Toriel"
			{hp = 100}
			}
            global.usable = true
			}
 
            if argument0 == stringsetloc("Noelle Tea")
			{
            global.item_desc = stringsetloc("It's own-flavored tea.The flavor just says NOELLE")
            global.itemtarget = 1
            global.value = 10
			amessage2temp = "Hell yeah, eggnog!!"
			amessage3temp = "It's soft and sweet."
			amessage5temp = "It's very sweet"
			more_reactions = true
            global.usable = true
			}
 
            if argument0 == stringsetloc("Ralsei Tea")
			{
            global.item_desc = stringsetloc("It's own-flavored tea.The flavor just says RALSEI")
            global.itemtarget = 1
            global.value = 10
			amessage2temp = "Hey, it's like marshmallows!!"
			amessage3temp = "Um... isn't this water?"
			amessage5temp = "It's nice but i feel something else"
			more_reactions = true
            global.usable = true
			}


            if argument0 == stringsetloc("Susie Tea")
			{
            global.item_desc = stringsetloc("It's own-flavored tea.The flavor just says SUSIE")
            global.itemtarget = 1
            global.value = 10
			amessage2temp = "... this is tea?"
			amessage3temp = "Grape juice!"
			amessage5temp = "It smells strange but it's very good (There is a weird aftertaste)"
			more_reactions = true
            global.usable = true
			}
			
			if argument0 == stringsetloc("Toriel Tea")
			{
            global.item_desc = stringsetloc("It's own-flavored tea.The flavor just says TORIEL")
            global.itemtarget = 1
            global.value = 10
			amessage2temp = "It's burning!"
			amessage3temp = "Sweet"
			amessage5temp = "uhm...thanks for the water..."
			more_reactions = true
            global.usable = true
			}


            if argument0 == stringsetloc("DD-Burger")
			{
            global.item_desc = stringsetloc("A double burger that heals 60HP")
            global.itemtarget = 1
            global.value = 110
			hp = 60
			amessage2temp = "C'mon, gimme the rest!"
			amessage3temp = "M-maybe give Susie the rest?"
			amessage5temp = "It's too much for me"
			if eaten == true
			array_insert(global.items_dark,item_selected,"Darkburger") //this item is insert where the DDburger was when you eat it
            global.usable = true
			more_reactions = false
            replaceable = true //this is responsible for making it happen, normally it's off, you only need to write it into the item if it's true, remember to write the condition of what happened when eaten
			}


            if argument0 == stringsetloc("LightCandy")
			{
            global.item_desc = stringsetloc("White candy with a chalky texture.It'll recover 120HP.")
            global.itemtarget = 1
            global.value = 200
			hp = 120
			amessage2temp = "Hey, this rules!"
			amessage3temp = "Nice and chalky"
			amessage5temp = "Is this CHALK?"
			more_reactions = false
			if eaten
			if global.party_order[selected_member_equip] == "Kris"
			{
			amessage5temp = "KRIS! I told you to not eat chalk."
			}
            global.usable = true
			}
 
 
            if argument0 == stringsetloc("ButJuice")
			{
            global.item_desc = stringsetloc("It's short for ButlerJuice.It changes color with temperature.")
            global.itemtarget = 1
            global.value = 200
			hp = 100
			amessage2temp = "Hell'd you call this!?"
			amessage3temp = "I made this"
			amessage5temp = "(It became vermilion in my hands)"
			more_reactions = false
            global.usable = true
			}


            if argument0 == stringsetloc("SpagettiCode")
			{
            global.item_desc = stringsetloc("Spaghetti woven by master coders, made of macarons and ribbons. +30HP to all.")
            global.itemtarget = 2
            global.value = 180
			hp = 30
			amessage2temp = "Delicious"
			amessage3temp = "How sweet!"
			amessage5temp = "It's very confusing"
			more_reactions = true
            global.usable = true
			}


            if argument0 == stringsetloc("JavaCookie")
			{
            global.item_desc = stringsetloc("A cookie that says various words when eaten")
            global.itemtarget = 1
            global.value = 160
			amessage2temp = "It says GUTS!"
			amessage3temp = "It says Fluffy..."
			amessage5temp = "It says HOTness?"
			more_reactions = false
            global.usable = true
			}

            if argument0 == stringsetloc("TensionBit")
			{
            global.item_desc = stringsetloc("Raises TP 32%")
            global.itemtarget = 2
            global.value = 100
			amessage2temp = "What was THAT?!"
			amessage3temp = "I'm feeling a little nervous"
			amessage5temp = "Kris, what are you carrying?!"
			more_reactions = true
			text0 = "Try using it in BATTLE"
            global.usable = false
			}

            if argument0 == stringsetloc("TensionGem")
			{
            global.item_desc = stringsetloc("Raises TP by 50% in battle.")
            global.itemtarget = 2
            global.value = 300
			amessage2temp = "I'm feeling bad!"
			amessage3temp = "we will be okay, we will be okay"
			amessage5temp = "kris,please don't carry such things"
			more_reactions = true
			text0 = "Try using it in BATTLE"
            global.usable = false
			}

            if argument0 ==stringsetloc("TensionMax")
			{
            global.item_desc = stringsetloc("Raises TP by 100% in battle.")
            global.itemtarget = 2
            global.value = 1000
			amessage2temp = "PLEASE STOP!"
			amessage3temp = "everything is going to be okay, everything is going to be okay,everything is going to be okay,everything is going to be okay,everything is going to be okay,everything is going to be okay"
			amessage5temp = "what if we meet something very bad and...."
			more_reactions = true
			text0 = "Try using it in BATTLE"
            global.usable = false
			}
           
            
			if argument0 == stringsetloc("ReviveDust")
			{
            global.item_desc = stringsetloc("A minty powder that revives all fallen party members to 25% HP.")
            global.itemtarget = 2
            global.value = 100
			amessage2temp = "hey,don't throw dust at me"
			amessage3temp = "minty!"
			amessage5temp = "dust?...."
			more_reactions = true
            global.usable = true
			}


            if argument0 == stringsetloc("ReviveBrite")
			{
            global.item_desc = stringsetloc("Revives team 100%")
            global.itemtarget = 2
            global.value = 4000
			amessage2temp = "Don't throw mints at me!"
			amessage3temp = "minty!"
			amessage5temp = "mints?...."
			more_reactions = true
            global.usable = true
			}


            if argument0 == stringsetloc("S.POISON")
			{
            global.item_desc = stringsetloc("A strange concoction made of colorful squares. Will poison you.")
            global.itemtarget = 1
            global.value = 110
			hp = -50
			amessage2temp = "Ugh! ...tastes good?"
			amessage3temp = "Ow... er, thanks, Kris!"
			amessage5temp = "(I'll just...) oops, i'm sorry dear it slipped"
			more_reactions = false
			if eaten
			if global.party_order[selected_party_member] == "Toriel"
			{
				hp = 0
			}
			more_reactions = true
            global.usable = true
			}
            
            
			if argument0 == stringsetloc("DogDollar")
			{
            global.item_desc = stringsetloc("A dollar with a certain dog on it. Its global.value decreases each Chapter.")
            global.itemtarget = 0
            global.value = floor((200 / global.chapter))
			amessage2temp = "Fake money?"
			amessage3temp = "Where did you get this from?"
			amessage5temp = "What a funny dog"
			//these are actually unused, maybe i'll add an option/condition to make the reactions appear and the text after if people are interested.
			//the way is work is true the global.usable, if it's false it creates a textbox.
			more_reactions = true
            global.usable = false
			text0 = "It's a dollar with a dog on it"
	        text1 = "You feel like it will become important later on"
			//like this
			}
         
            if argument0 == stringsetloc("Water") //write the name
			{
            global.item_desc = stringsetloc("A cup of water.") //the description
            global.itemtarget = 1 // 0 if it creates a textbox, 1 if it targets just one person, and 2 if it targets the whole party (when using)
            global.value = 10 //This is the global.value for selling it in the shop 
			hp = 20 //The hp it heals
			amessage2temp = "Water?" //What Susie says
			amessage3temp = "Hydration is important" //What Ralsei says
			amessage5temp = "Thanks, Kris." //What toriel says (yeah i added toriel, i will make a video about adding party members )
			more_reactions = false //This is if there are more than one reaction active, normally this is just for item target 2, but for items like the tea then it used because they give multiple reactions.
            global.usable = true //This is another check to see if it creates the textbox 
			}
			
     //Make textboxes for not usable items
	 if keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter) 
	 if global.usable == false
	 {
	     if audio_is_playing(snd_power) {audio_stop_sound(snd_power)}
	     item_textbox(text0,text1,speaker_1,speaker_2,sound)
	 }
	 
    }




