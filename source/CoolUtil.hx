package;

import flixel.FlxG;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
#if sys
import sys.io.File;
import sys.FileSystem;
#else
import openfl.utils.Assets;
#end
#if desktop
import sys.io.Process;
import sys.FileSystem;
#end

using StringTools;

class CoolUtil
{
	public static var programList:Array<String> = [
		'obs32',
		'obs64',
		'streamlabs obs',
		'bdcam',
		'fraps',
		'xsplit', // TIL c# program
		'hycam2', // hueh
		'twitchstudio' // why
	];

	public static var programListBot:Array<String> = [
		'FNFBot20',
		'FNFBot'
	];

	// [Difficulty name, Chart file suffix]
	public static var difficultyStuff:Array<Dynamic> = [
		['Peaceful', '-joke'],
		['Hard', ''],
		['Hardcore', '-hardcore-' + ClientPrefs.downScroll]
	];

	public static function difficultyString():String
	{
		return difficultyStuff[PlayState.storyDifficulty][0].toUpperCase();
	}

	public static function boundTo(value:Float, min:Float, max:Float):Float {
		var newValue:Float = value;
		if(newValue < min) newValue = min;
		else if(newValue > max) newValue = max;
		return newValue;
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = [];
		#if sys
		if(FileSystem.exists(path)) daList = File.getContent(path).trim().split('\n');
		#else
		if(Assets.exists(path)) daList = Assets.getText(path).trim().split('\n');
		#end

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}

	//uhhhh does this even work at all? i'm starting to doubt
	public static function precacheSound(sound:String, ?library:String = null):Void {
		if(!Assets.cache.hasSound(Paths.sound(sound, library))) {
			FlxG.sound.cache(Paths.sound(sound, library));
		}
	}

	public static function browserLoad(site:String) {
		#if linux
		Sys.command('/usr/bin/xdg-open', [site, "&"]);
		#else
		FlxG.openURL(site);
		#end
	}

	public static function parseGitHub(url:String)
	{
		var finalText:String = '';
		var unText:String = sys.Http.requestUrl(url);
		var text:Array<String> = unText.split('\n');

		for (i in 0...text.length - 1)
		{
			finalText = finalText + text[i];
		}

		if (unText == '')
			return '!no internet!';
		else
			return finalText;
	}

	public static function isRecording():Bool // thanks Jorge Sunspirit lol
	{
		#if windows
		var taskList:Process = new Process('tasklist', []);
		var readableList:String = taskList.stdout.readAll().toString().toLowerCase();
		var isOBS:Bool = false;

		for (i in 0...programList.length)
		{
			if (readableList.contains(programList[i]))
				isOBS = true;
		}

		taskList.close();
		readableList = '';

		return isOBS;
		#else
		return false;
		#end
	}

	public static function isBot():Bool
	{
		#if windows
		var taskList:Process = new Process('tasklist', []);
		var readableList:String = taskList.stdout.readAll().toString().toLowerCase();
		var isBOT:Bool = false;

		for (i in 0...programListBot.length)
		{
			if (readableList.contains(programListBot[i]))
				isBOT = true;
		}

		taskList.close();
		readableList = '';

		return isBOT;
		#else
		return false;
		#end
	}

	/*public static function rgbShit():FlxColor
	{
		var shit = FlxG.random.int(1, 3);
		switch (shit)
		{
			case 1:
				return fromRGB(255, 0, 0);
			case 2:
				return fromRGB(0, 255, 0);
			case 3:
				return fromRGB(0, 0, 255);
		}
	}*/
}
