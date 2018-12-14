package
{
	import flash.display.Sprite;

	public class Core extends Sprite
	{	
		public function Core(x:int, y:int, color:int)
		{
			graphics.beginFill(color);
//			graphics.drawCircle(0, 0, Math.random()*50);
			graphics.drawCircle(0, 0, 5);
			graphics.endFill();
		}
	}
}