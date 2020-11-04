package house.back.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "mountainhouse")
public class MountainHouseBean {

	private int mountainhouseid;
	private String mountainname;
	private String mountainhousename;
	private int mountainhouseseat;
	private int campseat;
	private String hight;
	
	
	@Id @Column(name = "MOUNTAINHOUSEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getMountainhouseid() {
		return mountainhouseid;
	}
	public void setMountainhouseid(int mountainhouseid) {
		this.mountainhouseid = mountainhouseid;
	}
	
	@Column(name = "MOUNTAINNAME")
	public String getMountainname() {
		return mountainname;
	}
	public void setMountainname(String mountainname) {
		this.mountainname = mountainname;
	}
	@Column(name = "MOUNTAINHOUSENAME")
	public String getMountainhousename() {
		return mountainhousename;
	}
	public void setMountainhousename(String mountainhousename) {
		this.mountainhousename = mountainhousename;
	}
	@Column(name = "MOUNTAINHOUSESEAT")
	public int getMountainhouseseat() {
		return mountainhouseseat;
	}
	public void setMountainhouseseat(int mountainhouseseat) {
		this.mountainhouseseat = mountainhouseseat;
	}
	@Column(name = "CAMPSEAT")
	public int getCampseat() {
		return campseat;
	}
	public void setCampseat(int campseat) {
		this.campseat = campseat;
	}
	@Column(name = "HIGHT")
	public String getHight() {
		return hight;
	}
	public void setHight(String hight) {
		this.hight = hight;
	}
	
	
}
