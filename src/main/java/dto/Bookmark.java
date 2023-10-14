package dto;

public class Bookmark {
	private int idx;
	private int userIdx;
	private int missionIdx;

	public Bookmark() {

	}

	public Bookmark(int userIdx, int missionIdx) {
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

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

}
