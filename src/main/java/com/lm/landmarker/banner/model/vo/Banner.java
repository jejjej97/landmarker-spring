package com.lm.landmarker.banner.model.vo;

public class Banner implements java.io.Serializable{
	private static final long serialVersionUID = -6482323136334248718L;

	private int banner_no;
	private String banner_title;
	private String banner_content;
	private String user_admin;
	private String photo_path;
	private String align;
	
	public Banner() {};
	
	public Banner(int banner_no, String banner_title, String banner_content, String user_admin, String photo_path,
			String align) {
		super();
		this.banner_no = banner_no;
		this.banner_title = banner_title;
		this.banner_content = banner_content;
		this.user_admin = user_admin;
		this.photo_path = photo_path;
		this.align = align;
	}

	public int getBanner_no() {
		return banner_no;
	}

	public void setBanner_no(int banner_no) {
		this.banner_no = banner_no;
	}

	public String getBanner_title() {
		return banner_title;
	}

	public void setBanner_title(String banner_title) {
		this.banner_title = banner_title;
	}

	public String getBanner_content() {
		return banner_content;
	}

	public void setBanner_content(String banner_content) {
		this.banner_content = banner_content;
	}

	public String getUser_admin() {
		return user_admin;
	}

	public void setUser_admin(String user_admin) {
		this.user_admin = user_admin;
	}

	public String getPhoto_path() {
		return photo_path;
	}

	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Banner [banner_no=" + banner_no + ", banner_title=" + banner_title + ", banner_content="
				+ banner_content + ", user_admin=" + user_admin + ", photo_path=" + photo_path + ", align=" + align
				+ "]";
	}
	
	
	
}
