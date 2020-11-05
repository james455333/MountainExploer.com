package product.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "second_class")
public class SecondClass {
	@Id@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Transient
	private String firstClassId;
	
	@ManyToOne(fetch = FetchType.LAZY )
	@JoinColumn( name = "FIRST_CLASS_ID",referencedColumnName = "ID")
	private FirstClass firstClass;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "secondClass")
	private Set<ItemBasic> itemBasics =new HashSet<ItemBasic>();
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getFirstClassId() {
		return firstClassId;
	}
	public void setFirstClassId(String firstClassId) {
		this.firstClassId = firstClassId;
	}

	public FirstClass getFirstClass() {
		return firstClass;
	}
	public void setFirstClass(FirstClass firstClass) {
		this.firstClass = firstClass;
	}
	
	public Set<ItemBasic> getItemBasics() {
		return itemBasics;
	}
	public void setItemBasics(Set<ItemBasic> itemBasics) {
		this.itemBasics = itemBasics;
	}
	
	
	
	
	
	
}
