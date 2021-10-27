package hero;

import editors.MasterEditorMenu;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.addons.transition.FlxTransitionableState;
import openfl.utils.Assets as OpenFlAssets;

class MCTitleScreen extends MusicBeatState
{
    override function create()
    {
        FlxTransitionableState.skipNextTransIn = true;
        FlxTransitionableState.skipNextTransOut = true;

        var menu:FlxSprite = new FlxSprite();
        menu.loadGraphic(Paths.image('menu/loading'));
        menu.screenCenter();
        menu.animation.play('idle', true);

        var bgRed:FlxSprite = new FlxSprite(-1050, 0).makeGraphic(1280, 720, 0xFFFF2700);

        add(bgRed);
        add(menu);

        FlxTween.tween(bgRed, {x: -230}, 4,
        {
            onComplete: function(twn:FlxTween)
            {
                MusicBeatState.switchState(new hero.MCMainMenu());
            }
        });

        if (OpenFlAssets.exists(Paths.txt('update key'))) {
            Global.unlocked = true;
            trace ("it's unlocked"); } else
            trace ("it's not unlocked");

        Global.getFile();

		//MusicBeatState.switchState(new editors.MasterEditorMenu());
    }
}