package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');
			case 'bf':
				var tex = Paths.getSparrowAtlas('BOYFRIEND','shared');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('hit', 'BF hit', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
				addOffset('hit', 16,19);

				playAnim('idle');

				flipX = true;
			case 'bf-spiked':
				frames = Paths.getSparrowAtlas('bob/BfSpiked');
				animation.addByPrefix('firstDeath', "BF idle dance", 24, false);
				animation.addByIndices('deathLoop', "BF idle dance", [44], "", 24, true);
				animation.addByIndices('deathConfirm', "BF idle dance", [44], "", 24, false);
				
				addOffset('firstDeath', 287,79);
				addOffset('deathLoop', 287, 79);
				addOffset('deathConfirm', 287,79);
				//playAnim('firstDeath');
				// pixel bullshit
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'glitched-bob':
				tex = Paths.getSparrowAtlas('bob/ScaryBobAaaaah');
				frames = tex;
				animation.addByPrefix('idle', "idle???-", 24, false);
				animation.addByPrefix('singUP', 'up', 24, false);
				animation.addByPrefix('singDOWN', 'down', 24, false);
				animation.addByPrefix('singLEFT', 'left', 24, false);
				animation.addByPrefix('singRIGHT', 'right', 24, false);

				addOffset('idle');
			case 'bob':
				tex = Paths.getSparrowAtlas('bob/bob_asset');
				frames = tex;
				animation.addByPrefix('idle', "bob_idle", 24, false);
				animation.addByPrefix('singUP', 'bob_UP', 24, false);
				animation.addByPrefix('singDOWN', 'bob_DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'bob_LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'bob_RIGHT', 24, false);

				addOffset('idle');

				flipX = true;

			case 'moonrise-bob':
				tex = Paths.getSparrowAtlas('halloween boo/bob');
				frames = tex;
				animation.addByPrefix('idle', "bob_idle", 24, false);
				animation.addByPrefix('singUP', 'bob_UP', 24, false);
				animation.addByPrefix('singDOWN', 'bob_DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'bob_LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'bob_RIGHT', 24, false);

				addOffset('idle');

				flipX = true;

			case 'gloop-bob':
				tex = Paths.getSparrowAtlas('bob/oohscary');
				frames = tex;
				animation.addByPrefix('idle', "bob_idle", 24, false);
				animation.addByPrefix('singUP', 'bob_UP', 24, false);
				animation.addByPrefix('singDOWN', 'bob_DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'bob_LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'bob_RIGHT', 24, false);
				animation.addByPrefix('Transform', 'bob_transform', 24, false);
	
				addOffset('idle');
	
				flipX = false;
				
			case 'angrybob':
				tex = Paths.getSparrowAtlas('bob/angrybob_asset');
				frames = tex;
				animation.addByPrefix('idle', "bob_idle", 24, false);
				animation.addByPrefix('singUP', 'bob_UP', 24, false);
				animation.addByPrefix('singDOWN', 'bob_DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'bob_RIGHT', 24, false);
				animation.addByPrefix('singRIGHT', 'bob_LEFT', 24, false);

				addOffset('idle');

				flipX = true;
			
			case 'hellbob':
				if (FlxG.save.data.happybob)
				{
					tex = Paths.getSparrowAtlas('bob/happy/hellbob_assets');
				}
				else
				{
					tex = Paths.getSparrowAtlas('bob/hellbob_assets');
				}
				frames = tex;
				animation.addByPrefix('idle', "bobismad", 24);
				animation.addByPrefix('singUP', 'lol', 24, false);
				animation.addByPrefix('singDOWN', 'lol', 24, false);
				animation.addByPrefix('singUPmiss', 'lol', 24);
				animation.addByPrefix('singDOWNmiss', 'lol', 24);

				//addOffset('idle', 0, 27);

				playAnim('idle');

				flipX = true;

			case 'oh-no':
				tex = Paths.getSparrowAtlas('halloween boo/jesus-fucking-christ');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Up', 24, false);
				animation.addByPrefix('singDOWN', 'Down', 24, false);
				animation.addByPrefix('singLEFT', 'Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Right', 24, false);

				addOffset('idle');
				addOffset("singUP", -120, 177);
				addOffset("singLEFT", -62, 0);
				addOffset("singRIGHT", -17, -29);
				addOffset("singDOWN", -84, -222);

				playAnim('idle');

			case 'ron':
				tex = Paths.getSparrowAtlas('bob/Tankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('cheer', 'Ugh', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("Ugh", 71, -40);

			case 'ronman':
				tex = Paths.getSparrowAtlas('halloween boo/ron');
				frames = tex;
				animation.addByPrefix('idle', "RON_idle", 24);
				animation.addByPrefix('idle-alt', "RON_mischievous_idle", 24);
				animation.addByPrefix('singUP', 'RONup', 24, false);
				animation.addByPrefix('singDOWN', 'RONdown', 24, false);
				animation.addByPrefix('singLEFT', 'RONleft', 24, false);
				animation.addByPrefix('singRIGHT', 'RONright', 24, false);
				animation.addByPrefix('hey', 'RON_dead', 24, false);
				addOffset('idle');
				addOffset('idle-alt', 17, -15);
				addOffset("singUP", 459, 999);
				addOffset("singLEFT", 217, 167);
				addOffset("singRIGHT", 48, -376);
				addOffset("singDOWN", 30, -116);
				addOffset('hey', 60, -389);

			case 'ronman-evil':
				tex = Paths.getSparrowAtlas('halloween boo/ron');
				frames = tex;
				animation.addByPrefix('idle', "RON_mischievous_idle", 24);
				animation.addByPrefix('singUP', 'RONup', 24, false);
				animation.addByPrefix('singDOWN', 'RONdown', 24, false);
				animation.addByPrefix('singLEFT', 'RONleft', 24, false);
				animation.addByPrefix('singRIGHT', 'RONright', 24, false);
				animation.addByPrefix('hey', 'RON_dead', 24, false);
				addOffset('idle', 17, -15);
				addOffset("singUP", 459, 999);
				addOffset("singLEFT", 217, 167);
				addOffset("singRIGHT", 48, -376);
				addOffset("singDOWN", 30, -116);
				addOffset('hey', 60, -389);

			case 'little-man':
					tex = Paths.getSparrowAtlas('Small_Guy');
					frames = tex;
					animation.addByPrefix('idle', "idle", 24);
					animation.addByPrefix('singUP', 'up', 24, false);
					animation.addByPrefix('singDOWN', 'down', 24, false);
					animation.addByPrefix('singLEFT', 'left', 24, false);
					animation.addByPrefix('singRIGHT', 'right', 24, false);
					addOffset('idle');
					addOffset("singUP", -10, 8);
					addOffset("singLEFT", -8, 0);
					addOffset("singRIGHT", 0, 2);
					addOffset("singDOWN", 0, -10);

			case 'little-man-2':
					tex = Paths.getSparrowAtlas('halloween boo/little-man');
					frames = tex;
					animation.addByPrefix('idle', "idle", 24);
					animation.addByPrefix('singUP', 'up', 24, false);
					animation.addByPrefix('singDOWN', 'down', 24, false);
					animation.addByPrefix('singLEFT', 'left', 24, false);
					animation.addByPrefix('singRIGHT', 'right', 24, false);
					addOffset('idle');
					addOffset("singUP", -10, 8);
					addOffset("singLEFT", -8, 0);
					addOffset("singRIGHT", 0, 2);
					addOffset("singDOWN", 0, -10);
			case 'pizza':
					tex = Paths.getSparrowAtlas('littleman/PizzaMan');
					frames = tex;
					animation.addByPrefix('idle', "PizzasHere", 29);
					animation.addByPrefix('fall', "PizzasHere", 29);
					animation.addByPrefix('singUP', 'Up', 29, false);
					animation.addByPrefix('singDOWN', 'Down', 29, false);
					animation.addByPrefix('singLEFT', 'Left', 29, false);
					animation.addByPrefix('singRIGHT', 'Right', 29, false);
					addOffset('idle');
			case 'tankman':
				tex = Paths.getSparrowAtlas('Tankman');
				frames = tex;
				animation.addByPrefix('idle', "Idle", 24);
				animation.addByPrefix('singUP', 'Sing Up', 24, false);
				animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
				animation.addByPrefix('singUP-alt', 'Ugh', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Sing Down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Sing Left', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Sing Right', 24, false);
				addOffset('idle');
				addOffset("singUP", 42, 38);
				addOffset("singLEFT", 98, -27);
				addOffset("singRIGHT", -89, -51);
				addOffset("singDOWN", 40, -120);
				addOffset("singUP-alt", 71, -40);
				addOffset("singLEFT-alt", 98, -27);
				addOffset("singRIGHT-alt", -89, -51);
				addOffset("singDOWN-alt", 40, -120);
			case 'placeholder-guy':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('halloween boo/placeholder-lad');
				frames = tex;
				animation.addByPrefix('idle', 'PlaceholderIdle', 24, false);
				animation.addByPrefix('singUP', 'PlaceholderUp', 24, false);
				animation.addByPrefix('singRIGHT', 'PlaceholderRight', 24, false);
				animation.addByPrefix('singDOWN', 'PlaceholderDown', 24, false);
				animation.addByPrefix('singLEFT', 'PlaceholderLeft', 24, false);
				animation.addByPrefix('Death', 'RIP_placeholderguy:pray:', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 21);
				addOffset("singRIGHT", -1, -25);
				addOffset("singLEFT", 101, -28);
				addOffset("singDOWN", 6, -42);
				addOffset("Death", 1200, 2000);

				playAnim('idle');
			case 'placeholder-guy-scared':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('halloween boo/placeholder-lad');
				frames = tex;
				animation.addByPrefix('idle', 'PlaceholderScaleIdle', 24, false);
				animation.addByPrefix('singUP', 'PlaceholderScaredUp', 24, false);
				animation.addByPrefix('singRIGHT', 'PlaceholderScaredRight', 24, false);
				animation.addByPrefix('singDOWN', 'PlaceholderScaredDown', 24, false);
				animation.addByPrefix('singLEFT', 'PlaceholderScaredLeft', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 21);
				addOffset("singRIGHT", -1, -25);
				addOffset("singLEFT", 101, -28);
				addOffset("singDOWN", 6, -42);

				playAnim('idle');
			case 'hand-guy':
				// ADA ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('halloween boo/placeholder-lad');
				frames = tex;
				animation.addByPrefix('idle', 'PlaceholderPossesedIdle', 24, true);
				animation.addByPrefix('singUP', 'PlaceholderPossesedUp', 24, false);
				animation.addByPrefix('singRIGHT', 'PlaceholderPossesedRight', 24, false);
				animation.addByPrefix('singDOWN', 'PlaceholderPossesedDown', 24, false);
				animation.addByPrefix('singLEFT', 'PlaceholderPossesedLeft', 24, false);

				addOffset('idle');
				addOffset("singUP", -35, 118);
				addOffset("singRIGHT", -34, -62);
				addOffset("singLEFT", 367, -54);
				addOffset("singDOWN", -31, -223);

				playAnim('idle');
			case 'gf-moonrise':
				// SPOOK ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('halloween boo/gf-moonrise');
				frames = tex;
				animation.addByPrefix('idle', 'ron little man boppin', 24, false);
				animation.addByPrefix('sad', 'ron little man missed', 24, false);

				addOffset('idle');
				addOffset('sad');

				playAnim('idle');
			case 'gf-ronman':
				// SPOOK ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('halloween boo/gf-ronman');
				frames = tex;
				animation.addByPrefix('idle', 'RON_boppin', 24, false);
				animation.addByPrefix('sad', 'RON_missed', 24, false);

				addOffset('idle');
				addOffset('sad');

				playAnim('idle');
			case 'gf-little-man-halloween':
				// IM STILL SUPER FUCKING SCARED
				tex = Paths.getSparrowAtlas('halloween boo/gf-little-man-halloween');
				frames = tex;
				animation.addByPrefix('idle', 'ron bob bop', 24, false);
				animation.addByPrefix('sad', 'ron bob missed', 24, false);
				animation.addByPrefix('dier', 'ron bob bob eye', 24, false);

				addOffset('idle');
				addOffset('sad');
				addOffset('dier');

				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR DANCING SHIT
	 */
	public function dance(alt:Bool = false)
	{
		if (!debugMode)
		{
			var fuckYou:String = alt ? '-alt' : '';
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight' + fuckYou, true);
						else
							playAnim('danceLeft' + fuckYou, true);
					}
				case 'hand-guy':
					playAnim('idle' + fuckYou, false);
				default:
					playAnim('idle' + fuckYou, true);
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);
		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}