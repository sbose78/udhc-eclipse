package org.udhc.models;

public class Patient {
	
	
	public int getPatient_id() {
		return patient_id;
	}


	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}


	public String getPatient_name() {
		return patient_name;
	}


	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}


	public String getSocial_worker_id() {
		return social_worker_id;
	}


	public void setSocial_worker_id(String social_worker_id) {
		this.social_worker_id = social_worker_id;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getWeight() {
		return weight;
	}


	public void setWeight(String weight) {
		this.weight = weight;
	}


	public Patient(String patient_name,
			String social_worker_id, String sex, String age, String weight, String date_of_joining) {
		this.patient_id = patient_id;
		this.patient_name = patient_name;
		this.social_worker_id = social_worker_id;
		this.sex = sex;
		this.age = age;
		this.weight = weight;
		this.date_of_joining=date_of_joining;
		
	}


	public Patient(int patient_id, String patient_name,
			String social_worker_id, String sex, String age, String weight,
			String date_of_joining) {
		this.patient_id = patient_id;
		this.patient_name = patient_name;
		this.social_worker_id = social_worker_id;
		this.sex = sex;
		this.age = age;
		this.weight = weight;
		this.date_of_joining = date_of_joining;
	}


	public Patient() {
		// TODO Auto-generated constructor stub
	}


	private int patient_id;
	private String patient_name;
	private String social_worker_id;
	private String sex;
	private String age;
	private String weight;
	private String date_of_joining;
	

	public String getDate_of_joining() {
		return date_of_joining;
	}


	public void setDate_of_joining(String date_of_joining) {
		this.date_of_joining = date_of_joining;
	}


	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
