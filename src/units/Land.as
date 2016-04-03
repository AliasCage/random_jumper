package units 
{
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author AliasCage
	 */
	public class Land extends MovieClip
	{
		[Embed(source = "../images/land.png")]
		private var DropArt:Class;
		[Embed(source = "../images/sky.png")]
		private var Sky:Class;
		
		public function Land() 
		{
			
		
			super();
			trace("Lnad init!")
			
			this.x = 500;
			this.y = 630;
			
			var sky:Bitmap = new Sky();
			sky.width = sky.width * 2.5;
			sky.height = sky.height * 2.5;
			sky.x = -sky.width / 2;
			sky.y = -(sky.height * 0.8);			
			this.addChild(sky);
						
			var player:Bitmap = new DropArt();
			player.width = player.width;
			player.height = player.height * 0.8;
			player.x = -player.width / 2;
			player.y = -(player.height * 0.7);			
			this.addChild(player);
		
			
		}
		
	}

}