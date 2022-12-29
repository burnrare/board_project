package egovframework.hhg.gallery.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.hhg.board.service.BoardService;
import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.gallery.service.GalleryService;
import egovframework.hhg.gallery.service.GalleryServiceImpl;
import egovframework.hhg.login.service.MenuService;
import egovframework.hhg.login.service.UserService;
import egovframework.hhg.login.vo.MenuVO;
import egovframework.hhg.login.vo.UserVO;

@Controller
public class GalleryController {

	@Autowired
	GalleryService galleryService;
	@Autowired
	BoardService boardService;
	@Autowired
	GalleryServiceImpl galleryImpl;
	@Autowired
	MenuService menuService;
	@Autowired
	UserService userService;

	final String uploadFolder = "C:/eGovFrameDev-4.0.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/gallery-project/fileUpload/";
	final String fileFolder = "C:/eGovFrameDev-4.0.0-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/gallery-project/fileUpload/";

	@RequestMapping(value = "/gallery/galleryList.do", method = RequestMethod.GET)
	public String galleryList(BoardVO bvo, Model model, @RequestParam("m_seq") Integer m_seq, @RequestParam(value = "searchKey", required = false) String searchKey, @RequestParam(value = "searchVal", required = false) String searchVal, HttpServletResponse response) {

		 Integer CntPerPage = 4;
		 List<BoardVO> tagListView = galleryService.getTagListView(bvo);
		 PaginationInfo pagingInfo = new PaginationInfo();
			
		 pagingInfo.setCurrentPageNo(bvo.getPageIndex());
		 pagingInfo.setRecordCountPerPage(CntPerPage); 
		 pagingInfo.setPageSize(4);

		 int lastIndex = pagingInfo.getLastRecordIndex();
		 int firstIndex = pagingInfo.getFirstRecordIndex();
		 
		 bvo.setFirstIndex(firstIndex);
		 bvo.setLastIndex(lastIndex);
		 bvo.setSearchKey(searchKey);
		 bvo.setM_seq(m_seq);
		 
		 if(searchVal != null) {
			 bvo.setSearchVal(searchVal);
		 }
		 
		 int a = galleryService.getGalleryCount(bvo); 
		 List<BoardVO> galleryList = galleryService.getGalleryList(bvo); 

		 pagingInfo.setTotalRecordCount(a);
		 
		 model.addAttribute("pageIndex", bvo.getPageIndex());
		 model.addAttribute("searchKey", bvo.getSearchKey());
		 model.addAttribute("cntPerPage", CntPerPage);
		 model.addAttribute("paging", pagingInfo); 
		 model.addAttribute("tagList", tagListView);
		 model.addAttribute("m_seq", m_seq);
		 model.addAttribute("galleryList", galleryList);

		return "gallery/galleryList";
	}

	@RequestMapping(value = "/gallery/galleryInsert.do", method = RequestMethod.GET)
	public String galleryInsert(@RequestParam("m_seq") String m_seq, Model model, HttpServletRequest request,
			HttpSession session) {
		
		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		}
		
		model.addAttribute("m_seq", m_seq);				
		
