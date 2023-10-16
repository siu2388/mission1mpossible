package dto;

public class Goodidea {
	private int userIdx;
	private int missionIdx;

	public Goodidea() {

	}

	public Goodidea(int userIdx, int missionIdx) {
		this.userIdx = userIdx;
		this.missionIdx = missionIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public int getMissionIdx() {
		return missionIdx;
	}

	public void setMissionIdx(int missionIdx) {
		this.missionIdx = missionIdx;
	}

}
