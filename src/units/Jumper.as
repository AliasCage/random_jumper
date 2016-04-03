package units
{
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class Jumper extends MovieClip
	{
		private var xMov:Number = 0;
		private var yMov:Number = 0;
		private var jumpCount:Number = 0;
		private var maxCount:Number = 3;
		
		[Embed(source = "../images/jumper.png")]
		private var DropArt:Class;
		private var limit:Number = 475;
		
		public function Jumper()
		{
			super();
			trace("Jumper init!")
			
			this.x = 500;
			this.y = limit;
			
			var player:Bitmap = new DropArt();
			player.width = player.width * 0.33;
			player.height = player.height * 0.33;
			player.x = -player.width / 2;
			player.y = -(player.height * 0.7);
			this.addChild(player);
		}
		
		public function move():void
		{
			
			this.x += xMov;
			this.y += yMov;
			if (this.y < limit)
			{
				yMov += 2;
			}
			
			if (this.y > limit)
			{
				yMov = 0;
				jumpCount = 0;
				this.y = limit;
			}
			if (yMov == 0)
			{
				yMov *= -1;
			}
		}
		
		public function jump():void
		{
			if (jumpCount < maxCount) { 
				yMov = -25;
				jumpCount++;
			}		
		}
		
		public function inJump():Boolean
		{
			if (yMov != 0)
			{
				return true;
			}
			return false;
		
		}
	
	}
}