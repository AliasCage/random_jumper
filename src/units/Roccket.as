package units
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class Roccket extends MovieClip
	{
		public var xMov:Number = 0;
		private var yMov:Number = 0;
		public var points:Number = 0;
		
		[Embed(source = "../images/rocket.png")]
		private var RocketImg:Class;
		private var rocket:Bitmap;
		
		[Embed(source = "../images/bang.png")]
		private var BangImg:Class;
		private var bang:Bitmap = new BangImg();
		
		public function Roccket()
		{
			super();
			trace("Rocket init!")
			
			this.x = 1500;
			this.y = 465;
			
			rocket = new RocketImg();
			rocket.width = rocket.width * 1;
			rocket.height = rocket.height * 1;
			rocket.x = -rocket.width / 3;
			rocket.y = -(rocket.height * 0.7);
			this.addChild(rocket);
			
			bang.width = bang.width * 0.2;
			bang.height = bang.height * 0.2;
			bang.x = -rocket.width / 3;
			bang.y = -(rocket.height * 3);
			bang.visible = false;
			this.addChild(bang);
		}
		
		public function start():void {
			xMov = 17;
			this.x = 1500;
			points = 0;
			rocket.visible = true;
			bang.visible = false;
		}
		
		
		public function bigBang():void {
			xMov = 0;
			rocket.visible = false;
			bang.visible = true;
		}
		
		public function isBang():Boolean {
			return xMov==0;
		}
		
		public function move():void
		{			
			this.x -= xMov;
				
			if (this.x < -300)
			{
				yMov = 0;
				points++;
				this.x = 1500;
				if (points > 5 && points < 13) {
					xMov ++;					
				}
				if (points > 15 && points < 20) {
					xMov +=0.5;
				}
				if (points > 20) {
					xMov +=0.2;
				}
				
			}	
			
		}
	
	}

}