package com.lm.landmarker.user.model.service;


import java.util.ArrayList;
import java.util.Map;

import com.lm.landmarker.banner.model.vo.Banner;
import com.lm.landmarker.gallery.model.vo.Gallery;
import com.lm.landmarker.galleryinfo.model.vo.Galleryinfo;
import com.lm.landmarker.galleryinfo.model.vo.Gallerylikeinfo;
import com.lm.landmarker.landmark.model.vo.Landmark;
import com.lm.landmarker.like.model.vo.Like;
import com.lm.landmarker.user.model.vo.User;

public interface UserService {

	int insertUser(User user);

	User selectUser(String user_email);

	User dupCheck(String email);
	
	// 송상언
	User selectUserInfo(int user_no);
	
	int boardCount(int user_no);
	
	int scrapCount(int user_no);

	ArrayList<Gallery> selectScrapList(int user_no);

	ArrayList<Gallery> selectMygallery(Map<String, Object> map);

	int updateUser(User user);

	int updateBadge(User user);

	int replyCount(int user_no);

	ArrayList<Landmark> landmarkSearch(String search);

	ArrayList<Banner> bannerList();

	int bannerDelete(int banner_no);

	int insertBanner(Banner banner);

	ArrayList<User> searchName(String name);

	ArrayList<User> userList();

	int updateLoginOK(User user);


	// 장고 로그인
	int insertLink(Map<String, String> map);
	
	int deleteKey(String link_key);
	
	int deleteDate();
	
	int selectLink(String link_key);

	void updateAdmin(User user);

	ArrayList<Galleryinfo> topWeekList();

	int gallery_count();

	ArrayList<Like> userLikeList(int user_no);

	ArrayList<Galleryinfo> new3List();
	
	ArrayList<Gallerylikeinfo> new3likeList(int user_no);

	void heartX(Map<String, Object> map);
	
	void heartO(Map<String, Object> map);

	ArrayList<Gallerylikeinfo> hotlikeList(int user_no);
}
