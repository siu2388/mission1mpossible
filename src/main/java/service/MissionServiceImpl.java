package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.MissionDAO;
import dao.MissionDAOImpl;
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
	public Map<String, Object> getPageInfo(int page) throws Exception {
		PageInfo pageInfo = new PageInfo();

		int totalCounts = missionDao.countAllMissions();
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

		int row = (page - 1) * 10 + 1;

		Map<String, Object> paging = new HashMap<>();
		paging.put("pageInfo", pageInfo);
		paging.put("startRow", row);

		return paging;
	}

//전체 미션 조회
	@Override
	public Map<String, Object> findAllMissions(Integer page) throws Exception {
		// pageInfo

		Map<String, Object> pageInfoResult = getPageInfo(page);
		int row = (int) pageInfoResult.get("startRow");

		List<Mission> missionList = missionDao.selectMissionList(row - 1);
		System.out.println(missionList);

		// 맵에 담아서 전달
		Map<String, Object> result = new HashMap<>();
		result.put("pageInfo", pageInfoResult.get("pageInfo"));
		result.put("missionList", missionList);
		return result;

	}

}
