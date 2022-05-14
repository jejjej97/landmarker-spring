package com.lm.landmarker.user.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lm.landmarker.banner.model.vo.Banner;
import com.lm.landmarker.gallery.model.vo.Gallery;
import com.lm.landmarker.galleryinfo.model.vo.Galleryinfo;
import com.lm.landmarker.galleryinfo.model.vo.Gallerylikeinfo;
import com.lm.landmarker.landmark.model.vo.Landmark;
import com.lm.landmarker.like.model.vo.Like;
import com.lm.landmarker.user.model.dao.UserDao;
import com.lm.landmarker.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User dupCheck(String email) {
		return userDao.dupCheck(email);
	}
	
	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}
	
	@Override
	public User selectUser(String user_email) {
		return userDao.selectUser(user_email);
	}

	@Override
	public User selectUserInfo(int user_no) {		
		return userDao.selectUserInfo(user_no);
	}

	@Override
	public int boardCount(int user_no) {

		return userDao.boardCount(user_no);
	}

	@Override
	public int scrapCount(int user_no) {
		return userDao.scrapCount(user_no);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public ArrayList<Gallery> selectScrapList(int user_no) {
		return userDao.selectScrapList(user_no);
	}

	@Override
	public ArrayList<Gallery> selectMygallery(Map<String, Object> map) {	
		return userDao.selectMygallery(map);
	}

	@Override
	public int updateBadge(User user) {
		// TODO Auto-generated method stub
		return userDao.updateBadge(user);
	}

	@Override
	public int replyCount(int user_no) {
		return userDao.replyCount(user_no);
	}

	@Override
	public ArrayList<Landmark> landmarkSearch(String search) {
		return userDao.landmarkSearch(search);
	}

	@Override
	public ArrayList<Banner> bannerList() {
		return userDao.bannerList();
	}

	@Override
	public int bannerDelete(int banner_no) {
		return userDao.bannerDelete(banner_no);
	}

	@Override
	public int insertBanner(Banner banner) {
		return userDao.bannerInsert(banner);
	}

	@Override
	public ArrayList<User> searchName(String name) {		
		return userDao.searchName(name);
	}

	@Override
	public ArrayList<User> userList() {
		return userDao.selectUserList();
	}

	@Override
	public int updateLoginOK(User user) {
		return userDao.updateLoginOK(user);
	}


	// 장고 로그인
	@Override
	public int insertLink(Map<String, String> map) {
		return userDao.insertLink(map);
	}

	@Override
	public int deleteKey(String link_key) {
		return userDao.deleteKey(link_key);
	}

	@Override
	public int deleteDate() {
		return userDao.deleteDate();
	}

	@Override
	public int selectLink(String link_key) {
		return userDao.selectLink(link_key);
	}

	@Override
	public void updateAdmin(User user) {
		userDao.updateAdmin(user);
		
	}

	

	@Override
	public ArrayList<Galleryinfo> topWeekList() {
		return userDao.topWeekList();
	}

	@Override
	public int gallery_count() {
		return userDao.galleryCount();
	}

	@Override
	public ArrayList<Like> userLikeList(int user_no) {
		return userDao.userLikeList(user_no);
	}

	@Override
	public ArrayList<Galleryinfo> new3List() {
		return userDao.new3List();
	}

	@Override
	public ArrayList<Gallerylikeinfo> new3likeList(int user_no) {
		return userDao.new3likeList(user_no);
	}

	@Override
	public void heartX(Map<String, Object> map) {
		userDao.heartX(map);
		
	}
	
	@Override
	public void heartO(Map<String, Object> map) {
		userDao.heartO(map);
		
	}

	@Override
	public ArrayList<Gallerylikeinfo> hotlikeList(int user_no) {
		return userDao.hotlikeList(user_no);
	}

	
}
