package dao;

import java.util.List;

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
		return sqlSession.selectOne("mapper.mission.selectMyMissions", userIdx);
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

}
