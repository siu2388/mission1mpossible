package dto;

public class Goodidea {
	private int userIdx;
	private int missionId;

	public Goodidea() {

	}

	public Goodidea(int userIdx, int missionId) {
		this.userIdx = userIdx;
		this.missionId = missionId;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int getMissionId() {
		return missionId;
	}

	public void setMissionId(int missionId) {
		this.missionId = missionId;
	}

}
