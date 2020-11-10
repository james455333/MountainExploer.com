package main.generic.model;

import javax.persistence.Embeddable;
import javax.persistence.Entity;

import org.springframework.stereotype.Component;

@Component
public class GenericTypeObject {
	
	public GenericTypeObject() {
	}
	
	private transient Integer id;
	private transient Integer seqno;
	private transient String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
