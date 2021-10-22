package hero;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

class BattleEvents extends FlxSprite
{
    var tweenalpha:Float = 0;
    var ranks:Array<FlxColor> = [
        FlxColor.BLUE,
        FlxColor.GREEN,
        FlxColor.YELLOW,
        FlxColor.ORANGE,
        FlxColor.RED
    ];
    public function new()
    {
        super();

        new FlxSprite(0, 0);
        loadGraphic(Paths.image('warning1'));
        screenCenter();
        antialiasing = true;
        alpha = 0;
        tweenalpha = 0;
    }

    public function callNew(rank:Int)
    {
        if (rank <= 4)
        {
            loadGraphic(Paths.image('warning' + FlxG.random.int(1, 2)));
            FlxG.sound.play(Paths.sound('warn'), 20);
            alpha = 1;
            tweenalpha = 1;
            color = ranks[rank];
        }
        else if (rank == 5)
            PlayState.callLightning();
        else
            callNew(0);
    }
}