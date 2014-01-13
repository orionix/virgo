package ua.com.virgo;

import org.springframework.beans.factory.annotation.Autowired;

import ua.com.virgo.bo.NewsBusinessObject;
import ua.com.virgo.model.News;

public class Example {

	@Autowired
	private static NewsBusinessObject nbo;
	
	private static News news = new News();
	
	public static void main(String[] args) {
		
		news.setMessage("LABLA");
		news.setTitle("Bla title");
		news.setMessageStatus(1);
		news.setMessageOrder(30);
		
		nbo.save( news ); 

	}

}
