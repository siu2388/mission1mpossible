package service;

import java.util.List;

import dao.MissionDAO;
import dao.MissionDAOImpl;
import dto.Mission;

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

}
