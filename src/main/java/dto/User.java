package dto;

import java.sql.Date;

public class User {
	private Integer idx;
	private String userId;
	private String pwd;
	private String nickname;
	private String profileImg;
	private Date createdAt;
	private Integer totalMissions;
	private Integer successRate;

	public User() {
	}

	public User(Integer idx, String userId, String pwd, String nickname, String profileImg, Date createdAt) {
		this.idx = idx;
		this.userId = userId;
		this.pwd = pwd;
		this.nickname = nickname;
		this.profileImg = profileImg;
		this.createdAt = createdAt;
	}

	public Integer getIdx() {
		return idx;
	}

	public void setIdx(Integer idx) {
		this.idx = idx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Integer getTotalMissions() {
		return totalMissions;
	}

	public void setTotalMissions(Integer totalMissions) {
		this.totalMissions = totalMissions;
	}

	public Integer getSuccessRate() {
		return successRate;
	}

	public void setSuccessRate(Integer successRate) {
		this.successRate = successRate;
	}

}
