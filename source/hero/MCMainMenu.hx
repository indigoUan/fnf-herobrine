package hero;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import openfl.Assets;
import flash.system.System;

class MCMainMenu extends MusicBeatState
{
    var texts:Array<String> = [
        '0.0.2 b',
        'by Untitled Funkers. Do not distribute!'
    ];

	public var bgCam:FlxCamera;
	public var camHUD:FlxCamera;

    var shitpost:String;
    var pseudofinalVar:Array<Dynamic> = [];
    var finalVar:String = '';

    // bitmap shits
    var menuBG:FlxSprite;

    // yellow shit
    var yellowShit:FlxText;
    var subyellowShit:FlxText;

    // button shits
    var storymode:FlxButton;
    var freeplay:FlxButton;
    var credits:FlxButton;
    var dis:FlxButton;
    var options:FlxButton;

    override function create()
    {
        /*DateTime dateValue = new DateTime(2008, 6, 11);
        Console.WriteLine(dateValue.ToString("ddd"));*/

        bgCam = new FlxCamera();
		bgCam.bgColor.alpha = 0;
		FlxG.cameras.add(bgCam);

		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;
		FlxG.cameras.add(camHUD);
        camHUD.zoom = 3;

        camHUD.y += 150;

        FlxG.mouse.visible = true;

        getShit();

        menuBG = new FlxSprite();
        menuBG.frames = Paths.getSparrowAtlas('menu/menuBG');
		menuBG.animation.addByPrefix('idle', 'anim', 30, true);
        menuBG.screenCenter();
        menuBG.scale.y = 1.05;
        menuBG.scale.x = 1.05;
        menuBG.antialiasing = true;
        menuBG.animation.play('idle', true);

        var fuckshit:String = 'minefunk';

        var chances:Int = 10000;

        if (FlxG.random.int(1, chances) == 1)
            fuckshit = 'minefuck';

        if (Date.now().getDay() == 2)
            fuckshit = 'chewsday';
        if (Date.now().getDay() == 5)
            fuckshit = 'funkin';

        if ((FlxG.random.int(1, chances) == 1) && fuckshit == 'funkin')
            fuckshit = 'fuckin';

        if (FlxG.random.int(1, 69420) == 1)
            fuckshit = 'ur mom';

        var menu:FlxSprite = new FlxSprite();
        menu.loadGraphic(Paths.image('menu/titles/' + fuckshit));
        menu.screenCenter();
        menu.y -= 240;
        menu.antialiasing = true;
        menu.scale.x = 0.9;
        menu.scale.y = 0.9;
        if (fuckshit == 'chewsday' || fuckshit == 'funkin' || fuckshit == 'fuckin'){
            menu.scale.x = 0.6;
            menu.scale.y = 0.6;}

        yellowShit = new FlxText(0, 0, 0, finalVar);
		yellowShit.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.YELLOW, CENTER);
        yellowShit.angle = -20;
        yellowShit.screenCenter();
        yellowShit.y -= 200;
        yellowShit.x += 300;

