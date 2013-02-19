package org.udhc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.udhc.gen.DbCon;
import org.udhc.gen.HealthRecord;
import org.udhc.gen.models.Solution;

public class PHR {

	/**
	 * @param args
	 * @return 
	 */
	
	public static LinkedHashMap<Integer, Object> getPHR(String patient_name){
		
		ArrayList<HealthRecord> inputs= HealthRecord.getAllUploadedHealthRecordsByPatientName(patient_name);
		ArrayList<Solution> outputs = (new SolutionDAO()).getAllSolutions();
		
		int no_of_health_records= inputs.size();
		
		LinkedHashMap<Integer , Object> phr = new LinkedHashMap<Integer, Object>();
		
		
		for( HealthRecord input :inputs){
			
			int topic_id = Integer.parseInt(input.getTopic_id());
			HashMap<String, Object> props = new HashMap<String, Object>();
			
			props.put("upload_date", input.getDate());
			props.put("topic", input.getTopic() );
			
			ArrayList<Solution> solutions =new ArrayList<Solution>();
			
			for(Solution output: outputs){
				if( output.getTopic_id()==topic_id){
					solutions.add(output);
				}
			}
			
			props.put("solutions",solutions);
			
			phr.put(topic_id, props);
			
		}
		
			
		return phr;
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		HashMap<Integer, Object> phr = getPHR("EURYA-736146--ACUMINATA-DC.-");
		System.out.println(phr);

	}

}
