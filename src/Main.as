package
{
	import flash.display.Bitmap;
	import flash.display.FrameLabel;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import units.Button;
	import units.Jumper;
	import units.Land;
	import units.Roccket;
	
	/**
	 * ...
	 * @author AliasCage
	 */
	public class Main extends Sprite
	{
		private var player:Jumper;
		private var btn:Button;
		private var rock:Roccket;
		private var label:TextField;
		
		[Embed(source = "font/ROBOTO-REGULAR.TTF",
			fontName = "myFont",
			mimeType = "application/x-font",
			advancedAntiAliasing="true",
			embedAsCFF="false")]
		private var myEmbeddedFont:Class;
		
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			btn.addEventListener(MouseEvent.CLICK, clickFnc);
			btn.addEventListener(MouseEvent.CLICK, btn.clickFnc);
			btn.addEventListener(MouseEvent.MOUSE_DOWN, btn.down);
			btn.addEventListener(MouseEvent.MOUSE_UP, btn.up);
			
			stage.addEventListener(Event.ENTER_FRAME, mainFunc);
		
		}
		
		private function mainFunc(e:Event):void
		{
			label.text = "Score: " + rock.points.toString();
			player.move();
			rock.move();
			if(!rock.isBang()){
				btn.move();
			}
			
			if (player.hitTestPoint(rock.x, rock.y, true)) {
				trace("Death");
				rock.bigBang();
				btn.menu.visible = true;
				btn.setScore(rock.points);
			}
			
			if (player.inJump() && rock.x > 1300) {
				rock.y = player.y;
			} else if (rock.x > 1300) {
				rock.y = 465;
			}
		
		}
		
		private var level:Number = 1;
		private function clickFnc(e:MouseEvent):void
		{		
			if (rock.isBang()) {				
				rock.start();
				if (level != 1) {
					btn.refresh();
				}
				level++;	
				
			} else {				
				player.jump();
			}
			
			if (level == 8 || level == 11) {
				rock.xMov += 5;	
			}
			if (level == 15) {
				rock.xMov += 8;	
			}
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			trace("Initi");
			player = new Jumper();
			btn = new Button();
			rock = new Roccket();
			
			label = new TextField();
			label.width = 200;			
			var format:TextFormat = new TextFormat("myFont");
			format.size = 25;
			label.defaultTextFormat = format;
			label.embedFonts = true;		
			
			stage.addChild(new Land());
			stage.addChild(player);
			stage.addChild(rock);
			
			stage.addChild(label);
			stage.addChild(btn);
		}
	
	}

}