package egovframework.hhg.gallery.service;

import java.util.List;

import egovframework.hhg.board.vo.BoardVO;

public interface GalleryService {
	public Integer getGalleryCount(BoardVO bvo);
	public List<BoardVO> getGalleryList (BoardVO bvo);
	public void galleryInsertProc (BoardVO bvo);	
	public void getFileInsertProc (BoardVO bvo);
	public BoardVO galleryPost(BoardVO bvo);
	
	public void galleryPostUp(BoardVO bvo);
	public void tagUp(BoardVO bvo);
	public void fileUp(BoardVO bvo);
	
	public void galleryPostDe(BoardVO bvo);
	public void tagDe(BoardVO bvo);
	public void fileDe(BoardVO bvo);
	
	public List<BoardVO> galleryImgList (BoardVO bvo);
	public BoardVO getFile(Integer f_num);
	public Integer increaseDownHit(Integer f_num);
	public List<BoardVO> getTagList(BoardVO bvo);
	public List<BoardVO> getTagListView(BoardVO bvo);
	public void insertTagList(String tag_real_list);
	public Integer getHeartCnt(BoardVO bvo);
	public void heartCheck(BoardVO bvo);
	public void heartDelCheck(BoardVO bvo);
	public List<BoardVO> searchGalleryList(BoardVO bvo);
	
	public List<BoardVO> likeCnt(BoardVO bvo);
	public void heartLogInsert(BoardVO bvo);
	public void heartLogUpdate(BoardVO bvo);
}
