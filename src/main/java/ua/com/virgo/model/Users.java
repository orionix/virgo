package ua.com.virgo.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "USERS")
public class Users implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer userId;
	private String userName;
	
	public Users() {
	}
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name="userId", unique=true, nullable=false)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId( Integer userId ) {
		this.userId = userId;
	}
	
	@Column(name="userName", unique=true, nullable=false)
	public String getUserName() {
		return userName;
	}

	public void setUserName( String userName ) {
		this.userName = userName;
	}
	
	public String toString() {
		return new ToStringBuilder( this )
			.append( "userId",    userId )
			.append( "userName",  userName )
			.toString();
	 }
}
