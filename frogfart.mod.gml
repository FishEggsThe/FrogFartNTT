#define init
	global.spr_fart = sprite_add("fartingonmyroommatesdoor_aaahhh.png",	5, 12, 12);
	global.spr_poo = sprite_add("poopoohahafunny.png",	4, 8, 7);
	global.spr_explosion = sprite_add("poopooexplosion.png",	6, 16, 16);
	
	global.snd_fart[0] = sound_add("farts/fart10.ogg");
	global.snd_fart[1] = sound_add("farts/fart1.ogg");
	global.snd_fart[2] = sound_add("farts/fart2.ogg");
	global.snd_fart[3] = sound_add("farts/fart3.ogg");
	global.snd_fart[4] = sound_add("farts/fart4.ogg");
	global.snd_fart[5] = sound_add("farts/fart5.ogg");
	global.snd_fart[6] = sound_add("farts/fart6.ogg");
	global.snd_fart[7] = sound_add("farts/fart7.ogg");
	global.snd_fart[8] = sound_add("farts/fart8.ogg");
	global.snd_fart[9] = sound_add("farts/fart9.ogg");

#define step
	with(instances_matching(Player, "race", "frog")){
		if "pooTime" not in self {pooTime = 0;}
		if "pooTimeReach" not in self {pooTimeReach = 60;}
		if(skill_get(5))
			pooTimeReach = 15;
			
		with(MeatExplosion){
			sprite_index = global.spr_explosion;
		}
		if(canspec){
			if(button_check(index, "spec")){
				pooTime++;
				if(pooTime % 5 == 0)
					sound_play(global.snd_fart[irandom_range(0, 9)]);
				frogcharge = -10;
				alarm3 = -10;
				speed = 4;
				with(instance_create(x, y, ToxicGas)){
					sprite_index = global.spr_fart;
					creator = other;
					team = other;
					direction = other.gunangle - 180 + random_range(-40, 40);
					speed = 2;
				}
			}
		}
		if (pooTime >= pooTimeReach){
			pooTime -= pooTimeReach;
			with(instance_create(x, y, BloodGrenade)){
				sprite_index = global.spr_poo;
				creator = other;
				team = 2;
				image_speed = 0;
				direction = other.gunangle - 180 random_range(-20, 20);
				speed = 10;
			}
		}
	}