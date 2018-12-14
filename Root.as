package
{
	import flash.display.Sprite;
	
	public class Root extends Sprite
	{
		public function Root(x1:int, y1:int, x2:int, y2:int, color:int)
		{
//			graphics.lineStyle(Math.random()*15,color);
			graphics.lineStyle(1,color);
			graphics.moveTo(x1, y1)
			graphics.lineTo(x2, y2);
		}
	}
}