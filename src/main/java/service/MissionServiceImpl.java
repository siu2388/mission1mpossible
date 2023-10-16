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
		Map<String, Object> paging = new HashMap<>();
		int maxPage = (int) Math.ceil((double) totalCounts / 10);
		
		if(maxPage==0) {
			paging.put("pageInfo", pageInfo);
			paging.put("startRow", 1);
			return paging;
		}
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

		System.out.println("페이징처리에서 받은 토탈카운트:" + totalCounts);

		int row = (page - 1) * 10 + 1;


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

		List<Mission> missionList = missionDao.selectMissionList(row - 1);
		System.out.println(missionList);

		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("missionList", missionList);

		return result;
	}

	// 카테고리별 미션 리스트조회
	@Override
	public Map<String, Object> findhMissionsByCat(Integer page, Integer catId) throws Exception {

		int totalCounts = missionDao.countMissions(catId);
		System.out.println("미션 총개수:" + totalCounts);

		Map<String, Object> pageInfoResult = getPageInfo(page, totalCounts);
		int row = (int) pageInfoResult.get("startRow");
		System.out.println("row :" + row);

		String strcatId = catId.toString();

		Map<String, Object> params = new HashMap<>();
		params.put("catId", strcatId);
		params.put("row", row - 1);
		System.out.println("params를 찍으면:" + params);

		List<Mission> missionListByCat = missionDao.selectMissionsByCat(params);
		System.out.println(missionListByCat);

		// 맵에 담아서 전달
		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("missionList", missionListByCat);


		return result;
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

	// 좋아요
	@Override
	public String missionLike(Integer idx, Integer userIdx) throws Exception {
		Map<String, Object> params = new HashMap<>();

		params.put("idx", idx);
		params.put("userIdx", userIdx);

		System.out.println("서비스idx: " + idx);
		System.out.println("userIdx:" + userIdx);

		// 1. goodidea 테이블에 데이터 있는지 확인 (
		Integer likenum = missionDao.selectMissionLike(params);

		if (likenum == null)
			likenum = 0;
		System.out.println("서비스likenum" + likenum);
		Map<String, Object> result = new HashMap<>();

		// 2-1 없으면 goodidea에 삽입
		if (likenum == 0) {
			missionDao.insertMissionLike(params);
			missionDao.plusMissionLikeCount(idx); // 미션테이블에 좋아요 수 증가
			result.put("selected", true); // 내가 좋아요했다고 응답용
		} else { // 2-2. 있으면 goodidea에서 삭제
			missionDao.deleteMissionLike(params);
			missionDao.minusMissionLikeCount(idx);
			result.put("selected", false);
		}
		// 3.전체 좋아요 수
		Integer likecount = missionDao.selectMissionLikeCount(idx);
		System.out.println("서비스 likecount: " + likecount);
		result.put("likecount", likecount);
		System.out.println("result: " + result);

		// 4.좋아요 수 리턴
		JSONObject jsonObj = new JSONObject(result); // by JSON.simple json으로
		System.out.println("toJSON" + jsonObj.toString());
		return jsonObj.toJSONString(); // 최종 string 타입으로 응답
	}

	@Override
	public Boolean isMissionLiked(Integer idx, Integer userIdx) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("userIdx", userIdx);
		params.put("idx", idx);
		// Integer likenum = missionDao.selectMissionLike(params);

		Integer likenum = missionDao.selectMissionLike(params);
		System.out.println(missionDao.selectMissionLike(params));
		System.out.println("좋아요?: " + likenum);

		if (likenum > 0) {
			return true;
		} else {
			return false;
		}
//		if (likenum == null)
//			return false;
//		return true;
	}

}
