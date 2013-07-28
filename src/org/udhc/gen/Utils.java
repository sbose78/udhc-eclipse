package org.udhc.gen;

import java.io.IOException;
import java.util.Properties;

public class Utils {
	
	public static String getValue(String name){
		
		Properties properties = new Properties();
        try {
        	System.out.println("getting value");
			properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("credentials.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
        String myds=properties.getProperty(name).toString();
       
		return myds;
				
	}

}
