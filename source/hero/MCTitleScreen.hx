package hero;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;

class MCTitleScreen extends MusicBeatState
{
    override function create()
    {
        var menu:FlxSprite = new FlxSprite();
        menu.loadGraphic(Paths.image('menu/loading'));
        menu.screenCenter();
        menu.animation.play('idle', true);

        var bgRed:FlxSprite = new FlxSprite(-1050, 0).makeGraphic(1280, 720, 0xFFFF2700);

        add(bgRed);
        add(menu);

        FlxTween.tween(bgRed, {x: 230}, 6,
        {
            onComplete: function(twn:FlxTween)
            {
                MusicBeatState.switchState(new hero.MCMainMenu());
            }
        });
    }
}