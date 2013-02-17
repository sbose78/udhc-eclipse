package org.udhc.gen.models;

public class Doctor {
	
	public int getDoctor_id() {
		return doctor_id;
	}



	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}



	public String getDoctor_name() {
		return doctor_name;
	}



	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}



	public String getDoctor_email() {
		return doctor_email;
	}



	public void setDoctor_email(String doctor_email) {
		this.doctor_email = doctor_email;
	}



	public String getDoctor_about() {
		return doctor_about;
	}



	public void setDoctor_about(String doctor_about) {
		this.doctor_about = doctor_about;
	}



	public String getDoctor_dp() {
		return doctor_dp;
	}



	public void setDoctor_dp(String doctor_dp) {
		this.doctor_dp = doctor_dp;
	}



	private String doctor_name;
	

	private String doctor_email;
	private String doctor_about;
	private String doctor_dp;
	private int doctor_id;

	private String doctor_date;
	public Doctor(String doctor_name, String doctor_email, String doctor_about,
			String doctor_dp, int doctor_id, String doctor_date) {
		this.doctor_name = doctor_name;
		this.doctor_email = doctor_email;
		this.doctor_about = doctor_about;
		this.doctor_dp = doctor_dp;
		this.doctor_id = doctor_id;
		this.doctor_date = doctor_date;
	}

	

	public Doctor(String doctor_name, String doctor_email, String doctor_about,
			String doctor_dp, int doctor_id) {
		this.doctor_name = doctor_name;
		this.doctor_email = doctor_email;
		this.doctor_about = doctor_about;
		this.doctor_dp = doctor_dp;
		this.doctor_id = doctor_id;
	}



	public Doctor(String doctor_name, String doctor_email, String doctor_about,
			String doctor_dp) {
		this.doctor_name = doctor_name;
		this.doctor_email = doctor_email;
		this.doctor_about = doctor_about;
		this.doctor_dp = doctor_dp;
		this.doctor_id = doctor_id;
	}


	
	
	public Doctor() {
		// TODO Auto-generated constructor stub
	}



	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
