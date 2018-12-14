package
{
	public class Judge
	{
		public static function hitCore(x1:int, y1:int, x2:int, y2:int):Boolean
		{
			var flg:int = 0;
			var i:int = 0;
			var ar:int = 10;
			
			if(x1-ar < x2 && x2 < x1+ar){
				flg += 1;
			}
			if(y1-ar < y2 && y2 < y1+ar){
				flg += 2;
			}
			for(i = 0; i < ar; i++){
				if((1 == (x1 - x2)/(y1 - y2 + i)) || (1 == (x1 - x2)/(y1 - y2 - i))){
					flg += 3;
				}
				if((-1 == (x1 - x2)/(y1 - y2 + i)) || (-1 == (x1 - x2)/(y1 - y2 - i))){
					flg += 4;
				}
			}
			if(flg != 0){
				return true;
			}
			return false;
		}
		
		public static function hitRoot(x1:int, y1:int, x2:int, y2:int):Boolean
		{
			var flg:int = 0;
			var ar:int = 4;
			
			if(x1-ar < x2 && x2 < x1+ar && y1-ar < y2 && y2 < y1+ar){
				flg += 1;
			}
			if(flg != 0){
				return true;
			}
			return false;
		}
		
		public static function crossRoot(x1:int, y1:int, x2:int, y2:int):Array
		{
			// 0,1    (a1, b1)   a1 = x1               , b1 = y2+x1-x2      1,2
			// 2,3    (a2, b2)   a2 = x1               , b2 = y2            1,3
			// 4,5    (a3, b3)   a3 = x1               , b2 = y2-x1+x2      1,4
			
			// 6,7    (a4, b4)   a4 = x2               , b4 = y1+x2-x1      2,1
			// 8,9    (a5, b5)   a5 = x1+y2-y1         , b5 = y2            2,3
			// 10,11  (a6, b6)   a6 = (x1+x2-y1+y2)/2  , b6 = y1+a6-x1      2,4
			
			// 12,13  (a7, b7)   a7 = x2               , b7 = y1            3,1
			// 14,15  (a8, b8)   a8 = x2+y1-y2         , b8 = y1            3,2
			// 16,17  (a9, b9)   a9 = x2-y1+y2         , b9 = y1            3,4
			
			// 18,19  (a10, b10) a10 = x2              , b10 = y1-x2+x1     4,1
			// 20,21  (a11, b11) a11 = (x2+x1-y2+y1)/2 , d11 = y2+a11-x2    4,2
			// 22,23  (a12, b12) a12 = x1-y2+y1        , b12 = y2           4,3
			
			var point:Array;
			point = new Array(23);
			
			
			point[0] = x1;               point[1] = y2+x1-x2;
			point[2] = x1;               point[3] = y2;
			point[4] = x1;               point[5] = y2-x1+x2;
			
			point[6] = x2;               point[7] = y1+x2-x1;
			point[8] = x1+y2-y2;         point[9] = y2;
			point[10] = (x1+x2-y1+y2)/2; point[11] = y1+point[10]-x1;
			
			point[12] = x2;              point[13] = y1;
			point[14] = x2+y1-y2;        point[15] = y1;
			point[16] = x2-y1+y2;        point[17] = y1;
			
			point[18] = x2;              point[19] = y1-x2+x1;
			point[20] = (x2+x1-y2+y1)/2; point[21] = y2+point[20]-x2;
			point[22] = x1-y2+y1;        point[23] = y2;
			
			return point;
		}
		
		public static function Distance(x1:int, y1:int, x2:int, y2:int, flg:int):int
		{
			var X:int = x2 - x1;
			var Y:int = y2 - y1;
			var pos:int;
			var dis:int;
			
			if(X >= 0 && Y >= 0){
				pos = 1;
			}
			if(X >= 0 && Y < 0){
				pos = 2;
			}
			if(X < 0 && Y < 0){
				pos = 3;
			}
			if(X < 0 && Y >= 0){
				pos = 4;
			}
			dis = Math.abs(Math.sqrt(X*X + Y*Y));
			
			if(flg == 0) return X;
			if(flg == 1) return Y;
			if(flg == 2) return pos;
			else return dis;
		}
		
		public static function inWindow(x:int, y:int):Boolean
		{
			var wx:int = 800;
			var wy:int = 600;
			var flg:int = 0;
			
			if(0 > x){
				flg = 1;
			}
			if(x > wx){
				flg = 2;
			}
			if(0 > y){
				flg = 3;
			}
			if(y > wy){
				flg = 4;
			}
			
			if(flg != 0){
				return false;
			}
			
			return true;
		}
	}
}