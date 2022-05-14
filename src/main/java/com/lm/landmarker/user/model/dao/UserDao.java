package com.lm.landmarker.user.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lm.landmarker.user.model.vo.User;
import com.lm.landmarker.banner.model.vo.Banner;
import com.lm.landmarker.gallery.model.vo.Gallery;
import com.lm.landmarker.galleryinfo.model.vo.Galleryinfo;
import com.lm.landmarker.galleryinfo.model.vo.Gallerylikeinfo;
import com.lm.landmarker.landmark.model.vo.Landmark;
import com.lm.landmarker.like.model.vo.Like;

@Repository("userDao")
public class UserDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public UserDao() {}
	
	public User dupCheck(String user_email) {
		return session.selectOne("userMapper.dupCheck", user_email);
	}
	
	public int insertUser(User user) {
		return session.insert("userMapper.insertUser", user);
	}

	public User selectUser(String user_email) {
		return session.selectOne("userMapper.selectUser", user_email);
	}

	public User selectUserInfo(int user_no) {
		return session.selectOne("userMapper.selectUserInfo", user_no);
	}

	public int boardCount(int user_no) {
		return session.selectOne("userMapper.galleryCount", user_no);
	}
	
	public int scrapCount(int user_no) {
		return session.selectOne("userMapper.likeCount", user_no);
	}

	public ArrayList<Gallery> selectScrapList(int user_no) {
		List<Gallery> list = session.selectList("userMapper.likeList", user_no);
		return (ArrayList<Gallery>)list;
		
	}

	public ArrayList<Gallery> selectMygallery(Map<String, Object> map) {
		List<Gallery> list = session.selectList("userMapper.selectMygallery", map);
		return (ArrayList<Gallery>)list;
	}

	public int updateUser(User user) {	
		return session.update("userMapper.updateUser", user);
	}

	public int updateBadge(User user) {
		return session.update("userMapper.updateBadge", user);
	}

	public int replyCount(int user_no) {		
		return session.selectOne("userMapper.replyCount", user_no);
	}

	public ArrayList<Landmark> landmarkSearch(String search) {
		List<Landmark> list = session.selectList("userMapper.landmarkSearch", search);
		return (ArrayList<Landmark>)list;
	}

	public ArrayList<Banner> bannerList() {
		List<Banner> list = session.selectList("userMapper.bannerList");
		return (ArrayList<Banner>)list;
	}

	public int bannerDelete(int banner_no) {
		return session.delete("userMapper.bannerDelete", banner_no);
	}

	public int bannerInsert(Banner banner) {

		return session.insert("userMapper.bannerInsert", banner);
	}

	public ArrayList<User> selectUserList() {
		List<User> list = session.selectList("userMapper.userList");
		return (ArrayList<User>)list;
	}

	public ArrayList<User> searchName(String user_name) {
		List<User> list = session.selectList("userMapper.nameSearch", user_name);
		return (ArrayList<User>)list;
	}

	public int updateLoginOK(User user) {
		return session.update("userMapper.updateLoginOK", user);
	}
	
	public Object updateAdmin(User user) {
		return session.update("userMapper.updateAdmin", user);
	}


		
	// 장고 로그인
	public int insertLink(Map<String, String> map) {		
		return session.insert("userMapper.insertLink", map);
	}
	
	public int deleteKey(String link_key) {		
		return session.delete("userMapper.deleteKey", link_key);
	}
	
	public int deleteDate() {		
		return session.delete("userMapper.deleteDate");
	}
	
	public int selectLink(String link_key) {		
		return session.selectOne("userMapper.selectLink", link_key);
	}

	public ArrayList<Galleryinfo> new3List() {
		List<Galleryinfo> list = session.selectList("userMapper.selectNew3");
		return (ArrayList<Galleryinfo>)list;
	}
	public ArrayList<Gallerylikeinfo> new3likeList(int user_no) {
		List<Gallerylikeinfo> list = session.selectList("userMapper.selectNewLike3", user_no);
		return (ArrayList<Gallerylikeinfo>)list;
	}

	public ArrayList<Galleryinfo> topWeekList() {
		List<Galleryinfo> list = session.selectList("userMapper.selectTopWeek");
		return (ArrayList<Galleryinfo>)list;
	}

	public int galleryCount() {
		return session.selectOne("userMapper.allGalleryCount");
	}

	public ArrayList<Like> userLikeList(int user_no) {
		List<Like> list = session.selectList("userMapper.userLikeList", user_no);
		return (ArrayList<Like>)list;
	}

	
	public void heartX(Map<String, Object> map) {
		session.delete("userMapper.heartX", map);
	}

	public void heartO(Map<String, Object> map) {
		session.insert("userMapper.heartO", map);
	}

	public ArrayList<Gallerylikeinfo> hotlikeList(int user_no) {
		List<Gallerylikeinfo> list = session.selectList("userMapper.selectHotLike", user_no);
		return (ArrayList<Gallerylikeinfo>)list;
	}
	
	
}
