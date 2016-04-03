package units
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class Button extends MovieClip
	{
		private var circle:Shape;
		public var i:Number = 0;
		private var bestScore: Number = 17;
		
		[Embed(source = "../images/menu.png")]
		private var MenuImg:Class;
		public var menu:Bitmap;
		
		[Embed(source = "../font/ROBOTO-REGULAR.TTF",
			fontName = "myFont",
			mimeType = "application/x-font",
			advancedAntiAliasing="true",
			embedAsCFF="false")]
		private var myEmbeddedFont:Class;
		private var label:TextField;
		private var best:TextField;
		
		public function Button()
		{
			circle = new Shape;
			circle.graphics.beginFill(0xcf50057, 1);
			circle.graphics.drawCircle(0, 0, 40);
			this.addChild(circle);
			this.y = 500;
			this.x = 800;
			
			menu = new MenuImg();
			menu.height = menu.height * 0.7;
			menu.width = menu.width * 0.7;
			menu.alpha = 0.5;
			menu.x = -menu.width / 2;
			menu.y = -(menu.height * 0.5);
			this.addChild(menu);
			
			label = new TextField();
			label.width = 400;			
			var format:TextFormat = new TextFormat("myFont");
			format.size = 40;
			format.color = 0xfce4ec;
						
			label.defaultTextFormat = format;
			label.embedFonts = true;
			label.x = -250;
			label.y = -150;
			label.text = "Press Jump to start"
			
			this.addChild(label);
			
			
			best = new TextField();
			best.width = 800;
			best.defaultTextFormat = format;
			best.embedFonts = true;
			best.x = -250;
			best.y = -200;
			best.visible = false;
			this.addChild(best);
			
		}
		
		public function move():void
		{			
			if (i > 6 && Math.random() < 0.01)
			{
				this.x = uint(Math.random() * 1000);
				this.y = uint(Math.random() * 600);
				var myColorTransform:ColorTransform = new ColorTransform();
				myColorTransform.color = 0xcf50057;
				circle.transform.colorTransform = myColorTransform;
			}
			
		}
		
		public function refresh():void
		{			
			i = 3;
		}
		
		public function setScore(score:Number):void {
			if (this.y < 300) {
				label.y = 50;
				best.y = 100;
			}else {
				label.y = -150;
				best.y = -200;				
			}
			if (this.x > 500) {
				best.x = -250;
				label.x = -250;
			}else {
				best.x = 50;
				label.x = 50;
			}
			best.visible = true;
			if (score >= bestScore) {
				best.text = "New record!!!";
				bestScore = score;
			} else {
				best.text = "Best score:" + bestScore.toString();
			}
			label.visible = true;
			label.text = "Your score: " + score.toString();
		}
		
		public function clickFnc(e:MouseEvent):void {
			i++;
			menu.visible = false;
			label.visible = false;
			best.visible = false;
		}
		
		public function up(e:MouseEvent):void
		{
			var myColorTransform:ColorTransform = new ColorTransform();
			myColorTransform.color = 0xcf50057;
			circle.transform.colorTransform = myColorTransform;
		}
		
		public function down(e:MouseEvent):void
		{
			var myColorTransform:ColorTransform = new ColorTransform();
			myColorTransform.color = 0xc51162;
			circle.transform.colorTransform = myColorTransform;
		}
	}

}