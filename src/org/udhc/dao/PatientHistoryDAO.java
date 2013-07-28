package org.udhc.dao;

import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonObject;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.util.JSON;

public class PatientHistoryDAO {
	
	public boolean insert(HashMap<String,String> parameterMap)
	{
		try{

			DBCollection table= getMongoConnectionToCollection("history");
			JSONObject object = new JSONObject(parameterMap);
			DBObject dbObject = (DBObject)JSON.parse(object.toJSONString());		
			table.insert(dbObject);
			return true;

		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;		
	}
	
	public JSONArray fetch(String patient_name, String info_type){
		
		try{
			

			BasicDBObject searchQuery = new BasicDBObject();
			searchQuery.put("patient_name", patient_name);
			searchQuery.put("info_type", info_type);

			DBCollection table= getMongoConnectionToCollection("history");
			DBCursor cursor = table.find(searchQuery);		
			
			JSONArray jsonArray = new JSONArray();
		
			while( cursor.hasNext()){
				//System.out.println(cursor.next());
				String json_string = cursor.next().toString();
				 JSONObject jsonObject= new JSONObject();
				 BasicDBObject mongoJSONObject = ( BasicDBObject)JSON.parse(json_string);
				 Iterator<String> keys = mongoJSONObject.keySet().iterator();
				
				 while(keys.hasNext()){
					 String key = keys.next();
					 jsonObject.put(key,mongoJSONObject.get(key).toString());
					
				 }
				 jsonArray.add(jsonObject);
				 System.out.println(jsonObject);
				
				
				// return (JSONObject) JSON.parse(cursor.next().toString());
			}
			return jsonArray;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return new JSONArray();
	}
	
	public static DBCollection getMongoConnectionToCollection(String tableName){
		MongoClient mongo;
		DBCollection table=null;
		try {
			
			mongo = new MongoClient( "candidate.7.mongolayer.com" , 10014 );
			DB db = mongo.getDB("patient_summary");
			boolean auth = db.authenticate("sbose78", "sbose78".toCharArray());
		    table = db.getCollection(tableName);
			
		} 
		catch (UnknownHostException e) 
		{			
			e.printStackTrace();
		}
		
		return table;
		
	}
	
	public static void main(String args[]){
		PatientHistoryDAO dao = new PatientHistoryDAO();
		System.out.println("____"+dao.fetch("BRIDELIA RETUSA (L.) Spreng.", "surgeries"));
	}

}
