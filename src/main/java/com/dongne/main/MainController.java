package com.dongne.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dongne.club.ClubDTO;
import com.dongne.club.ClubService;
import com.dongne.community.CommunityDTO;
import com.dongne.community.CommunityService;
import com.dongne.fboard.FboardDTO;
import com.dongne.fboard.FboardService;
import com.dongne.market.MarketDTO;
import com.dongne.market.MarketService;
import com.dongne.notice.NoticeDTO;
import com.dongne.notice.NoticeService;
import com.dongne.region.RegionService;
import com.dongne.tour.TourDTO;
import com.dongne.tour.TourService;
import com.dongne.user.UserDTO;
import com.dongne.user.UserService;
import com.dongne.utility.LocationDTO;
import com.dongne.utility.NaverGeoApi;
import com.dongne.utility.Utility;

@Controller
public class MainController {

	@Autowired
	@Qualifier("com.dongne.notice.NoticeServiceImpl")
	private NoticeService noticeService;

	@Autowired
	@Qualifier("com.dongne.tour.TourServiceImpl")
	private TourService tourService;

	@Autowired
	@Qualifier("com.dongne.market.MarketServiceImpl")
	private MarketService marketService;

	@Autowired
	@Qualifier("com.dongne.club.ClubServiceImpl")
	private ClubService clubService;

	@Autowired
	@Qualifier("com.dongne.fboard.FboardServiceImpl")
	private FboardService fboardService;

	@Autowired
	@Qualifier("com.dongne.community.CommunityServiceImpl")
	private CommunityService communityService;

	@Autowired
	@Qualifier("com.dongne.user.UserServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("com.dongne.region.RegionServiceImpl")
	private RegionService regionService;

	@GetMapping("/")
	public String home(Model model, HttpSession session, HttpServletRequest request) throws Exception {

		System.out.println("--HOME GETMAPPING-- ");
		String realLocation = (String) session.getAttribute("realLocation");

		if (realLocation == null) {
			realLocation = NaverGeoApi.getAddress(NaverGeoApi.getReverseGeocode(37.206502, 127.114415));

		}

		if ((String) session.getAttribute("ID") == null) {
			System.out.println("session ID == null");
			session.setAttribute("region", regionService.read(Utility.getRegionCode(realLocation)).getRegionID());
			session.setAttribute("regionName", regionService.read(Utility.getRegionCode(realLocation)).getRegion());
		} else {
			UserDTO dto = userService.read((String) session.getAttribute("ID"));
			System.out.println("session ID : " + dto.getID());
//			System.out.println("BUG " + Utility.getRegionCode(dto.getAddress1()) + dto.getAddress1());
//			session.setAttribute("region", regionService.read(Utility.getRegionCode(dto.getAddress1())).getRegionID());
			System.out.println(
					"dto regionID : " + regionService.read(Utility.getRegionCode(dto.getAddress1())).getRegionID());
		}

		// 코로나 정보 불러오기
		List<String> covidResult = Crawler.covidCrawling(realLocation);

//		System.out.println((String) session.getAttribute("realLocation"));

		model.addAttribute("covid", covidResult);
		model.addAttribute("realLocation", realLocation);
		model.addAttribute("region", session.getAttribute("region"));

//		System.out.println("realLocation : " + realLocation);
//		System.out.println("region : " + session.getAttribute("region"));

		// 최근 공지사항 목록 3개
		Map map = new HashMap();
		map.put("sno", 0);
		map.put("eno", 3);

		List<NoticeDTO> noticelist = noticeService.list(map);

		map.put("districtcode", session.getAttribute("region"));

		List<TourDTO> tourlist = tourService.list(map);

		map.remove("districtcode");
		map.put("regionID", session.getAttribute("region"));

		List<MarketDTO> marketlist = marketService.list(map);
		List<ClubDTO> clublist = clubService.list(map);
		List<FboardDTO> fboardlist = fboardService.list(map);
		List<CommunityDTO> communitylist = communityService.list(map);

		// request에 Model사용 결과 담는다
		request.setAttribute("noticelist", noticelist);
		request.setAttribute("tourlist", tourlist);
		request.setAttribute("marketlist", marketlist);
		request.setAttribute("clublist", clublist);
		request.setAttribute("fboardlist", fboardlist);
		request.setAttribute("communitylist", communitylist);

		return "/home";
	}

	@PostMapping("/")
	@ResponseBody
	public String home(String latitude, String longitude, Model model, HttpSession session) throws Exception {

		System.out.println("--HOME POSTMAPPING--");

		LocationDTO loc = new LocationDTO(Double.parseDouble(latitude), Double.parseDouble(longitude));

		String realLocation = NaverGeoApi
				.getAddress(NaverGeoApi.getReverseGeocode(loc.getLatitude(), loc.getLongitude()));
		System.out.println("realLocation : " + realLocation);
		System.out.println("region : " + session.getAttribute("region"));

		// 코로나 정보 불러오기
		List<String> covidResult = Crawler.covidCrawling(realLocation);

		model.addAttribute("covid", covidResult);

		session.setAttribute("realLocation", realLocation);
		model.addAttribute("realLocation", realLocation);

		return "/home";
	}
}