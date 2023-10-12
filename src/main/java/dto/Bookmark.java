package dto;

public class Bookmark {
	private int userIdx;
	private int missionId;

	public Bookmark() {

	}

	public Bookmark(int userIdx, int missionId) {
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
