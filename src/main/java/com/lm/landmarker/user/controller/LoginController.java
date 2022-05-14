package com.lm.landmarker.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.lm.landmarker.banner.model.vo.Banner;
import com.lm.landmarker.user.model.service.KakaoService;
import com.lm.landmarker.user.model.service.UserService;
import com.lm.landmarker.user.model.vo.User;

@CrossOrigin(origins = "http://www.landmarker.p-e.kr:8080")
@Controller
public class LoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private UserService userService;

	/*
	 * GoogleLogin
	 * 
	 * @Autowired private GoogleConnectionFactory googleConnectionFactory;
	 * 
	 * @Autowired private OAuth2Parameters googleOAuth2Parameters;
	 */

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "naverlogin.do")
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		/*
		 * OAuth2Operations oauthOperations =
		 * googleConnectionFactory.getOAuthOperations();
		 */
		/*
		 * String GoogleUrl =
		 * oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
		 * googleOAuth2Parameters);
		 */

		System.out.println("네이버:" + naverAuthUrl);
		/* System.out.println("구글:" + GoogleUrl); */

		JSONObject url = new JSONObject();

		url.put("naverUrl", naverAuthUrl);
		/* url.put("googleUrl", GoogleUrl); */

		System.out.println(url);

		model.addAttribute("url", naverAuthUrl);        
		/* 생성한 인증 URL을 View로 전달 */
		return "user/connect";
	}
	
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naverCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			User user) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		System.out.println(response_obj);
		// response의 name값 파싱
		String name = (String) response_obj.get("name");
		String email = (String) response_obj.get("email");

		// 중복된 이메일이 있으면 그대로 사용, 아니면 새로 적용
		if (userService.dupCheck(email) != null) {
			user = userService.dupCheck(email);
		} else {
			user.setUser_name(name);
			user.setUser_email(email);
			if (userService.insertUser(user) > 0) {

			} else {

			}
		}
		
		user = userService.selectUser(email);
		session.setAttribute("loginUser", user);

		Map<String, String> map = new HashMap<>();
		map.put("USER_NO", String.valueOf(user.getUser_no()));
		map.put("LINK_KEY", RandomStringUtils.randomAlphanumeric(50));
		
		System.out.println(map.get("LINK_KEY"));
		
		int dd = userService.insertLink(map);
		
		System.out.println(dd);
		
		return "redirect:http://www.landmarker.p-e.kr:8080/landmarker/login.do?link_key=" + map.get("LINK_KEY");
	}

	// 카카오 로그인
	@Autowired
	private KakaoService ms;

	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
	public String kakaoLogin(Model model,@RequestParam(value = "code", required = false) String code, HttpSession session,
			User user) throws Exception {
		String access_Token = ms.getAccessToken(code);
		HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
		
		System.out.println(access_Token);

		String email = (String) userInfo.get("email");
		String name = (String) userInfo.get("nickname");

		if (userService.dupCheck(email) != null) {
			user = userService.dupCheck(email);
		} else {
			user.setUser_name(name);
			user.setUser_email(email);
			if (userService.insertUser(user) > 0) {

			} else {

			}

		}
		ArrayList<Banner> banner= userService.bannerList();		
		model.addAttribute("banner", banner );
		user = userService.selectUser(email);
		session.setAttribute("loginUser", user);

		Map<String, String> map = new HashMap<>();
		map.put("USER_NO", String.valueOf(user.getUser_no()));
		map.put("LINK_KEY", RandomStringUtils.randomAlphanumeric(50));
		
		System.out.println(map.get("LINK_KEY"));
		
		userService.insertLink(map);
		
		return "redirect:http://www.landmarker.p-e.kr:8080/landmarker/login.do?link_key=" + map.get("LINK_KEY");
	}

	/*
	 * // 구글 Callback호출 메소드
	 * 
	 * @RequestMapping(value = "googleCallback.do", method = RequestMethod.GET)
	 * public String doSessionAssignActionPage(HttpServletRequest request, User
	 * user)throws Exception{ System.out.println("/member/googleSignInCallback");
	 * String code = request.getParameter("code");
	 * 
	 * OAuth2Operations oauthOperations =
	 * googleConnectionFactory.getOAuthOperations(); AccessGrant accessGrant =
	 * oauthOperations.exchangeForAccess(code ,
	 * googleOAuth2Parameters.getRedirectUri(), null);
	 * 
	 * String accessToken = accessGrant.getAccessToken(); Long expireTime =
	 * accessGrant.getExpireTime(); if (expireTime != null && expireTime <
	 * System.currentTimeMillis()) { accessToken = accessGrant.getRefreshToken();
	 * System.out.printf("accessToken is expired. refresh token = {}", accessToken);
	 * } Connection<Google> connection =
	 * googleConnectionFactory.createConnection(accessGrant); Google google =
	 * connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
	 * 
	 * PlusOperations plusOperations = google.plusOperations(); Person profile =
	 * plusOperations.getGoogleProfile();
	 * System.out.println(profile.getDisplayName());
	 * user.setUser_email(profile.getAccountEmail());
	 * user.setUser_name(profile.getDisplayName()); HttpSession session =
	 * request.getSession();
	 * 
	 * session.setAttribute("login", user );
	 * 
	 * 
	 * return "common/main"; }
	 */
	
	  @RequestMapping(value = "google.do", method = { RequestMethod.GET,
	  RequestMethod.POST }) public String google() {
	  
	  return "common/test"; 
	  } 
	
	@RequestMapping(value = "logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session, Model model) throws IOException {
		System.out.println("logout");
		session.invalidate();

		return "redirect:/";
	}
}
