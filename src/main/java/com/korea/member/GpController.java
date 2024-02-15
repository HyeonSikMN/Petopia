package com.korea.member;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.GpDAO;
import vo.GpVO;

@Controller
public class GpController {
	
	@Autowired//자동주입
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;//애플리케이션의 정보를 담고있는 클래스
	
	public static final String PATH = "/WEB-INF/views/gp/";
	
	GpDAO gp_dao;
	public void setGp_dao(GpDAO gp_dao) {
		this.gp_dao = gp_dao;
	}    
	
	//쇼핑메인 & 상품 전체목록 보기
	@RequestMapping("/gp_list.do")
	public String vsList( Model model ) {
		
		List<GpVO> list = gp_dao.selectList();
		model.addAttribute("list", list);
		return PATH + "gp_list.jsp";
		
	}
	
	
	//쇼핑메인 & 사료 상품 목록보기
			@RequestMapping(value={"/feedlist.do"})
			public String feedList( Model model ) {
				
				List<GpVO> feedlist = gp_dao.selectfeedList(); /* dao에 클래스명을 넣어야함! sqlsession.sdfsdf 아님! */
				model.addAttribute("feedlist", feedlist);
				
				System.out.println("aa:"+feedlist.size());
				return PATH + "gp_feedlist.jsp";
				
			}
			//쇼핑메인 & 목줄 상품 목록보기
					@RequestMapping(value={"/leashlist.do"})
					public String leashList( Model model ) {
						
						List<GpVO> leashlist = gp_dao.selectleashList(); /* dao에 클래스명을 넣어야함! sqlsession.sdfsdf 아님! */
						model.addAttribute("leashlist", leashlist);
						
						System.out.println("aa:"+leashlist.size());
						return PATH + "gp_leashlist.jsp";
						
					}
			//쇼핑메인 & 패드 상품 목록보기
					@RequestMapping(value={"/padlist.do"})
					public String padList( Model model ) {
						
						List<GpVO> padlist = gp_dao.selectpadList(); /* dao에 클래스명을 넣어야함! sqlsession.sdfsdf 아님! */
						model.addAttribute("padlist", padlist);
						
						System.out.println("aa:"+padlist.size());
						return PATH + "gp_padlist.jsp";
						
					}
			//쇼핑메인 & 옷 상품 목록보기
					@RequestMapping(value={"/clothlist.do"})
					public String clothList( Model model ) {
						
						List<GpVO> clothlist = gp_dao.selectclothList(); /* dao에 클래스명을 넣어야함! sqlsession.sdfsdf 아님! */
						model.addAttribute("clothlist", clothlist);
						
						System.out.println("aa:"+clothlist.size());
						return PATH + "gp_clothlist.jsp";
						
					}
		
	
}

	// 관리자모드 상품등록 폼으로 전환
	
	// 관리자모드 상품등록 하기
	
	// 관리자모드 상품 삭제
	
	// 관리자모드 상품 수정을 위한 페이지로 전환
	
	// 관리자모드 상품 수정