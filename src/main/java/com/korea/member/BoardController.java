package com.korea.member;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import dao.ContentDAO;
import vo.BoardVO;
import vo.QaVO;

@Controller
public class BoardController<BoardService> {

	@Autowired // 자동주입(servlet-context에서 설정 잡혀있어야 사용 가능)
	HttpServletRequest request;

	@Autowired
	ServletContext application; // 애플리케이션의 정보를 담고있는 클래스

	public static final String PATH = "/WEB-INF/views/board/";

	BoardDAO board_dao;
	ContentDAO content_dao;

	public BoardController(BoardDAO board_dao, ContentDAO content_dao) {
		this.board_dao = board_dao;
		this.content_dao = content_dao;
	}

	// 게시판 메인페이지 보기
	@RequestMapping(value = { "/board_main.do" })
	public String showMainPage() {
		return PATH + "board_main.jsp";
	}

	// 게시글 전체목록 보기
	@RequestMapping(value = { "/post_list.do" })
	public String psList(Model model) {

		List<BoardVO> list = board_dao.selectList();
		model.addAttribute("list", list);
		return PATH + "post_list.jsp";
	}

	// 게시물 저세히 보기
	@RequestMapping("/post_detail.do")
	
	public String viewpo(@RequestParam("idx") int idx, Model model) {
		BoardVO baseVO = board_dao.select_po(idx);

		model.addAttribute("post", baseVO);
		return PATH + "post_list_detail.jsp";
	}

	// 질문글 전체목록 보기
	@RequestMapping(value = { "/question_list.do" })
	public String qsList(Model model) {

		List<BoardVO> list = board_dao.selectQuestionList();
		model.addAttribute("qadata", list);
		return PATH + "question_list.jsp";
	}

	// question 자세히 보기
	@RequestMapping("/question_detail.do")
	public String view_qa(@RequestParam("qaidx") int qaidx, Model model) {
		BoardVO baseVO = board_dao.select_qa(qaidx);

		model.addAttribute("question", baseVO);
		return PATH + "question_list_detail.jsp";
	}

	// management 전체목록 보기
	@RequestMapping(value = { "/management_list.do" })
	public String mgList(Model model) {

		List<BoardVO> list = board_dao.selectList();
		model.addAttribute("list", list);
		return PATH + "management_list.jsp";
	}

	// 다이어리 전체목록 보기
	@RequestMapping("/diary_list.do")
	public String diList(Model model) {

		List<BoardVO> list = board_dao.selectDiaryList();
		model.addAttribute("didata", list);
		return PATH + "diary_list.jsp";
	}

	// 다이어리 자세히 보기_강사님
	@RequestMapping("/diary_detail.do")
	// @RequestParam("diidx") int idx
	public String view(BoardVO vo, Model model) {
		BoardVO baseVO = board_dao.selectOne(vo.getDiidx());

		model.addAttribute("didiary", baseVO);
		return PATH + "diary_list_detail.jsp";
	}

	// 댓글 달기
	@RequestMapping("/content_insert.do")
	public String cotent_insert(Model model, String content) {

		content_dao.insertContent(content);
		List<QaVO> list = content_dao.selectContentList();
		model.addAttribute("list", list);
		return PATH + "question_list_detail.jsp";
	}

	// 새 글 쓰기
	@RequestMapping("/post_insert.do")
	public String insert(BoardVO vo) {

		// 절대경로를 찾기위한 준비
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);
		System.out.println("절대경로 : " + savePath);

		// 업로드를 위해 보내진 photo라는 이름의 파일정보
		MultipartFile photo = vo.getPhoto();

		String filename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드된 실제 파일의 이름
			filename = photo.getOriginalFilename();

			// 저장할 파일의 경로
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else { // 이름 중복되도 갱신되지않고 따로 들어가게 하기 위함
				// 동일파일명에 대한 이름 수정
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				photo.transferTo(saveFile); // 없으면 파일형태로 만들어져서 꼭 있어야됨
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// vo에 파일명 세팅 후 DB에 insert
		vo.setFilename(filename);
		board_dao.insertUser(vo); // DAO로 가서 insertUser메서드 만들어야함

		// Controller에서 url매핑을 호출해야 하는 경우
		return "redirect:post_list.do";
	}

	// question 글 쓰기
	@RequestMapping("/qainsert.do")
	public String qainsert(BoardVO vo) {

		// 데이터 저장
		board_dao.qainsertUser(vo);

		// Controller에서 url매핑을 호출해야 하는 경우
		return "redirect:question_list.do";
	}

