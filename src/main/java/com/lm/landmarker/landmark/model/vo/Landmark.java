package com.lm.landmarker.landmark.model.vo;

public class Landmark implements java.io.Serializable{
	private static final long serialVersionUID = 4373007186503427247L;
	
	private int landmark_no;
	private String landmark_name;
	private String landmark_address;
	
	public Landmark() {}

	public Landmark(int landmark_no, String landmark_name, String landmark_address) {
		super();
		this.landmark_no = landmark_no;
		this.landmark_name = landmark_name;
		this.landmark_address = landmark_address;
	}

	public int getLandmark_no() {
		return landmark_no;
	}

	public void setLandmark_no(int landmark_no) {
		this.landmark_no = landmark_no;
	}

	public String getLandmark_name() {
		return landmark_name;
	}

	public void setLandmark_name(String landmark_name) {
		this.landmark_name = landmark_name;
	}

	public String getLandmark_address() {
		return landmark_address;
	}

	public void setLandmark_address(String landmark_address) {
		this.landmark_address = landmark_address;
	}

	@Override
	public String toString() {
		return "Landmark [landmark_no=" + landmark_no + ", landmark_name=" + landmark_name + ", landmark_address="
				+ landmark_address + "]";
	}
	
	
	
}
