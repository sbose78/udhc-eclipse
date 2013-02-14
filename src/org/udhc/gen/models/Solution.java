package org.udhc.gen.models;

public class Solution {
	
	public int getSolution_id() {
		return solution_id;
	}


	public void setSolution_id(int solution_id) {
		this.solution_id = solution_id;
	}


	public int getTopic_id() {
		return topic_id;
	}


	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}


	public String getSolution_content() {
		return solution_content;
	}


	public void setSolution_content(String solution_content) {
		this.solution_content = solution_content;
	}


	public String getSolution_date() {
		return solution_date;
	}


	public void setSolution_date(String solution_date) {
		this.solution_date = solution_date;
	}


	public String getSolution_user() {
		return solution_user;
	}


	public void setSolution_user(String solution_user) {
		this.solution_user = solution_user;
	}


	public String getSolution_language() {
		return solution_language;
	}


	public void setSolution_language(String solution_language) {
		this.solution_language = solution_language;
	}


	public Solution(int solution_id, int topic_id, String solution_content,
			String solution_date, String solution_user, String solution_language) {
		
		this.solution_id = solution_id;
		this.topic_id = topic_id;
		this.solution_content = solution_content;
		this.solution_date = solution_date;
		this.solution_user = solution_user;
		this.solution_language = solution_language;
	}
	
	public Solution(int topic_id, String solution_content,
			String solution_date, String solution_user, String solution_language) {
		
	
		this.topic_id = topic_id;
		this.solution_content = solution_content;
		this.solution_date = solution_date;
		this.solution_user = solution_user;
		this.solution_language = solution_language;
	}


	public Solution() {
		// TODO Auto-generated constructor stub
	}


	private int solution_id;
	private int topic_id;
	private String solution_content;
	private String solution_date;
	private String solution_user;
	private String solution_language;
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
