package com.lm.landmarker.galleryinfo.model.vo;

import java.sql.Date;

public class Galleryinfo implements java.io.Serializable{

	private static final long serialVersionUID = -2006978711794893472L;
	
	private int gallery_no;
	private int user_no;	
	private String gallery_content;
	private String photo_path;
	private String hashtag;
	private int gallery_readcount;
	private Date gallery_date;
	private String user_name;
	private String user_badge;
	
	public Galleryinfo() {}

	public Galleryinfo(int gallery_no, int user_no, String gallery_content, String photo_path, String hashtag,
			int gallery_readcount, Date gallery_date, String user_name, String user_badge) {
		super();
		this.gallery_no = gallery_no;
		this.user_no = user_no;
		this.gallery_content = gallery_content;
		this.photo_path = photo_path;
		this.hashtag = hashtag;
		this.gallery_readcount = gallery_readcount;
		this.gallery_date = gallery_date;
		this.user_name = user_name;
		this.user_badge = user_badge;
	}

	public int getGallery_no() {
		return gallery_no;
	}

	public void setGallery_no(int gallery_no) {
		this.gallery_no = gallery_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getGallery_content() {
		return gallery_content;
	}

	public void setGallery_content(String gallery_content) {
		this.gallery_content = gallery_content;
	}

	public String getPhoto_path() {
		return photo_path;
	}

	public void setPhoto_path(String photo_path) {
		this.photo_path = photo_path;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getGallery_readcount() {
		return gallery_readcount;
	}

	public void setGallery_readcount(int gallery_readcount) {
		this.gallery_readcount = gallery_readcount;
	}

	public Date getGallery_date() {
		return gallery_date;
	}

	public void setGallery_date(Date gallery_date) {
		this.gallery_date = gallery_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_badge() {
		return user_badge;
	}

	public void setUser_badge(String user_badge) {
		this.user_badge = user_badge;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Galleryinfo [gallery_no=" + gallery_no + ", user_no=" + user_no + ", gallery_content=" + gallery_content
				+ ", photo_path=" + photo_path + ", hashtag=" + hashtag + ", gallery_readcount=" + gallery_readcount
				+ ", gallery_date=" + gallery_date + ", user_name=" + user_name + ", user_badge=" + user_badge + "]";
	}

	
}