		return "gallery/galleryInsert";
	}

	@RequestMapping(value = "/gallery/galleryPost.do", method = RequestMethod.GET)
	public String galleryPost(BoardVO bvo, Model model, HttpServletRequest request, @RequestParam("m_seq") Integer m_seq, HttpSession session) {
		
		BoardVO gp = galleryService.galleryPost(bvo);
		model.addAttribute("gPost", gp);

		List<BoardVO> imgList = galleryService.galleryImgList(bvo);
		model.addAttribute("imgList", imgList);

		List<BoardVO> tagList = galleryService.getTagList(bvo);
		model.addAttribute("tagList", tagList);
		model.addAttribute("m_seq", m_seq);

		// 하트
		if(session.getAttribute("login") != null) {
			Integer userId = ((UserVO) request.getSession().getAttribute("login")).getUser_id();
			bvo.setB_writer_id(userId);
			Integer heart = galleryService.getHeartCnt(bvo);
			model.addAttribute("heart", heart);
			
			// 조회수
			Integer board_id = bvo.getBoard_id();
			bvo.setUser_id(userId);
			bvo.setBoard_id(board_id);
			
			Integer v_cnt = userService.userViewLogList(bvo);
			
			if(v_cnt == null) {
				boardService.boardCntUp(board_id);
				userService.userViewLog(bvo);
			} else {
				return "gallery/galleryPost";
			}
		}
		return "gallery/galleryPost";
	}

	@RequestMapping(value = "/gallery/galleryInsertProc.do", method = RequestMethod.POST)
	public String galleryInsertProc(BoardVO bvo, Model model, MultipartHttpServletRequest mtfq,
			HttpServletRequest request) throws IllegalStateException, IOException {

		bvo.setTy_id(1002);
		galleryService.galleryInsertProc(bvo);

		String[] tag_list = request.getParameterValues("tag_name");

		String tag_string = String.join(", ", tag_list);
		String[] tag_real_list = tag_string.split(",");
		
		if(!tag_string.isBlank()) {
			for (int i = 0; i < tag_real_list.length; i++) {
				galleryImpl.insertTagList(tag_real_list[i]);
			}
		}
		
		List<MultipartFile> ls = mtfq.getFiles("input_file");

		if(ls.get(0).getSize() != 0) {
		
			if(!ls.isEmpty()) {
				File uploadPath = new File(uploadFolder);
	
				for (MultipartFile f : ls) {
	
					String originalName = f.getOriginalFilename();
					String extension = originalName.substring(originalName.lastIndexOf("."));
	
					Long fileSize = f.getSize();
					String savedFileName = UUID.randomUUID() + extension;
					String path = uploadPath + "\\" + savedFileName;
	
					File saveFile = new File(uploadPath, savedFileName);
	
					f.transferTo(saveFile);
	
					bvo.setF_name(originalName);
					bvo.setF_uuid(savedFileName);
					bvo.setF_path(path);
					bvo.setF_size(fileSize);
					System.out.println(bvo.toString());
					galleryService.getFileInsertProc(bvo);
				}
			}
		
		}

		return "redirect:/close.do";
	}

	@RequestMapping(value = "/gallery/galleryModify.do", method = RequestMethod.GET)
	public String galleryModify(BoardVO bvo, Model model, @RequestParam("m_seq") String m_seq, HttpSession session, HttpServletRequest request) {

		if(session.getAttribute("login") == null) {			
			return "redirect:/errorPage.do";
		}
		
		BoardVO gp = galleryService.galleryPost(bvo);
		model.addAttribute("gPost", gp);

		List<BoardVO> imgList = galleryService.galleryImgList(bvo);
		model.addAttribute("imgList", imgList);

		List<BoardVO> tagList = galleryService.getTagList(bvo);
		model.addAttribute("tagList", tagList);

		return "gallery/galleryModify";

	}

	@RequestMapping(value = "/gallery/galleryPostUp.do", method = RequestMethod.POST)
	public String galleryPostUp(BoardVO bvo, Model model, MultipartHttpServletRequest mtfq, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		galleryService.galleryPostUp(bvo);
		
		String[] tag_list = request.getParameterValues("tag_name");

		String tag_string = String.join(", ", tag_list);
		String[] tag_real_list = tag_string.split(",");
		

		if(!tag_string.equals(", ") && !tag_string.isEmpty()) {
			for (int i = 0; i < tag_real_list.length; i++) {
				bvo.setTag_name(tag_real_list[i]);
				galleryImpl.tagUp(bvo);
			}
		}

		List<MultipartFile> ls = mtfq.getFiles("input_file");
		
		if(ls.get(0).getSize() != 0) {
		
			if (!ls.isEmpty()) {
	
				File uploadPath = new File(uploadFolder);
	
				for (MultipartFile f : ls) {
	
					String originalName = f.getOriginalFilename();
					String extension = originalName.substring(originalName.lastIndexOf("."));
	
					Long fileSize = f.getSize();
					String savedFileName = UUID.randomUUID() + extension;
					String path = uploadPath + "\\" + savedFileName;
	
					File saveFile = new File(uploadPath, savedFileName);
	
					f.transferTo(saveFile);
	
					bvo.setF_name(originalName);
					bvo.setF_uuid(savedFileName);
					bvo.setF_path(path);
					bvo.setF_size(fileSize);
	
					galleryService.getFileInsertProc(bvo);
				}
			}
			
		}

		return "redirect:/close.do";
	}

	// 파일 다운로드
	@RequestMapping(value = "/downloadImg.do", method = RequestMethod.GET, produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public void imgDownload(@ModelAttribute BoardVO bvo, HttpServletResponse response)
			throws Exception {

		BoardVO fileStat = galleryService.getFile(bvo.getF_num());

		String originalName = new String(fileStat.getF_name().getBytes("utf-8"), "iso-8859-1");

		String filePath = fileFolder + fileStat.getF_uuid(); // 폴더 밑에 있는 올바른 파일

		File file = new File(filePath);

		String ContentType = Files.probeContentType(file.toPath());

		// 헤더 설정
		response.setHeader("Content-Type", ContentType);
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\";");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		try (FileInputStream fis = new FileInputStream(filePath); OutputStream out = response.getOutputStream();) {
			// saveFileName을 파라미터로 넣어 inputStream 객체를 만들고
			// response에서 파일을 내보낼 OutputStream을 가져와서
			int readCount = 0;
			byte[] buffer = new byte[1024];
			// 파일 읽을 만큼 크기의 buffer를 생성한 후
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
				// outputStream에 씌워준다
			}
		} catch (Exception ex) {
			throw new RuntimeException("file Load Error");
		}

		galleryService.increaseDownHit(bvo.getF_num());
	}

	@ResponseBody
	@RequestMapping(value = "/heart.do", method = RequestMethod.POST, produces = "application/json")
	public int heart(HttpServletRequest request, @RequestBody BoardVO bvo) {

		int userId = ((UserVO) request.getSession().getAttribute("login")).getUser_id();

		bvo.setB_writer_id(userId);
		int heart = bvo.getHeart();

		if (heart >= 1) {
			galleryService.heartDelCheck(bvo);
			galleryService.heartLogUpdate(bvo);
			heart = 0;
		} else {
			galleryService.heartCheck(bvo);
			galleryService.heartLogInsert(bvo);
			heart = 1;
		}

		return heart;
	}
	
	@ResponseBody
	@RequestMapping(value = "/fileDelete.do", method = RequestMethod.POST, produces = "application/json")
	public void fileDe(HttpServletRequest request, @RequestBody BoardVO bvo) {
		Integer fnum = bvo.getF_num();
		if(fnum != 0) {
			galleryService.fileDe(bvo);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/tagDelete.do", method = RequestMethod.POST, produces = "application/json")
	public void tagDe(HttpServletRequest request, @RequestBody BoardVO bvo) {
		Integer tId = bvo.getTag_id();
		if(tId != 0) {
			galleryService.tagDe(bvo);
		}
	}
}
