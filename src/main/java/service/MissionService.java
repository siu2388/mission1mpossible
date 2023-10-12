package service;

import java.util.List;

import dto.Mission;

public interface MissionService {
	// 미션등록
	void createTodayMission(Mission mission) throws Exception;

	// 오늘의 미션 수정
	void modifyTodayMission(Mission mission) throws Exception;

	// 미션 성공/실패 update
	void updateSuccessOrFail(Mission mission) throws Exception;

	// 오늘의 미션 상세
	Mission detailTodayMission(Integer idx) throws Exception;

	// 나의 미션기록 조회
	List<Mission> findMyMissions(Integer userIdx) throws Exception;

	// 총 미션 수
	Integer selectTotalMissions(Integer userIdx) throws Exception;

	// 성공률 계산
	Integer calculateSuccessRate(Integer userIdx) throws Exception;
}
