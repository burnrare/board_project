package egovframework.hhg.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.hhg.board.vo.BoardVO;
import egovframework.hhg.utills.vo.FileVO;
import egovframework.hhg.utills.vo.TagVO;


@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	GalleryMapper galleryMapper;

	@Override
	public List<BoardVO> getGalleryList(BoardVO bvo) {
		return galleryMapper.getGalleryList(bvo);
	}

	@Override
	public void galleryInsertProc(BoardVO bvo) {
		galleryMapper.galleryInsertProc(bvo);
	}

	@Override
	public void getFileInsertProc(BoardVO bvo) {
		galleryMapper.getFileInsertProc(bvo);
	}

	@Override
	public BoardVO galleryPost(BoardVO bvo) {
		return galleryMapper.galleryPost(bvo);
	}

	@Override
	public List<BoardVO> galleryImgList(BoardVO bvo) {
		return galleryMapper.galleryImgList(bvo);
	}

	@Override
	public BoardVO getFile(Integer f_num) {
		return galleryMapper.getFile(f_num);
	}

	@Override
	public Integer increaseDownHit(Integer f_num) {
		return galleryMapper.increaseDownHit(f_num);
	}

	@Override
	public List<BoardVO> getTagList(BoardVO bvo) {
		return galleryMapper.getTagList(bvo);
	}

	@Override
	public void insertTagList(String tag_real_list) {			
		galleryMapper.insertTagList(tag_real_list);
	}

	@Override
	public Integer getHeartCnt(BoardVO bvo) {
		return galleryMapper.getHeartCnt(bvo);
	}

	@Override
	public void heartCheck(BoardVO bvo) {
		galleryMapper.heartCheck(bvo);
	}

	@Override
	public void heartDelCheck(BoardVO bvo) {
		galleryMapper.heartDelCheck(bvo);
	}
	
	@Override
	public List<BoardVO> searchGalleryList(BoardVO bvo) {
		return galleryMapper.searchGalleryList(bvo);
	}

	@Override
	public void galleryPostUp(BoardVO bvo) {
		galleryMapper.galleryPostUp(bvo);
	}

	@Override
	public void tagUp(BoardVO bvo) {
		galleryMapper.tagUp(bvo);
	}

	@Override
	public void fileUp(BoardVO bvo) {
		galleryMapper.fileUp(bvo);
	}

	@Override
	public void galleryPostDe(BoardVO bvo) {
		galleryMapper.galleryPostDe(bvo);
	}

	@Override
	public void tagDe(BoardVO bvo) {
		galleryMapper.tagDe(bvo);
	}

	@Override
	public void fileDe(BoardVO bvo) {
		galleryMapper.fileDe(bvo);
	}

	@Override
	public List<BoardVO> likeCnt(BoardVO bvo) {
		return galleryMapper.likeCnt(bvo);
	}

	@Override
	public Integer getGalleryCount(BoardVO bvo) {
		return galleryMapper.getGalleryCount(bvo);
	}

	@Override
	public void heartLogInsert(BoardVO bvo) {
		galleryMapper.heartLogInsert(bvo);
	}

	@Override
	public void heartLogUpdate(BoardVO bvo) {
		galleryMapper.heartLogUpdate(bvo);
	}

	@Override
	public List<BoardVO> getTagListView(BoardVO bvo) {
		return galleryMapper.getTagListView(bvo);
	}

}
