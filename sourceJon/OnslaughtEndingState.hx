package;
import flixel.*;
import flixel.addons.ui.FlxUIText;
import Song.SwagSong;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * i took this code from pompom im sorry
 */
class OnslaughtEndingState extends FlxState
{
	public function new(goodEnding:Bool = true) 
	{
		super();
		
	}
	
	override public function create():Void 
	{
		super.create();
		var texty:FlxText;
		texty = new FlxUIText(532,550, 0, "");
		texty.setFormat("Arial", 30, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		var neverforget:FlxText;
		neverforget = new FlxUIText(208,342, 0, "");
		neverforget.setFormat("Arial",20,FlxColor.WHITE,FlxTextAlign.CENTER,FlxTextBorderStyle.OUTLINE,FlxColor.BLACK);
		neverforget.text = "https://drive.google.com/drive/folders/1ZuEJU_0WlaBBLxWhJ6EPhXLcRL7b1TTn?usp=sharing";
		FlxG.sound.playMusic(Paths.music("youcantrun"),0);
		//please dont look at this god awful code
		// ok i wont
		FlxG.sound.playMusic(Paths.music("oooh_scary"),1);
		new FlxTimer().start(4, function(deadTime:FlxTimer)
		{
			new FlxTimer().start(3, function(deadTime:FlxTimer)
			{
				add(texty);
				texty.text = "....";
				new FlxTimer().start(3, function(deadTime:FlxTimer)
				{
					texty.text = "alright, i see how it is";
					new FlxTimer().start(3, function(deadTime:FlxTimer)
					{
						texty.text = "you win, in this scenario";
						new FlxTimer().start(3, function(deadTime:FlxTimer)
						{
							texty.text = "i have no more tricks here";
							new FlxTimer().start(3, function(deadTime:FlxTimer)
							{
								texty.text = "all hope is lost for me";
								new FlxTimer().start(3, function(deadTime:FlxTimer)
								{
									texty.text = "....";
									new FlxTimer().start(3, function(deadTime:FlxTimer)
									{
										texty.text = "maybe ill see you again in the future";
										new FlxTimer().start(3, function(deadTime:FlxTimer)
										{
											texty.text = "actually, i know i will.";
											new FlxTimer().start(3, function(deadTime:FlxTimer)
											{
												texty.text = "be prepared.";
												new FlxTimer().start(3, function(deadTime:FlxTimer)
												{
													FlxG.sound.playMusic(Paths.music("ouch"),1);
													remove(texty);
													var end:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('bob/JANE', 'shared'));
													add(end);
													add(neverforget);
													new FlxTimer().start(3, function(deadTime:FlxTimer)
													{
														Sys.exit(0);
													});
												});
											});
										});
									});
								});
							});
						});
					});
				});
			});
		});
		
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
}