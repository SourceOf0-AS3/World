package
{
	import flash.display.Sprite;

	public class Life extends Sprite
	{
		public var c:Core;
		public var r1:Root;
		public var r2:Root;
		public var r3:Root;
		public var r4:Root;
		public var id:int;
		public var id1:int;
		public var id2:int;
		public var id3:int;
		public var color:int = Math.random()*0x0000FF + Math.random()*0xFF0000;
		
		public function Life(x:int, y:int, i:int, i1:int, i2:int, i3:int)
		{
			c = new Core(x, y, color);
			
			r1 = new Root(0, -y, 0, 600-y, color);
			r2 = new Root(-x, 0, 800-x, 0, color);
			r3 = new Root(-Math.min(x, y), -Math.min(x, y), Math.min(800-x, 600-y), Math.min(800-x, 600-y), color);
			r4 = new Root(Math.min(800-x, y), -Math.min(800-x, y), -Math.min(x, 600-y), Math.min(x, 600-y), color);
			
			id = i;
			id1 = i1;
			id2 = i2;
			id3 = i3;
			
			addChild(c);
			c.addChild(r1);
			c.addChild(r2);
			c.addChild(r3);
			c.addChild(r4);
		}
	}
}