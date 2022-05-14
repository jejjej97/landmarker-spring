package com.lm.landmarker.user.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lm.landmarker.banner.model.vo.Banner;
import com.lm.landmarker.gallery.model.vo.Gallery;
import com.lm.landmarker.landmark.model.vo.Landmark;
import com.lm.landmarker.user.model.service.UserService;
import com.lm.landmarker.user.model.vo.User;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	// 테스트 함수 --------------------------------
	@RequestMapping("mypage.do")
	public ModelAndView myInfoMethod(HttpServletRequest request, ModelAndView mv, @RequestParam(name = "page", required = false) String page) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		//리퀘스트로 세션에서 아이디 값 가져오게 수정해서 적용해야함
		int user_no=user.getUser_no();
		int board_count = userService.boardCount(user_no);
		int scrap_count =  userService.scrapCount(user_no);
		int reply_count = userService.replyCount(user_no);
		
		//-------------------------페이징처리한 올린 게시물 가져오기--------
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		// 페이징 계산 처리 ----- 별도의 클래스로 작성해서 사용해도 됨 -----
		int limit = 3; // 한 페이지에 출력할 목록 갯수
		// 페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = userService.boardCount(user_no);
		// 페이지 수 계산
		// 주의 : 목록이 11개이면, 페이지 수는 2가 됨 (나머지 목록 1개도 출력페이지가 1개 필요함)
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지수를 10개씩 한 경우)
		int startPage = (int) ((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지그룹의 끝값
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		//Paging paging = new Paging(startRow, endRow);
		
		Map<String,Object> map = new HashMap<>();
		map.put("user_no", user_no);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Gallery> gallerylist = userService.selectMygallery(map);
//		----------------------올린게시물 코드 끝
		
		//--------------------스크랩 가져오기 코드
		
		ArrayList<Gallery> likelist = userService.selectScrapList(user_no);
		
		if(user != null) {
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("gallerylist", gallerylist);
			mv.addObject("likelist", likelist);
			mv.addObject("board_count", board_count);
			mv.addObject("scrap_count", scrap_count);
			mv.addObject("reply_count", reply_count);
			mv.addObject("user", user);
			mv.setViewName("user/mypage");
		}
		
		return mv;
	}
	@RequestMapping("userupdate.do")
	public String UpdateUser(HttpServletRequest request, @RequestParam(name="username",required = false) String user_name) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		
		
		if(user_name != null && user_name != "") {
		user.setUser_name(user_name);
		}
		
		if(userService.updateUser(user) > 0) {
			return "redirect:mypage.do";//???
		}else {
			System.out.println("닉네임 변경 실패");
			return "user/myPage";
		}
	}
	
	@RequestMapping("badgeupdate.do")
	public String UpdateBadge(HttpServletRequest request, @RequestParam(name="badge_name") String badge_name) {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		user.setUser_badge(badge_name);
		
		if(userService.updateBadge(user) > 0) {
			return "redirect:mypage.do";
		}else {
			System.out.println("벳지 변경 실패");
			return "user/myPage";
		}
	}
	
	@RequestMapping(value="landmarkSearch.do", method=RequestMethod.POST)
	@ResponseBody
	public String LandmarkSearch(@RequestParam(name="search") String search, HttpServletResponse response) throws UnsupportedEncodingException {
		
		ArrayList<Landmark> list = userService.landmarkSearch(search);
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Landmark landmark : list) {
			JSONObject job = new JSONObject();
			
			job.put("landmark_name", URLEncoder.encode(landmark.getLandmark_name(), "utf-8"));
			job.put("landmark_address", URLEncoder.encode(landmark.getLandmark_address(), "utf-8"));
			
			jarr.add(job);  
		}
		sendJson.put("list", jarr);
		
		
		return sendJson.toJSONString();
		
		
	}
	@RequestMapping(value = "admin.do", method = RequestMethod.GET)
	public ModelAndView admin(ModelAndView mv) {
		int gallery_count = userService.gallery_count();
		ArrayList<User> list = userService.userList();
		ArrayList<Banner> banner= userService.bannerList();

		if (list != null && list.size() > 0) {
			mv.addObject("gallery_count", gallery_count);
			mv.addObject("list", list);
			mv.addObject("banner", banner);
			mv.setViewName("user/adminpage");
		} else {
			mv.addObject("message","유저 목록 조회 실패");
			mv.setViewName("user/adminpage");
		}
		return mv;
	}
	
	@RequestMapping("bannerDelete.do")
	public String BannerDelete(@RequestParam(name="banner_no") int banner_no) {
		
		if(userService.bannerDelete(banner_no) > 0) {
			return "redirect:admin.do";
		}else {
			System.out.println("베너삭제 실패");
			return "redirect:admin.do";
		}
	}
	
	@RequestMapping(value="insertBanner.do", method=RequestMethod.POST)
	public String InsertBanner(@RequestParam(name="title") String title, 
			@RequestParam(name="uptext") String content,
			@RequestParam(name="file") MultipartFile file,
			HttpServletRequest request, Model model, Banner banner) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/banner");
		
		String fileName = file.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
		
		renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		
		File renameFile = new File(savePath + "\\" + renameFileName);
		
		try {
			file.transferTo(renameFile);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "베너 인서트 오류");
			
			return "common/error";
		}
		
		content.replace("\n", ",<br>");
		content.replace("\r", ",<br>");
		content.replace("\r\n", ",<br>");
		content.replace("\n\r", ",<br>");
		
		banner.setPhoto_path(renameFileName);
		banner.setBanner_title(title);
		banner.setBanner_content(content);
		
		
		if(userService.insertBanner(banner) > 0) {  
			return "redirect:admin.do";
			
		}else {			
			return "redirect:admin.do";
		}
	
	}
	
	@RequestMapping(value = "searchUserName.do", method = RequestMethod.POST)
	@ResponseBody
	public String SearchUserName(@RequestParam(name="user_name") String user_name, HttpServletResponse response) throws UnsupportedEncodingException {
		ArrayList<User> list = null;
		if(user_name==null || user_name.equals("")) {
			list = userService.userList();
		}else {
			list = userService.searchName(user_name);
		}
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(User user : list) {
			JSONObject job = new JSONObject();
			
			job.put("user_no", user.getUser_no());
			job.put("user_name", URLEncoder.encode(user.getUser_name(), "utf-8"));
			job.put("user_email", user.getUser_email());
			job.put("user_admin", user.getUser_admin());
			job.put("login_ok", user.getLogin_ok());
			
			jarr.add(job);  
		}
		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();
	}
	//로그인 제한/가능 변경 처리용
	@RequestMapping("loginok.do")
	public String changeLoginOKMethod(User user, Model model, HttpServletRequest request) {
		logger.info("loginok.do : " + user.getUser_no() + ", " + user.getLogin_ok());
		System.out.println(user.toString());
		if(userService.updateLoginOK(user) > 0) {
			String referer = request.getHeader("Referer");
			return "redirect:"+ referer;

		}else {
			model.addAttribute("message", "로그인 제한/허용 처리 오류 발생!");
			return "common/error";
		}
		
	}
	@RequestMapping(value="changeLoginOK.do", method=RequestMethod.POST)
	@ResponseBody
	public String changeLoginOKMethod(@RequestParam(name="user_no") int user_no, HttpServletResponse response) throws UnsupportedEncodingException {
		
		User user=userService.selectUserInfo(user_no);
		
		String yesno = user.getLogin_ok();
		
		if(yesno.equals("Y")) {
			user.setLogin_ok("N");
			userService.updateLoginOK(user);
		}else {
			user.setLogin_ok("Y");
			userService.updateLoginOK(user);
		}
		JSONObject sendJson = new JSONObject();
		
		return sendJson.toJSONString();

	}
	
	@RequestMapping(value="changeAdmin.do", method=RequestMethod.POST)
	@ResponseBody
	public String changeAdmin(@RequestParam(name="user_no") int user_no, HttpServletResponse response) throws UnsupportedEncodingException {
		
		User user=userService.selectUserInfo(user_no);
		
		String admin = user.getUser_admin();
		
		if(admin.equals("Y")) {
			user.setUser_admin("N");
			userService.updateAdmin(user);
		}else {
			user.setUser_admin("Y");
			userService.updateAdmin(user);
		}
		JSONObject sendJson = new JSONObject();
		
		return sendJson.toJSONString();

	}

	
}
