package service;

import java.util.List;
import java.util.Map;

import dto.Mission;
import dto.User;

public interface MissionService {
	// 미션등록
	void createTodayMission(Mission mission) throws Exception;

	// 오늘의 미션 수정
	void modifyTodayMission(Mission mission) throws Exception;

	// 미션 성공/실패 update
	void updateSuccessOrFail(Mission mission) throws Exception;

	// 페이징 처리
	Map<String, Object> getPageInfo(int page, int totalCounts) throws Exception;

	// 미션 전체 리스트 조회 - 페이지 번호와 미션 리스트 전달
	Map<String, Object> findAllMissions(Integer page) throws Exception;

	// 카테고리별 미션 리스트 조회
	Map<String, Object> findhMissionsByCat(Integer page, Integer catId) throws Exception;

	// 오늘의 미션 상세
	Mission detailTodayMission(Integer idx) throws Exception;

	// 나의 미션기록 조회
	List<Mission> findMyMissions(Integer userIdx) throws Exception;

	// 총 미션 수(프로필카드)
	
	Integer countTotalMissions(Integer userIdx) throws Exception;
	
	//성공률 계산(프로필카드)
	
	Map<String, Object> calculateMissionSuccessRate(Integer userIdx) throws Exception;
	

	// 좋아요 세가지를 하나로 묶어서 서비스
	String missionLike(Integer idx, Integer userIdx) throws Exception;

	// 내가 좋아요를 눌렀는지 확인 goodidea 테이블에서 내정보 찾아오기
	Boolean isMissionLiked(Integer idx, Integer userIdx) throws Exception;

	// 북마크 여부 조회 후 북마크 추가 / 제거
	String aboutBookmark(Integer idx, Integer userIdx) throws Exception;

	// 북마크 했는지 조회 후
	Boolean isBookmarked(Integer idx, Integer userIdx) throws Exception;

	// 나의 북마크리스트 조회
	Map<String, Object> findMyBookmarks(Integer page, Integer userIdx) throws Exception;

	// 오늘 날짜의 미션 조회
	Mission getMissionRegToday(Integer userIdx) throws Exception;	
}
