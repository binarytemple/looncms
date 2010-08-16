package uk.mafu.domain.gillespies;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import uk.mafu.loon.domain.data.ImageLink;

@Entity
public class ProjectLink implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int pk = -1;
	@Column
	private String name;
	@OneToOne(optional = true)
	private ImageLink image;
	@OneToOne(optional = true)
	private Project project;

	public int getPk() {
		return pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ImageLink getImage() {
		return image;
	}

	public void setImage(ImageLink image) {
		this.image = image;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
}
