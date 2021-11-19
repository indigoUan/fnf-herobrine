package;

import flixel.FlxG;

class Global
{
    public static var unlocked:Bool = false;
    public static var gay:Array<Array<Int>> = [
        /*[255, 0, 0],
        [255, 255, 0],
        [0, 255, 0],
        [0, 255, 255],
        [0, 0, 255],
        [255, 0, 255]*/
    ];

    public static function getFile()
    {
        // gay = [];
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
