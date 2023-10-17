package dao;

import java.util.List;
import java.util.Map;

import dto.Mission;

public interface MissionDAO {
	void insertMission(Mission mission) throws Exception;

	// 오늘의 미션 수정
	void updateMission(Mission mission) throws Exception;

	// 미션 성공/실패 updqte
	void updateSuccessOrFail(Mission mission) throws Exception;

	// 미션 전체리스트 조회
	List<Mission> selectMissionList(Integer row) throws Exception;

	// 미션 총 개수 반환 ( for 페이지네이션 적용)
	Integer countAllMissions() throws Exception;

	// 카테고리별 미션 전체리스트 조회
	List<Mission> selectMissionsByCat(Map<String, Object> params) throws Exception;

	// 카테고리별 미션 총 개수 반환 ( for 페이지네이션 적용)
	Integer countMissions(Integer catId) throws Exception;

	// 미션 상세보기 by missionIdx
	Mission selectMission(Integer idx) throws Exception;

	// 나의 미션기록 조회
	List<Mission> selectMyMissions(Integer userIdx) throws Exception;

	// 총 미션 수 조회 (프로필카드용)_
//	
//	Integer countTotalMissions(Integer userIdx) throws Exception;
//
//	// 성공률 계산
//	Map<String, Object> calculateMissionSuccessRate(Integer userIdx) throws Exception;

	// 좋아요 수 증/감/조회
	void plusMissionLikeCount(Integer idx) throws Exception;

	void minusMissionLikeCount(Integer idx) throws Exception;

	Integer selectMissionLikeCount(Integer idx) throws Exception;

	// 미션 좋아요 테이블에 추가시
	Integer selectMissionLike(Map<String, Object> params) throws Exception;

	void insertMissionLike(Map<String, Object> params) throws Exception;

	void deleteMissionLike(Map<String, Object> params) throws Exception;

	// 북마크
	// 북마크한 여부 조회
	Integer selectBookmarked(Map<String, Object> params) throws Exception;

	// 북마크테이블에 추가
	void insertBookmark(Map<String, Object> params) throws Exception;

	// 북마크테이블에서 삭제
	void deleteBookmark(Map<String, Object> params) throws Exception;

	// 내가 북마크한 리스트 조회하기
	List<Mission> selectBookmarks(Map<String, Object> params) throws Exception;

	// 카테고리별 미션 총 개수 반환 ( for 페이지네이션 적용)
	Integer countBookmarks(Integer userIdx) throws Exception;

	// 오늘 날짜의 미션 조회
	Mission getMissionRegToday(Integer userIdx) throws Exception;
}
