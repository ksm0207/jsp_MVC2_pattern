
public class Example {

	public static void main(String[] args) {
		
	//	int float = 3.14f;
		
	//	float float1 = 3.14;
		short s = 'A';
	//	System.out.println(float);
	//	System.out.println(float1);
		System.out.println(s);
		
		long long_number = 10000L;
		System.out.println(long_number);
		
		for(int i=0; i< 5; i= i+2) {
			System.out.println(i);
		}
		String[][] seat = {{"김현호", "유승규", "고현진"},
						   {"이은주", "이하나", "황아름"}
						  };
		
		System.out.println(seat[1][2]);
		 int[] num = { new Integer(2), new Integer(4) };
		 for(int i=0; i< num.length; i ++) {
			 
			 System.out.println(num[i]);
		 }
		 
		 int i = 1 , j = 10;
		 
		 do {
			 if(i > j)
				 break;
			       // j = 10 , i = 1
			 j --; // j = 9, i= 2
			       // j = 8, i= 3
			       // j = 7, i= 4
			      //  j = 6, i= 5
		} while (++ i < 5);
		 System.out.println("i =" + i +" and j = "+ j);
		 
	}
}
