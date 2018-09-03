package cn.smileyan.boot.main.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Room {
	@Id
	@GeneratedValue
	private Integer room_id;
	
	private Integer cenima_id;
	
	public Integer getRoom_id() {
		return room_id;
	}
	public void setRoom_id(Integer room_id) {
		this.room_id = room_id;
	}
	public Integer getCenima_id() {
		return cenima_id;
	}
	public void setCenima_id(Integer cenima_id) {
		this.cenima_id = cenima_id;
	}
}