	// 다이어리 글 쓰기
	@RequestMapping("/write.do")
	public String diinsert(BoardVO vo) {

		// 절대경로를 찾기위한 준비
		String webPath = "/resources/upload/";
		String savePath = application.getRealPath(webPath);

		// 업로드를 위해 보내진 photo라는 이름의 파일정보
		MultipartFile photo = vo.getImage();

		String difilename = "no_file";

		// 업로드 된 파일이 존재한다면
		if (!photo.isEmpty()) {
			// 업로드된 실제 파일의 이름
			difilename = photo.getOriginalFilename();

			// 저장할 파일의 경로
			File saveFile = new File(savePath, difilename);

			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else { // 이름 중복되도 갱신되지않고 따로 들어가게 하기 위함
				// 동일파일명에 대한 이름 수정
				long time = System.currentTimeMillis();
				difilename = String.format("%d_%s", time, difilename);
				saveFile = new File(savePath, difilename);
			}

			try {
				photo.transferTo(saveFile); // 없으면 파일형태로 만들어져서 꼭 있어야됨
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// vo에 파일명 세팅 후 DB에 insert
		vo.setDifilename(difilename);
		board_dao.diinsertUser(vo); // DAO로 가서 insertUser메서드 만들어야함

		// Controller에서 url매핑을 호출해야 하는 경우
		return "redirect:diary_list.do";
	}

	// 글쓰기 종류 선택
	@RequestMapping("move_selected.do")
	public String moveSel(@RequestParam("section") String section) {

		if (section.equals("post")) {
			return PATH + "board_insert_post.jsp";
		} else if (section.equals("question")) {
			return PATH + "board_insert_question.jsp";
		} else if (section.equals("diary")) {
			return PATH + "board_insert_diary.jsp";
		}

		// 기본적으로는 board_write_post.jsp로 이동
		return PATH + "board_insert_post.jsp";
	}

	// 게시글 삭제
	// 스프링에서 Ajax를 사용하여 값을 콜백 메서드로 return할 경우
	// return되는 값이 한글일 경우 깨져서 전달되기 때문에
	// produces... <- 속성을 넣어줘야 한다
	@RequestMapping(value = "/post_delete.do", produces = "application/json;charset=UTF-8")
	@ResponseBody // Ajax로 요청받은 url메서드는 반드시 ResponseBody를 가지고 있어야 한다
	public String delPo(int idx, String photo) {

		// DAO에 idx에 해당하는 게시글 삭제하는 요청
		int res = board_dao.delPo(idx);

		String result = "삭제 실패";

		if (res != 0) {// 삭제 성공
			result = "삭제 성공";

			// 이미지가 업로드 된 게시글이 삭제 되었다면 절대경로에 저장된 이미지까지 지워줘야한다
			String webPath = "/resources/upload/";
			String savePath = application.getRealPath(webPath);

			File file = new File(savePath, photo);
			if (file.exists()) { // 이 경로에 파일 존재한다면 삭제
				file.delete();
			}
		}

		String str = String.format("[{'result':'%s'}]", result);

		// JSON구조의 str을 콜백메서드로 전달
		return "redirect:post_list.do";
	}

	// diary 삭제
	@RequestMapping(value = "/diary_delete.do", produces = "application/json;charset=UTF-8")
	@ResponseBody // Ajax로 요청받은 url메서드는 반드시 ResponseBody를 가지고 있어야 한다
	public String delDi(int diidx, String image) {

		// DAO에 idx에 해당하는 게시글 삭제하는 요청
		int res = board_dao.delDi(diidx);

		String result = "삭제 실패";

		if (res != 0) {// 삭제 성공
			result = "삭제 성공";

			// 이미지가 업로드 된 게시글이 삭제 되었다면 절대경로에 저장된 이미지까지 지워줘야한다
			String webPath = "/resources/upload/";
			String savePath = application.getRealPath(webPath);

			File file = new File(savePath, image);
			if (file.exists()) { // 이 경로에 파일 존재한다면 삭제
				file.delete();
			}
		}

		String str = String.format("[{'result':'%s'}]", result);

		// JSON구조의 str을 콜백메서드로 전달
		return str;
	}
	
	@RequestMapping(value = "/question_delete.do", produces = "application/json;charset=UTF-8")
	@ResponseBody // Ajax로 요청받은 url메서드는 반드시 ResponseBody를 가지고 있어야 한다
	public String delQa(int qaidx) {

		// DAO에 idx에 해당하는 게시글 삭제하는 요청
		int res = board_dao.delQa(qaidx);

		String result = "삭제 실패";

		if (res != 0) {// 삭제 성공
			result = "삭제 성공";

			// 이미지가 업로드 된 게시글이 삭제 되었다면 절대경로에 저장된 이미지까지 지워줘야한다
			String webPath = "/resources/upload/";
			String savePath = application.getRealPath(webPath);

			File file = new File(savePath);
			if (file.exists()) { // 이 경로에 파일 존재한다면 삭제
				file.delete();
			}
		}

		String str = String.format("[{'result':'%s'}]", result);

		// JSON구조의 str을 콜백메서드로 전달
		return str;
	}

	@RequestMapping("post_modify_form.do")
	public String modify_form(Model model, int idx) {
		BoardVO vo = board_dao.select_po(idx);

		model.addAttribute("vo", vo);
		return PATH + "post_modify_form.jsp";
	}

	@RequestMapping("/post_modify.do")
	public String modify(BoardVO vo, HttpServletRequest request) {
		// BoardVO 객체 생성 및 값 설정 부분 확인
//	    System.out.println(vo.getAnimaltype());

		int res = board_dao.update_modify(vo);
		return "redirect:post_list.do";
	}

	// diary 글 수정
	@RequestMapping("diary_modify_form.do")
	public String modify_formdi(Model model, int diidx) {
		BoardVO vo = board_dao.selectOne(diidx);

		model.addAttribute("vo", vo);
		return PATH + "diary_modify_form.jsp";
	}

	@RequestMapping("/diary_modify.do")
	public String modifydi(BoardVO vo, HttpServletRequest request) {
		// BoardVO 객체 생성 및 값 설정 부분 확인
//	    System.out.println(vo.getAnimaltype());

		int res = board_dao.update_modifydi(vo);
		return "redirect:diary_list.do";
	}
}
