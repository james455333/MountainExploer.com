package main.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import main.generic.model.GenericTypeObject;
@Entity
@Table(name = "systemImage")
@Component
public class SystemImage extends GenericTypeObject {
	@Id
	@Column(name = "NAME")
	private String name;
	@Column(name = "IMAGE")
	private byte[] image;
	@Override
	public String getName() {
		return name;
	}
	@Override
	public void setName(String name) {
		this.name = name;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
}
