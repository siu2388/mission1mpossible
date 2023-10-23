package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import dao.MissionDAO;
import dao.MissionDAOImpl;
import dto.Mission;
import dto.User;
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
	public Map<String, Object> findMyMissions(Integer page, Integer userIdx) throws Exception {
		int totalCounts = missionDao.countMyMissions(userIdx);
		System.out.println("----------내 미션 총개수:" + totalCounts);

		Map<String, Object> pageInfoResult = getPageInfoMyMission(page, totalCounts);
		int adjustedPage = (int) pageInfoResult.get("startRow");

		Map<String, Object> params = new HashMap<>();
		params.put("userIdx", userIdx);
		params.put("row", adjustedPage - 1);

		List<Mission> myMissionList = missionDao.selectMyMissions(params);
		System.out.println("--------내 미션 리스트 뿌려줘 : " + myMissionList);

		// 맵에 담아서 전달
		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("myMissionList", myMissionList);

		System.out.println("------맵에 전달 되는거니??? : " + result);

		return result;
	}

	// 내 미션기록 한정 페이징처리 서비스
	@Override
	public Map<String, Object> getPageInfoMyMission(int page, int totalCounts) throws Exception {
		PageInfo pageInfo = new PageInfo();

		Map<String, Object> paging = new HashMap<>();
		int itemsPerPage = 5; // 한 페이지당 보여줄 미션 게시물 수
		int maxPage = (int) Math.ceil((double) totalCounts / itemsPerPage);

		if (maxPage == 0) {
			paging.put("pageInfo", pageInfo);
			paging.put("startRow", 1);
			return paging;
		}

		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		if (page > maxPage) {
			page = maxPage;
		}

		pageInfo.setTotalPages(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		int row = (page - 1) * itemsPerPage + 1;

		paging.put("pageInfo", pageInfo);
		paging.put("startRow", row);

		return paging;
	}

	// 페이징 처리 서비스
	@Override
	public Map<String, Object> getPageInfo(int page, int totalCounts) throws Exception {
		PageInfo pageInfo = new PageInfo();

		Map<String, Object> paging = new HashMap<>();
		int maxPage = (int) Math.ceil((double) totalCounts / 8);
		if (maxPage == 0) { // 검색결과가 0인경우 처리
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

		int row = (page - 1) * 8 + 1;

		paging.put("pageInfo", pageInfo);
		paging.put("startRow", row);

		return paging;
	}

	// 전체 미션 조회
	@Override
	public Map<String, Object> findAllMissions(Integer page) throws Exception {

		int totalCounts = missionDao.countAllMissions();
		Map<String, Object> pageInfoResult = getPageInfo(page, totalCounts);
		int row = (int) pageInfoResult.get("startRow");
//		missionService.isMissionLiked(idx, userIdx);

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
	
		Map<String, Object> pageInfoResult = getPageInfo(page, totalCounts);
		int row = (int) pageInfoResult.get("startRow");

		String strcatId = catId.toString();

		Map<String, Object> params = new HashMap<>();
		params.put("catId", strcatId);
		params.put("row", row - 1);

		List<Mission> missionListByCat = missionDao.selectMissionsByCat(params);
		System.out.println(missionListByCat);

		// 맵에 담아서 전달
		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("missionList", missionListByCat);

		return result;
	}

	// 좋아요
	@Override
	public String missionLike(Integer idx, Integer userIdx) throws Exception {
		Map<String, Object> params = new HashMap<>();

		params.put("idx", idx);
		params.put("userIdx", userIdx);

		// 1. goodidea 테이블에 데이터 있는지 확인 (
		Integer likenum = missionDao.selectMissionLike(params);

		if (likenum == null)
			likenum = 0;
		
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
		result.put("likecount", likecount);

		// 4.좋아요 수 리턴
		JSONObject jsonObj = new JSONObject(result); // by JSON.simple json으로
		return jsonObj.toJSONString(); // 최종 string 타입으로 응답
	}

	// 좋아요 했는지 확인
	@Override
	public Boolean isMissionLiked(Integer idx, Integer userIdx) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("userIdx", userIdx);
		params.put("idx", idx);

		Integer likenum = missionDao.selectMissionLike(params);

		if (likenum > 0) {
			return true;
		} else {
			return false;
		}
	}

	// 북마크 여부 조회
	@Override
	public Boolean isBookmarked(Integer idx, Integer userIdx) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("userIdx", userIdx);
		params.put("idx", idx);

		Integer bmcheck = missionDao.selectBookmarked(params);

		if (bmcheck > 0) {
			return true;
		} else {
			return false;
		}
	}

	// 북마크 여부 조회서비스 호출하고 없으면
	@Override
	public String aboutBookmark(Integer idx, Integer userIdx) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("idx", idx);
		params.put("userIdx", userIdx);

		// 북마크 테이블에 데이터 있는지 확인 (
		Integer bmcheck = missionDao.selectBookmarked(params);

		// 북마크 없을 경우 처리
		if (bmcheck == null)
			bmcheck = 0;

		Map<String, Object> result = new HashMap<>();

		// 없으면 bookmark테이블에 추가
		if (bmcheck == 0) {
			missionDao.insertBookmark(params);
			result.put("bselected", true); // 북마크 추가했다고 전달
		} else { // 없으면 북마크테이블에서 삭제
			missionDao.deleteBookmark(params);
			result.put("bselected", false);
		}

		// 북마크 여부 리턴
		JSONObject jsonObj = new JSONObject(result); // by JSON.simple json으로
		return jsonObj.toJSONString(); // 최종 string 타입으로 응답
	}

	// 나의 북마크리스트 조회
	@Override
	public Map<String, Object> findMyBookmarks(Integer page, Integer userIdx) throws Exception {
		int totalCounts = missionDao.countBookmarks(userIdx);
		System.out.println("북마크 총개수:" + totalCounts);

		Map<String, Object> pageInfoResult = getPageInfo(page, totalCounts);
		int row = (int) pageInfoResult.get("startRow");

		Map<String, Object> params = new HashMap<>();
		params.put("userIdx", userIdx);
		params.put("row", row - 1);

		List<Mission> bookmarkList = missionDao.selectBookmarks(params);

		// 맵에 담아서 전달
		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("missionList", bookmarkList);

		return result;
	}

	// 프로필카드 총 미션수
	@Override
	public Integer countTotalMissions(Integer userIdx) throws Exception {
		return missionDao.countTotalMissions(userIdx);
	}

	// 미션성공률 계산
	@Override
	public Integer calSuccessRate(Integer userIdx) throws Exception {
		Integer totalMissions = missionDao.countTotalMissions(userIdx);
		Integer successMissions = missionDao.countSuccessMissions(userIdx);

		Integer successRate = 0;
		if (totalMissions != 0) {
			successRate = (int) (successMissions * 100.0 / totalMissions);
		}

		return successRate;
	}

	// 오늘 날짜의 미션 조회
	@Override
	public Mission getMissionRegToday(Integer userIdx) throws Exception {
		return missionDao.getMissionRegToday(userIdx);
	}

	@Override
	public List<User> findMissionLikeUser(Integer missionIdx) throws Exception {
		List<User> userList = missionDao.selectMissionLikeUser(missionIdx);
		return userList;

	}

	
}
