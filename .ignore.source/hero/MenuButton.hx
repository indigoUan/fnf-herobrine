package hero;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class MenuButton extends FlxSprite
{
    var suff1:String;
    var suff2:String;
    public var mainX:Int = 0;
    public var mainY:Int = 0;
    public var text:String = '';
    public var isMain:Bool = true;

    public var isOverlapping:Bool = false;
    var canClick:Bool = true;

    var bg:FlxSprite;

    public function new(inX:Int = 0, inY:Int = 0, text:String = '', ?isMain:Bool = true)
    {
        var mainsub:String = 'main';
        super();

        if (isMain)
            mainsub = 'main';

        trace ('uhhhhhhhhhhhhhhhhhh funni?');

        suff1 = 'menu/buttons/' + mainsub;
        suff2 = 'menu/buttons/' + mainsub + '-clicked';

        this.mainX = inX;
        this.mainY = inY;
        this.text = text;
        this.isMain = isMain;

        bg = new FlxSprite(0, 0, Paths.image(suff1));
        bg.x = mainX;
        bg.y = mainY;

        trace ('lmao wtf');
    }

    override function update(elapsed:Float)
    {
        if (!isOverlapping && canClick)
            loadGraphic(suff1);

        if (isOverlapping && FlxG.mouse.justPressed)
        {
            canClick = false;
            loadGraphic(suff2);
        }
    }
}