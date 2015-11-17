package com.uml.book.entity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 书的实体类
 * @author 寻花问柳
 *
 */
@Entity
@Table(name = "book")
public class Book {
	private Integer id;
	private String name;             //书名
	private String writer;           //作者
	private String description;      //书的具体描述
	private String bookNumber;       //书籍的数目
	private String restNumber;       //剩余的书籍数目
	private String country;          //哪一个国家
	private String style;            //书的类型
	private String bookUrl;          //存储书的图片的url
	private Set<Order> orders;       //书的借阅	

	public Book() {
		super();
	}

	public Book(Integer id, String name, String writer, String description,
			String bookNumber, String restNumber, String country, String style,
			String bookUrl, Set<Order> orders) {
		super();
		this.id = id;
		this.name = name;
		this.writer = writer;
		this.description = description;
		this.bookNumber = bookNumber;
		this.restNumber = restNumber;
		this.country = country;
		this.style = style;
		this.bookUrl = bookUrl;
		this.orders = orders;
	}
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getBookNumber() {
		return bookNumber;
	}
	public void setBookNumber(String bookNumber) {
		this.bookNumber = bookNumber;
	}

	public String getRestNumber() {
		return restNumber;
	}
	public void setRestNumber(String restNumber) {
		this.restNumber = restNumber;
	}

	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}

	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}

	public String getBookUrl() {
		return bookUrl;
	}
	public void setBookUrl(String bookUrl) {
		this.bookUrl = bookUrl;
	}

	@OneToMany(mappedBy="book")
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
	
}
