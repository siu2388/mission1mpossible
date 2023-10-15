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

	// 페이징 처리 서비스
	@Override
	public Map<String, Object> getPageInfo(int page, int totalCounts) throws Exception {
		PageInfo pageInfo = new PageInfo();

		int maxPage = (int) Math.ceil((double) totalCounts / 10);
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage)
			endPage = maxPage;
		if (page > maxPage)
			page = maxPage;

		pageInfo.setTotalPages(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		System.out.println("페이징처리에서 받은 토탈카운트:"+totalCounts);
		
		int row = (page - 1) * 10 + 1;

		Map<String, Object> paging = new HashMap<>();
		paging.put("pageInfo", pageInfo);
		paging.put("startRow", row);

		return paging;
	}

//전체 미션 조회
	@Override
	public Map<String, Object> findAllMissions(Integer page) throws Exception {


		int totalCounts = missionDao.countAllMissions();
		Map<String, Object> pageInfoResult = getPageInfo(page, totalCounts);
		int row = (int) pageInfoResult.get("startRow");

		List<Mission> missionList = missionDao.selectMissionList(row-1);
		System.out.println(missionList);

		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("missionList", missionList);
		
		return result;
	}
	
	//카테고리별 미션 리스트조회 
	@Override
	public Map<String, Object> findhMissionsByCat(Integer page, Integer catId) throws Exception {
		
		int totalCounts = missionDao.countMissions(catId);
		System.out.println("미션 총개수:" + totalCounts);
		
		Map<String, Object> pageInfoResult = getPageInfo(page, totalCounts);
		int row = (int) pageInfoResult.get("startRow");
		System.out.println("row :"+row);
		
		String strcatId = catId.toString();
		
		Map<String, Object> params = new HashMap<>();
	  params.put("catId", strcatId);
	  params.put("row", row -1);
	  System.out.println("params를 찍으면:" +params);

		List<Mission> missionListByCat = missionDao.selectMissionsByCat(params);
		System.out.println(missionListByCat);

		// 맵에 담아서 전달
		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("missionList", missionListByCat);
		
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
