import java.util.ArrayList;


public class OperatorClass {

//	public int calculate(int value[], int lenght) {
//		
//		int sum = 0;
//		int num = lenght;
//		
//		for (Integer v : value)
//			sum += v;
//		
//		return sum/num;
//		
//	}
	
	public float calculate(float[] value) {
		
		float sum = 0;
		float num = value.length;
		
		for (Float v : value)
			sum += v;
		
		return sum/num;
		
	}
	
}
