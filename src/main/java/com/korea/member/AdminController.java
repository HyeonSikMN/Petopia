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
import dao.MemberDAO;
import vo.GpVO;
import vo.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	ServletContext application;//애플리케이션의 정보를 담고있는 클래스
	
	public static String PATH = "/WEB-INF/views/";

	MemberDAO member_dao;

	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	GpDAO gp_dao;
	public void setGp_dao(GpDAO gp_dao) {
		this.gp_dao = gp_dao;
	}

	// 관리자 모드 들어가기
	@RequestMapping("/admin.do")
	public String admimMode(Model model) {
		List<MemberVO> list = member_dao.selectAll();

		// 회원목록 바인딩
		model.addAttribute("list", list);
		return PATH + "admin.jsp";
	}

	// 회원 삭제
	@RequestMapping("/member_del.do")
	@ResponseBody
	public String memberDel(int idx) {
		int res = member_dao.deleteMember(idx);
		// return "" + res;
		return String.valueOf(res); // 정수를 문자열로 바꿔서 콜백으로 전달
	}

	// 회원 정보 수정
	@RequestMapping("/modify_form.do") // modify_form.do?pwd=1111&idx=4&name=�솉湲몃룞&content=�궡�슜
	public String modify_form(Model model, int idx) {

		System.out.println("idx:" + idx);
		MemberVO vo = member_dao.selectOne(idx);
		
		model.addAttribute("vo", vo);
		return PATH + "member_modify_form.jsp"; 
		
	}
	//회원 정보 수정
		@RequestMapping("/member_modify.do")
		public String modify( MemberVO vo, HttpServletRequest request) {
			
			int res = member_dao.update_modify(vo);
			
			return "redirect:list.do";
		}

	
	//게시판 수정 및 삭제 
	/*@RequestMapping("/")
	public String Board(Model model, BoardVO ) {
		
		return PATH + "board.jsp";
	} */
	
	//관리자모드 상품등록 하기
		@RequestMapping("/addproduct_form.do")
		public String addproduct_form() {
			return PATH + "gp/gp_addproduct_form.jsp";
		}
		
		//관리자모드 상품 등록
		@RequestMapping("/addproduct.do")  
		public String addproduct(GpVO vo) {
		
			System.out.println("제목:" + vo.getProductname());
			System.out.println("파일이름:"+vo.getPhoto());
			System.out.println("파일이름:"+vo.getFilename());
			System.out.println("파일이름:"+vo.getCategory());
			System.out.println("파일이름:"+vo.getPid());
			System.out.println("파일이름:"+vo.getPopularity());
			System.out.println("파일이름:"+vo.getPrice());
			System.out.println("파일이름:"+vo.getProductdetail());
			System.out.println("파일이름:"+vo.getSpecies());
			
			
			/*
			 * String ip = request.getRemoteAddr(); vo.setIp(ip);
			 */
			//절대경로를 찾기위한 준비
			String webPath = "/resources/upload/";
			String savePath = application.getRealPath(webPath);
			System.out.println("절대경로 : " + savePath);
			
			//업로드를 위해 보내진 photo라는 이름의 파일정보
			MultipartFile photo = vo.getPhoto();
			
			String filename = "no_file";
			
			//업로드 된 파일이 존재한다면
			if(!photo.isEmpty()) {
				//업로드된 실제 파일의 이름
				filename = photo.getOriginalFilename();
				
				//저장할 파일의 경로
				File saveFile = new File(savePath, filename);
				
				if(!saveFile.exists() ) {
					saveFile.mkdirs();
				}else {
					//동일파일명에 대한 이름 수정
					long time = System.currentTimeMillis();
					filename = String.format("%d_%s", time, filename);
					saveFile = new File(savePath, filename);
				}
				
				try {
					photo.transferTo(saveFile);
				} catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			
			//vo에 파일명 세팅 후 DB에 add
			vo.setFilename(filename);
			System.out.print("fn" + vo.getFilename());
			gp_dao.addProduct(vo);
			
			
			//Controller에서 url매핑을 호출해야 하는 경우
			//sendRedirect("list.do");
			return "redirect:gp_list.do";
			
		}
		
		//관리자모드 상품삭제 페이지로 전환 
			@RequestMapping("/delete_form.do")
			public String delete_form() {
				return PATH + "gp/gp_delete_form.jsp";
			}
		
		//상품 삭제
		@RequestMapping(value="/delete.do", produces="application/json;charset=UTF-8")
		/*
		 * @ResponseBody 
		 */	
		public String delproduct(int pid ) {
			
			GpVO vo = gp_dao.selectOne(pid);
			
			int res = gp_dao.deleteProduct(pid);
			/*String result = "삭제 실패";
			
			if(res != 0 ) {
				result = "삭제 성공";*/
				//이미지 업로드된 게시글의 이미지를 삭제하기
				String webPath = "/resources/upload/";
				String savePath = application.getRealPath(webPath);
				
				String photo = vo.getFilename();
				
				File file= new File(savePath, photo);
				/*if(file.exists()) {*/
					file.delete();
					/* } */
				
			
			
			/* String str = String.format("[{'result':'%s'}]", result); */
			
			
			
			
			return "redirect:gp_list.do"; 
		}
		
		//상품 수정을 위한 페이지로 전환
		@RequestMapping("/delete_modify_form.do")
		public String modify_form(Model model, GpVO vo) {
			
			model.addAttribute("vo", vo);
			return PATH + "gp/gp_delete_modify_form.jsp";
			
		}
		
		// 상품 수정
		@RequestMapping("/modify.do")
		public String modify(GpVO vo) {
			
			System.out.println("filename : " + vo.getFilename());
			String webPath = "/resources/upload/";
			String savePath = application.getRealPath(webPath);
			System.out.println("절대경로 : " + savePath);
			
			//업로드를 위해 보내진 photo라는 이름의 파일정보
			MultipartFile photo = vo.getPhoto();
			
			String filename = "no_file";
			
			//업로드 된 파일이 존재한다면
			if(!photo.isEmpty()) {
				//업로드된 실제 파일의 이름
				filename = photo.getOriginalFilename();
				
				//저장할 파일의 경로
				File saveFile = new File(savePath, filename);
				
				if(!saveFile.exists() ) {
					saveFile.mkdirs();
				}else {
					//동일파일명에 대한 이름 수정
					long time = System.currentTimeMillis();
					filename = String.format("%d_%s", time, filename);
					saveFile = new File(savePath, filename);
				}
				
				try {
					photo.transferTo(saveFile);
				} catch(Exception e) {
					e.printStackTrace();
				}
				
			}
			vo.setFilename(filename);
			System.out.print("fn" + vo.getFilename());
			gp_dao.update_modify(vo);
			
			
			int res = gp_dao.update_modify(vo);
			return "redirect:gp_list.do"; 
		}
		
}
