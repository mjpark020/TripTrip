package vo;

public class areaVo {
	int areaCode;
	String areaName;
	int sigunguCode;
	String sigunguName;
	int nx;
	int ny;
	
	public areaVo() {}
	public areaVo(int areaCode, String areaName, int sigunguCode, String sigunguName, int nx, int ny) {
		super();
		this.areaCode = areaCode;
		this.areaName = areaName;
		this.sigunguCode = sigunguCode;
		this.sigunguName = sigunguName;
		this.nx = nx;
		this.ny = ny;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public int getSigunguCode() {
		return sigunguCode;
	}

	public void setSigunguCode(int sigunguCode) {
		this.sigunguCode = sigunguCode;
	}

	public String getSigunguName() {
		return sigunguName;
	}

	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}

	public int getNx() {
		return nx;
	}

	public void setNx(int nx) {
		this.nx = nx;
	}

	public int getNy() {
		return ny;
	}

	public void setNy(int ny) {
		this.ny = ny;
	}

	@Override
	public String toString() {
		return "areaVo [areaCode=" + areaCode + ", areaName=" + areaName + ", sigunguCode=" + sigunguCode
				+ ", sigunguName=" + sigunguName + ", nx=" + nx + ", ny=" + ny + "]";
	}
}
