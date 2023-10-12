package dao;

import java.util.List;

import dto.Mission;

public interface MissionDAO {
	void insertMission(Mission mission) throws Exception;

	// 오늘의 미션 수정
	void updateMission(Mission mission) throws Exception;

	// 미션 성공/실패 updqte
	void updateSuccessOrFail(Mission mission) throws Exception;

	// 오늘의 미션 상세보기 by missionIdx
	Mission selectMission(Integer idx) throws Exception;

	// 나의 미션기록 조회
	List<Mission> selectMyMissions(Integer userIdx) throws Exception;

	// 총 미션 수 조회
	Integer selectTotalMissions(Integer userIdx) throws Exception;

	// 성공률 계산
	Integer calculateSuccessRate(Integer userIdx) throws Exception;
}
