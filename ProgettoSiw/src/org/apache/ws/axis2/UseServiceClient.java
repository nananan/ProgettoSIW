package org.apache.ws.axis2;

import java.rmi.RemoteException;
import java.util.ArrayList;

import org.apache.axis2.AxisFault;
import org.apache.ws.axis2.OperatorClassStub.Calculate;

public class UseServiceClient {

	public UseServiceClient() {
	}

	public float calculateAVG(ArrayList<Float> valueArray) {
		
		try {

			float [] value = new float[valueArray.size()];
			
			for (int i = 0; i < valueArray.size(); i++)
				value[i] = valueArray.get(i);
			
			OperatorClassStub classStub;
				classStub = new OperatorClassStub();
	
			Calculate calculate0 = new Calculate();
			calculate0.setValue(value);
			
			float avg = classStub.calculate(calculate0).get_return();
			
			return avg;
		} catch (AxisFault e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} 
	
		return -1;
	}
}
