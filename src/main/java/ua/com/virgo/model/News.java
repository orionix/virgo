package ua.com.virgo.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import static javax.persistence.GenerationType.IDENTITY;

@Entity(name = "news2")
@Table
public class News implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Date incomingDate;
	private Date changeDate;
	private String title;
	private String message;
	private Integer messageStatus;
	private Integer messageOrder;
 
	public News() {
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name="id", unique=true, nullable=false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="incomingDate", columnDefinition="TIMESTAMP DEFAULT", nullable=false)
	public Date getIncomingDate() {
		return incomingDate;
	}

	public void setIncomingDate(Date incomingDate) {
		this.incomingDate = incomingDate;
	}

	@Column(name="changeDate", columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP", nullable=false)
	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	@Column(name="title", unique=false, nullable=false)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name="message", unique=false, nullable=false)
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name="messageStatus", unique=false, nullable=false)
	public Integer getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(Integer messageStatus) {
		this.messageStatus = messageStatus;
	}

	@Column(name="messageOrder", unique=true, nullable=false)
	public Integer getMessageOrder() {
		return messageOrder;
	}

	public void setMessageOrder(Integer messageOrder) {
		this.messageOrder = messageOrder;
	}
 
	/*public Stock(String stockCode, String stockName) {
		this.stockCode = stockCode;
		this.stockName = stockName;
	}*/
}
