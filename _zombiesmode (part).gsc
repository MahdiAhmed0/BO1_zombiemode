
ai_calculate_health( round_number )
{
	if(level.gamemode == "snr" || level.gamemode == "gg")
	{
		return;
	}

	max_health = 100000;

	//odd rounds starting on 163 are insta kill rounds
	if(round_number >= 163)
	{
		//don't let players exploit NML
		if(is_true(flag("enter_nml")))
		{
			level.zombie_health = max_health;
		}
		else if(round_number % 2 == 1)
		{
			level.zombie_health = 150;
		}
		else
		{
			level.zombie_health = max_health;
		}
		return;
	}

	level.zombie_health = level.zombie_vars["zombie_health_start"];
	for ( i=2; i<=round_number; i++ )
	{
		// After round 10, get exponentially harder
		if( i >= 10 )
		{
			level.zombie_health += Int( level.zombie_health * level.zombie_vars["zombie_health_increase_multiplier"] );
		}
		else
		{
			level.zombie_health = Int( level.zombie_health + level.zombie_vars["zombie_health_increase"] );
		}

		//cap zombies health at 1 million
		if(level.zombie_health > max_health)
		{
			level.zombie_health = max_health;
			break;
		}
	}
}


// The above code is from Jbleezy. He did a wonderful job building BO1-Reimagined, and it's better code than mine!

// Mine is here



ai_calculate_health( round_number )
{
    level.zombie_health = level.zombie_vars["zombie_health_start"]; 
    for ( i=2; i<=round_number; i++ )
    {

        if( i >= 10 )
        {
            level.zombie_health += Int( level.zombie_health * level.zombie_vars["zombie_health_increase_multiplier"] ); 
        }
        else
        {
            level.zombie_health = Int( level.zombie_health + level.zombie_vars["zombie_health_increase"] ); 
        }
    }
}


// Developed by : Treyarch Programming team
 
// ---------------------------------------



ai_calculate_health( round_number )
{
    level.zombie_health = level.zombie_vars["zombie_health_start"]; 
    for ( i=2; i<=round_number; i++ )
    {

        if( i >= 10 )
        {
            level.zombie_health += Int( level.zombie_health * 0.10 ); 
        }
        else
        {
            level.zombie_health = Int( level.zombie_health + 100 ); 
        }
        if (level.zombie_health > 2147483647 || level.zombie_health < 0) {
            level.zombie_health = 2147483646; 
        }

    }
}

// Enhanced by : Fibonacci



// for BO1-Reimagined Credits.
/*
    Jbleezy - making the whole build
    ApexModder - perk bump sounds, assisted with localized strings, assisted with client scripting, assisted with menu scripting
    HitmanVere - sprint and dive animations for World at War weapons
    lilrifa - assisted with menu scripting
    MasadaDRM - assisted with weapons and sounds
    xSanchez78 - assisted with client scripting and localized strings
    Kody - Wunderwaffe gold camo, fixed CIA and CDC viewmodels, assisted with animations
    UltraZombieDino - Black Ops 3 P.E.S. model and animations, Black Ops 3 Gersh Device model, Black Ops 2 Ray Gun first raise and dry fire sounds, World at War marine models, assisted with World at War weapon models
    KagamineAddict - updated P.E.S. visor texture
    Joshwoocool - Black Ops 2 grief shock FX and meat FX
    Killer Potato - Call of Duty: WWII Stielhandgranate HUD icon
    Jerri13 - Black Ops 3 Gersh Device model
    KHEL MHO - assisted with Springfield chalk model
    ZeRoY - function list
    UGX - scripting reference
    SE2Dev - LinkerMod
    Nukem - LinkerMod
    DTZxPorter - Wraith
    Treyarch - Assets, source code, and an amazing base game
*/