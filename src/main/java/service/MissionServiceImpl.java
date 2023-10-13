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

}
