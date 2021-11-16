package;

import flixel.FlxG;

class Global
{
    public static var unlocked:Bool = false;
    public static var isRec:Bool = false;
    public static var isBot:Bool = false;
    public static var gay:Array<Array<Int>> = [];

    public static function getFile()
    {
        var midArr:Array<Int> = [];
        var mainArr = CoolUtil.coolTextFile(Paths.txt('RGB Colors'));
        for (i in 0...mainArr.length)
        {
            var subArr = mainArr[i].split(' ');
            midArr = [Std.parseInt(subArr[0]), Std.parseInt(subArr[1]), Std.parseInt(subArr[2])];
            gay.push(midArr);
        }
    }
}
