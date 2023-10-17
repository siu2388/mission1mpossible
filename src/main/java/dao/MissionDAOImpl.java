package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Mission;
import util.MybatisSqlSessionFactory;

public class MissionDAOImpl implements MissionDAO {

	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	// 미션 등록
	@Override
	public void insertMission(Mission mission) throws Exception {
		sqlSession.insert("mapper.mission.insertMission", mission);
		sqlSession.commit();
	}

	// 오늘의 미션 수정
	@Override
	public void updateMission(Mission mission) throws Exception {
		sqlSession.update("mapper.mission.updateMission", mission);
		sqlSession.commit();
	}

	// 미션 성공 / 실패 업뎃
	@Override
	public void updateSuccessOrFail(Mission mission) throws Exception {
		sqlSession.update("mapper.mission.updateSuccessOrFail", mission);
		sqlSession.commit();
	}

	// 미션 상세 조회 by missionIdx
	@Override
	public Mission selectMission(Integer idx) throws Exception {
		return sqlSession.selectOne("mapper.mission.selectMission", idx);
	}

	// 나의 미션기록 조회
	@Override
	public List<Mission> selectMyMissions(Integer userIdx) throws Exception {
		return sqlSession.selectList("mapper.mission.selectMyMissions", userIdx);
	}

	// 총 미션수 계산 by userIdx

	@Override
	public Integer countTotalMissions(Integer userIdx) throws Exception {

		return sqlSession.selectOne("mapper.mission.countTotalMissions", userIdx);
	}

	// 성공률 계산
	@Override
	public Map<String, Object> calculateMissionSuccessRate(Integer userIdx) throws Exception {
		return sqlSession.selectOne("mapper.mission.calculateMissionSuccessRate", userIdx);
	}

	// 미션 전체 리스트 조회
	@Override
	public List<Mission> selectMissionList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.mission.selectAllMissions", row);
	}

	// 미션 총 개수 반환
	@Override
	public Integer countAllMissions() throws Exception {
		return sqlSession.selectOne("mapper.mission.countAllMissions");
	}

	// 카테고리별 미션 리스트 조회
	@Override
	public List<Mission> selectMissionsByCat(Map<String, Object> params) throws Exception {
		return sqlSession.selectList("mapper.mission.selectMissionsByCat", params);
	}

	// 카테고리별 총 미션 개수 반환
	@Override
	public Integer countMissions(Integer catId) throws Exception {
		return sqlSession.selectOne("mapper.mission.countMissions", catId);
	}

	// 좋아요 수 카운트
	@Override
	public Integer selectMissionLikeCount(Integer idx) throws Exception {
		return sqlSession.selectOne("mapper.mission.selectMissionLikeCount", idx);
	}

	// 좋아요 수 증가 + 1
	@Override
	public void plusMissionLikeCount(Integer idx) throws Exception {
		sqlSession.update("mapper.mission.plusMissionLikeCount", idx);
		sqlSession.commit();
	}

	// 좋아요 수 감소 - 1
	@Override
	public void minusMissionLikeCount(Integer idx) throws Exception {
		sqlSession.update("mapper.mission.minusMissionLikeCount", idx);
		sqlSession.commit();
	}

	// 좋아요 여부 조회 있으면 1 없으면 0
	@Override
	public Integer selectMissionLike(Map<String, Object> params) throws Exception {
		return sqlSession.selectOne("mapper.goodidea.selectMissionLiked", params);
	}

	@Override
	public void insertMissionLike(Map<String, Object> params) throws Exception {
		sqlSession.insert("mapper.goodidea.insertMissionLike", params);
		sqlSession.commit();

	}

	@Override
	public void deleteMissionLike(Map<String, Object> params) throws Exception {
		sqlSession.delete("mapper.goodidea.deleteMissionLike", params);
		sqlSession.commit();
	}

	// 북마크한 여부 조회
	@Override
	public Integer selectBookmarked(Map<String, Object> params) throws Exception {
		return sqlSession.selectOne("mapper.bookmark.selectBookmarked", params);
	}

	// 북마크테이블에 추가
	@Override
	public void insertBookmark(Map<String, Object> params) throws Exception {
		sqlSession.insert("mapper.bookmark.insertBookmark", params);
		sqlSession.commit();
	}

	// 북마크테이블에서 삭제
	@Override
	public void deleteBookmark(Map<String, Object> params) throws Exception {
		sqlSession.delete("mapper.bookmark.deleteBookmark", params);
		sqlSession.commit();
	}

	// 내가 북마크한리스트 조회
	@Override
	public List<Mission> selectBookmarks(Map<String, Object> params) throws Exception {
		return sqlSession.selectList("mapper.mission.selectMyBookmarks", params);
	}

	// 북마크한개수
	@Override
	public Integer countBookmarks(Integer userIdx) throws Exception {
		return sqlSession.selectOne("mapper.mission.countMyBookmarks", userIdx);
	}

		// 오늘 날짜의 미션 조회
		@Override
		public Mission getMissionRegToday(Integer userIdx) throws Exception {
			return sqlSession.selectOne("mapper.mission.getMissionRegToday", userIdx);
		}
}
