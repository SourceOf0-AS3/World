package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width=800, height=600, backgroundColor=0x000000)]

	public class World extends Sprite
	{
		private var lf:Life;
		private var cl:Closs;
		private var die:Life;
		private var lifes:Array;
		private var closs:Array;
		private var dead:Array;
		private var points:Array;
		private var id:int = 0;
		private var pare:int = -1;
		private var i:int = 0;
		private var j:int = 0;
		private var k:int = 0;
		private var l:int = 5;
		private var m:int = 0;
		private var n:int = 0;
		private var o:int = 0;
		 
		public function World()
		{
			lifes = new Array(0);
			closs = new Array(0);
			dead = new Array(0);
			points = new Array(0);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void{
			if(Judge.inWindow(e.stageX, e.stageY)){
				lf = new Life(e.stageX, e.stageY, id, -1, -1, -1);
				lf.x = e.stageX;
				lf.y = e.stageY;
				lifes.push(lf);
				addChild(lifes[i]);
				pare = i;
				i += 1;
				id += 1;
			}
			
			for(m = lifes.length - 2; m >= 0; m--){
				points = Judge.crossRoot(lifes[i-1].x, lifes[i-1].y, lifes[m].x, lifes[m].y);
//				if(pare == i-1){
//					for(n = 11; n >= 0; n--){
//						for(o = closs.length - 1; o >= 0; o--){
//							trace(n, o, Judge.hitRoot(points[2*n], points[2*n+1], closs[o].x, closs[o].y));
//							if(Judge.hitRoot(points[2*n], points[2*n+1], closs[o].x, closs[o].y)){
//								lf = new Life(points[2*n], points[2*n+1], id, id-1, closs[o].id1, closs[o].id2);
//								lf.x = points[2*n];
//								lf.y = points[2*n+1];
//								lf.scaleX += 2;
//								lf.scaleY += 2;
//								lifes.push(lf);
//								addChild(lifes[i]);
//								i += 1;
//								id += 1;
//							}
//						}
//					}
//				}
				for(n = 11; n >= 0; n--){
//					trace(n, i, Judge.inWindow(points[2*n], points[2*n+1]));
					if(Judge.inWindow(points[2*n], points[2*n+1])){
						cl = new Closs(lifes[i-1].id, lifes[m].id, points[2*n], points[2*n+1]);
						closs.push(cl);
					}
				}
			}
		}
		
		private function onEnterFrame(e:Event):void{
/*			if((i < 20)) {
				if(l == 0){
					l = 5;
					m = Math.random()*800
					n = Math.random()*600
					lf = new Life(m, n, id, -1, -1, -1);
					lf.x = m;
					lf.y = n;
					lifes.push(lf);
					addChild(lifes[i]);
					i += 1;
				}else{
					l -= 1;
				}
			}
*/			
			for(j = i-2; j >= 0; j--){
				if(Judge.hitCore(lifes[i-1].x, lifes[i-1].y, lifes[j].x, lifes[j].y)){
					i--;
					dead.push(lifes[j]);
					if(contains(lifes[j])) removeChild(lifes[j]);
					addChild(dead[dead.length - 1]);
					lifes.splice(j, 1);
				}
			}
			for(k = dead.length - 1; k >= 0; k--){
				if(dead[k].alpha > 0){
					dead[k].alpha -= 0.1;
				}
				else{
					removeChild(dead[k]);
					dead.splice(k, 1);
				}
			}
		}
	}
}
