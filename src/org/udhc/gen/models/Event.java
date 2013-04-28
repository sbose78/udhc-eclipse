package org.udhc.gen.models;

public class Event {

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPublisher_role() {
		return publisher_role;
	}
	public void setPublisher_role(int publisher_role) {
		this.publisher_role = publisher_role;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPatient_name() {
		return patient_name;
	}
	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}
	private int id;
	public Event(int id, int publisher_role, String publisher, 	String patient_name , String date,String event ) {
		this.id = id;
		this.date=date;
		this.publisher_role = publisher_role;
		this.publisher = publisher;
		this.patient_name = patient_name;
		this.event=event;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private int publisher_role;
	private String publisher;
	private String patient_name;
	private String date ;
	public String event;
}