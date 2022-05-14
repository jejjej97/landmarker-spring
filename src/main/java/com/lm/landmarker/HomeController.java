package com.lm.landmarker;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lm.landmarker.banner.model.vo.Banner;
import com.lm.landmarker.gallery.model.vo.Gallery;
import com.lm.landmarker.galleryinfo.model.vo.Galleryinfo;
import com.lm.landmarker.galleryinfo.model.vo.Gallerylikeinfo;
import com.lm.landmarker.like.model.vo.Like;
import com.lm.landmarker.user.model.service.UserService;
import com.lm.landmarker.user.model.vo.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		
		return "home";
	}

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request) {
		
		ArrayList<Banner> banner= userService.bannerList();		
		ArrayList<Galleryinfo> topweek = userService.topWeekList();
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		
		if(user != null) {
			
			ArrayList<Gallerylikeinfo> new3 = userService.new3likeList(user.getUser_no());
			model.addAttribute("new3", new3);
			
			ArrayList<Gallerylikeinfo> hot = userService.hotlikeList(user.getUser_no());
			model.addAttribute("hot", hot);
			
		}else {
			ArrayList<Gallerylikeinfo> new3 = userService.new3likeList(0);
			model.addAttribute("new3", new3);
			ArrayList<Gallerylikeinfo> hot = userService.hotlikeList(0);
			model.addAttribute("hot", hot);
		}
		
		
		
		model.addAttribute("banner", banner );	
		
		
		return "common/main";
	}
	
	@RequestMapping("heart.do")
	public String myInfoMethod(HttpServletRequest request, Model model, @RequestParam(name = "heart") int heart,
			@RequestParam(name = "g_no") int g_no) {
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+g_no+user.getUser_no());
		//리퀘스트로 세션에서 아이디 값 가져오게 수정해서 적용해야함
		if(user != null) {
			Map<String,Object> map = new HashMap<>();
			map.put("user_no", user.getUser_no());
			map.put("g_no",g_no);
			if(heart != 1) {
				userService.heartX(map);
			}else {
				userService.heartO(map);
			}
		}
		
		
		return "redirect:main.do";
	}
	
}