        subyellowShit = new FlxText(0, 0, 0, finalVar);
		subyellowShit.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.fromRGB(150,70,0), CENTER);
        subyellowShit.angle = -20;
        subyellowShit.screenCenter();
        subyellowShit.y -= 198;
        subyellowShit.x += 306;

        var shit = new FlxText(0, FlxG.height - 38, 1280, ' ' + texts[0]);
		shit.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, LEFT);
        shit.screenCenter(X);

        var shit2 = new FlxText(0, FlxG.height - 38, 1280, texts[1] + ' ');
		shit2.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, RIGHT);
        shit2.screenCenter(X);

        storymode = new FlxButton(0, 0, "Story Mode", function()
        {
            FlxG.sound.play(Paths.sound('minecraft_click'), 2);
            //FlxG.mouse.visible = false;
            MusicBeatState.switchState(new StoryMenuState());
        });
        storymode.screenCenter(X);
        storymode.y += 290;

        freeplay = new FlxButton(0, 0, "Freeplay", function()
        {
            FlxG.sound.play(Paths.sound('minecraft_click'), 2);
            //FlxG.mouse.visible = false;
            MusicBeatState.switchState(new FreeplayState());
        });
        freeplay.screenCenter(X);
        freeplay.y += 315;

        credits = new FlxButton(0, 0, "Credits", function()
        {
            FlxG.sound.play(Paths.sound('minecraft_click'), 2);
            //FlxG.mouse.visible = false;
            MusicBeatState.switchState(new CreditsState());
        });
        credits.screenCenter(X);
        credits.y += 340;

        dis = new FlxButton(0, 0, "Our Socials!", function() // I SEE YOU, KBH GAMES, I HAVE THE BALLS TO REPORT YOU, DON'T TEST ME 
        {
            FlxG.sound.play(Paths.sound('minecraft_click'), 2);
            CoolUtil.browserLoad('https://discord.gg/m6Rjg78yuS');
            CoolUtil.browserLoad('https://www.youtube.com/channel/UCFEwoWiZkeRkxTxDA9KeOFQ');
            CoolUtil.browserLoad('https://twitter.com/UntitledFunkers');
        });
        dis.screenCenter(X);
        dis.y += 365;

        options = new FlxButton(0, 0, "Options", function()
        {
            FlxG.sound.play(Paths.sound('minecraft_click'), 2);
            FlxG.mouse.visible = false;
            MusicBeatState.switchState(new OptionsState());
        });
        options.screenCenter(X);
        options.y += 390;

        menuBG.cameras = [bgCam];
        shit.cameras = [bgCam];
        shit2.cameras = [bgCam];
        subyellowShit.cameras = [bgCam];
        yellowShit.cameras = [bgCam];
        
		storymode.cameras = [camHUD];
        freeplay.cameras = [camHUD];
        credits.cameras = [camHUD];
        dis.cameras = [camHUD];
        options.cameras = [camHUD];

        // adds gay shit
        add(menuBG);
        add(menu);
        add(shit);
        add(shit2);
        add(subyellowShit);
        add(yellowShit);

        add(storymode);
        add(freeplay);
        add(credits);
        add(dis);
        add(options);

        fuckBump(0);

        trace ('lmao');
    }

    public function getShit()
    {
        finalVar = '';
        pseudofinalVar = [];

        var text:String = (Assets.getText(Paths.txt('MinecraftText')) + '\nHey guys, did you know that in terms of male human <> and female Pokémon breeding, Vaporeon <> is the most compatible Pokémon for humans? <> Not only are they in the field egg group, <> which is mostly comprised of mammals, <> Vaporeon are an average of 3”03’ tall <> and 63.9 pounds, this means they’re large <> enough to be able handle human dicks, <> and with their impressive Base Stats for HP and <> access to Acid Armor, you can be rough with one. <> Due to their mostly water based biology, <> there’s no doubt in my mind that an aroused <> Vaporeon would be incredibly wet, <> so wet that you could easily have sex <> with one for hours without getting sore. <> They can also learn the moves Attract, <> Baby-Doll Eyes, Captivate, Charm, <> and Tail Whip, along with not having <> fur to hide nipples, so it’d be incredibly <> easy for one to get you in the mood. <> With their abilities Water Absorb and Hydration, <> they can easily recover from fatigue with <> enough water. No other Pokémon comes <> close to such level of compatibility. <> Also, fun fact, if you pull out enough, <> you can make your Vaporeon turn white. <> Vaporeon is literally built for human dick. <> Ungodly defense stat+high HP pool+Acid Armor <> means it can take cock all day, <> all shapes and sizes and still come for more.' + '\nxdxd <> ' + Sys.environment()["USERNAME"]);
        var array:Array<String> = text.split('\n');
        shitpost = FlxG.random.getObject(array);
        #if html5 System.exit(0); #end
        pseudofinalVar = shitpost.split(' <> ');
        for (i in 0...pseudofinalVar.length){
            if (pseudofinalVar[i] == 'PLS ADOPT ME §!')
                pseudofinalVar[i] = 'PLS ADOPT ME ' + Sys.environment()["USERNAME"] + '!';

            finalVar += pseudofinalVar[i] + '\n';
        }
    }
    function fuckBump(key:Int = 0)
    {
        if (key == 0){
            FlxTween.tween(yellowShit.scale, {x: 1.1, y: 1.1}, 1, {
            onComplete: function(twn:FlxTween)
            { 
                fuckBump(1);
            }});
            FlxTween.tween(subyellowShit.scale, {x: 1.1, y: 1.1}, 1);
        }
        else{
            FlxTween.tween(yellowShit.scale, {x: 1, y: 1}, 1, {
            onComplete: function(twn:FlxTween)
            { 
                fuckBump(0);
            }});
            FlxTween.tween(subyellowShit.scale, {x: 1, y: 1}, 1);
        }
    }
}
