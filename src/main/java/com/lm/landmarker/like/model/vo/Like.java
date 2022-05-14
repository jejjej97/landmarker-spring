package com.lm.landmarker.like.model.vo;
import java.sql.Date;

public class Like implements java.io.Serializable{

	private static final long serialVersionUID = 4217377168484831516L;
	
	private int user_no;
	private int gallery_no;	
	private String like_date;
	
	public Like() {}
	
	public Like(int user_no, int gallery_no, String like_date) {
		super();
		this.user_no = user_no;
		this.gallery_no = gallery_no;
		this.like_date = like_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getGallery_no() {
		return gallery_no;
	}

	public void setGallery_no(int gallery_no) {
		this.gallery_no = gallery_no;
	}

	public String getLike_date() {
		return like_date;
	}

	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}

	@Override
	public String toString() {
		return "Like [user_no=" + user_no + ", gallery_no=" + gallery_no + ", like_date=" + like_date + "]";
	}
	
	
	
	
}
