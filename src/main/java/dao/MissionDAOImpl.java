package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Bookmark;
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
	public Integer selectTotalMissions(Integer userIdx) throws Exception {
		return sqlSession.selectOne("mapper.mission.selectTotalMissions", userIdx);
	}

	// 성공률 계산
	@Override
	public Integer calculateSuccessRate(Integer userIdx) throws Exception {
		return sqlSession.selectOne("mapper.mission.calculateSuccessRate", userIdx);
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

	//카테리별 총 미션 개수 반환
	@Override
	public Integer countMissions(Integer catId) throws Exception {
		return sqlSession.selectOne("mapper.mission.countMissions", catId);
	}


	// 좋아요 수 카운트
	@Override
	public Integer selectMissionLikeCount(Integer idx) throws Exception {
		return sqlSession.selectOne("mapper.board.selectMissionLikeCount", idx);
	}

	// 좋아요 수 증가 + 1
	@Override
	public void plusMissionLikeCount(Integer idx) throws Exception {
		sqlSession.update("mapper.board.plusMissionLikeCount", idx);
		sqlSession.commit();
	}

	// 좋아요 수 감소 - 1
	@Override
	public void minusMissionLikeCount(Integer idx) throws Exception {
		sqlSession.update("mapper.board.minusMissionLikeCount", idx);
		sqlSession.commit();

	}

	// 좋아요 누른 여부
	@Override
	public Integer selectMissionLike(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.missionlike.selectMissionLike", param);
	}

	// 좋아요 추가

	@Override
	public void insertMissionLike(Map<String, Object> param) throws Exception {
		sqlSession.insert("mapper.missionlike.insertMissionLike", param);
		sqlSession.commit();

	}

	// 좋아요 제거
	@Override
	public void deleteMissionLike(Map<String, Object> param) throws Exception {
		sqlSession.delete("mapper.missionlike.deleteMissionLike", param);
		sqlSession.commit();
	}

	@Override
	public void insertBookmark(Bookmark bookmark) throws Exception {
		sqlSession.insert("mapper.bookmark.insertBookmark", bookmark);
		sqlSession.commit();
	}

	@Override
	public List<Bookmark> getBookmark(int userIdx) throws Exception {
		return sqlSession.selectList("mapper.bookmark.getBookmark", userIdx);
	}

	
}
