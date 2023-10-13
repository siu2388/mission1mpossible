package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import dao.MissionDAO;
import dao.MissionDAOImpl;
import dto.Bookmark;
import dto.Mission;
import util.PageInfo;

public class MissionServiceImpl implements MissionService {

	private MissionDAO missionDao;

	public MissionServiceImpl() {
		missionDao = new MissionDAOImpl();
	}

	@Override
	public void createTodayMission(Mission mission) throws Exception {
		missionDao.insertMission(mission);
	}

	@Override
	public void modifyTodayMission(Mission mission) throws Exception {
		missionDao.updateMission(mission);
	}

	@Override
	public void updateSuccessOrFail(Mission mission) throws Exception {
		missionDao.updateSuccessOrFail(mission);
	}

	// 미션 idx 로 오늘의 미션 상세조회
	@Override
	public Mission detailTodayMission(Integer idx) throws Exception {
		return missionDao.selectMission(idx);
	}

	// 나의 미션기록 조회
	@Override
	public List<Mission> findMyMissions(Integer userIdx) throws Exception {
		return missionDao.selectMyMissions(userIdx);
	}

	@Override
	public Integer selectTotalMissions(Integer userIdx) throws Exception {
		return missionDao.selectTotalMissions(userIdx);
	}

	@Override
	public Integer calculateSuccessRate(Integer userIdx) throws Exception {
		return missionDao.calculateSuccessRate(userIdx);
	}

	@Override
	public Map<String, Object> findAllMissions(Integer page) throws Exception {
		// 페이지네이션
		PageInfo pageInfo = new PageInfo();

		int totalCounts = missionDao.countAllMissions(); // 전체 미션의 개수 조회
		int maxPage = (int) Math.ceil((double) totalCounts / 10);
		int startPage = (page - 1) / 10 * 10 + 1; // 1,11,21,31,...
		int endPage = startPage + 10 - 1; // 10,20,30...
		if (endPage > maxPage)
			endPage = maxPage;
		if (page > maxPage)
			page = maxPage;

		pageInfo.setTotalPages(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		int row = (page - 1) * 10 + 1; // 현재 페이지의 시작 row

		List<Mission> missionList = missionDao.selectMissionList(row - 1);

		// 맵에 담아서 전달
		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfo);
		result.put("missionList", missionList);
		return result;

	}

	@Override
	public String getMissionLikeStatus(Integer userIdx, Integer missionIdx) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("userIdx", userIdx);
		param.put("missionIdx", missionIdx);
		// 1. missionlike 테이블에 데이터 있는지 확인(missionIdx, missionIdxs)
		Integer likenum = missionDao.selectMissionLike(param);

		Map<String, Object> res = new HashMap<>();
		if (likenum == null) { // 2-1. 없으면
			missionDao.insertMissionLike(param); // missionlike에 삽입
			missionDao.plusMissionLikeCount(missionIdx); // mission 테이블에 좋아요수 증가
			res.put("select", true);
		} else { // 2-2. 있으면
			missionDao.deleteMissionLike(param); // missionlike에서 삭제
			missionDao.minusMissionLikeCount(missionIdx); // mission 테이블에 좋아요수 감소
			res.put("select", false);
		}
		// 4. 좋아요 수
		Integer likecount = missionDao.selectMissionLikeCount(missionIdx);
		res.put("likecount", likecount);

		JSONObject jsonObj = new JSONObject(res);
		return jsonObj.toJSONString();

	}

	@Override
	public Boolean isMissionLike(Integer userIdx, Integer missionIdx) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("userIdx", userIdx);
		param.put("missionIdx", missionIdx);
		Integer likenum = missionDao.selectMissionLike(param);
		if (likenum == null) {
			return false;
		}

		return true;
	}

	// 북마크 가져오기
	@Override
	public List<Bookmark> getBookmark(int userIdx) throws Exception {
		return missionDao.getBookmark(userIdx);

	}
	
	// 북마크 추가
	@Override
	public void insertBookmark(Bookmark bookmark) throws Exception {
		missionDao.insertBookmark(bookmark);
		
	}

}
