package ua.com.virgo.web.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ua.com.virgo.bo.NewsBusinessObject;
import ua.com.virgo.bo.UsersBusinessObject;
import ua.com.virgo.model.News;
import ua.com.virgo.model.Users;

@Controller
@RequestMapping(value = {"/admin", "/admin/"})
public class AdminController {
	
	final Logger logger = LoggerFactory.getLogger( AdminController.class );
	
	@Autowired
	private NewsBusinessObject nbo;
	
	@Autowired
	private UsersBusinessObject ubo;
	
	@RequestMapping(method = RequestMethod.GET)
	public String admin( Locale locale, Model model ) {
		
		logger.info( "Inside admin method of admin controller" );
		
		List<News> newsList;
		
		newsList = nbo.selectAll();
		/*
		News news = new News();
		
		news.setMessage("New message 2");
		news.setTitle("New Title 2");
		news.setMessageOrder(45);
		news.setMessageStatus(3);
		news.setIncomingDate(new Date());
		news.setChangeDate(new Date());*/
		
		//news.setId();
		/*
		logger.info( "Attempt to persist news: " + news);
		nbo.save( news );
		
		List<News> newsList = nbo.selectAll();
		logger.info( "Size of news: " + newsList.size());
		System.out.println();
		
		for(News n : newsList)
			System.out.println(n);
		*/
		model.addAttribute( "news", newsList );
		
		// If we are going to populate and display jsp page we return name of view, 
		// other words name of jsp (without .jsp) - here we call admin.jsp
		return "admin";
	}
	
	@RequestMapping(method = RequestMethod.POST, consumes="application/json") 
	public String create( @RequestBody final News news, Model model, BindingResult result, HttpServletRequest httpRequest ) { 
		
		if ( news.getMessageOrder() == null ) {
			news.setMessageOrder( nbo.getMaxOrder().intValue() + 10 );
		}
		
		if ( news.getTitle() == null || news.getTitle() == "") {
			news.setTitle( "New message, with message order = " + news.getMessageOrder().toString() );
		}
		
		if ( news.getMessageStatus() == null ) {
			news.setMessageStatus( 3 );
		}
		
		if ( news.getIncomingDate() == null ) {
			news.setIncomingDate( new Date() );
		}
		
		news.setChangeDate( new Date() );
		
		logger.info( "Saving text: " + news );	

		nbo.save( news );
		
		return "redirect:/admin"; 
	}
	
	@RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.GET) 
	public @ResponseBody String update( @PathVariable ("id") Integer id, Model model ) {
		logger.info( "Deleting news, id: " + id );
		
		News news = nbo.findByNewsId( id );
		nbo.delete( news );
		
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET) 
	public @ResponseBody News updateForm( @PathVariable ("id") Integer id, Model model ) {	
		logger.info( "Updating news, id: " + id );		
		
		News news = nbo.findByNewsId( id );
		logger.info( "NEWS: " + news.toString() );		
	
		return news;
	}
	
	@RequestMapping(value = "/updateMessageOrder/{id}", method = RequestMethod.GET) 
	public @ResponseBody News updateMessageOrder( @PathVariable ("id") Integer id, @RequestParam(value = "messageOrder", required = false) Integer messageOrder, Model model ) {	
		logger.info( "Inside updateMessageOrder" );	
		
		News news = nbo.findByNewsId( id );
		nbo.updateOrder( news, messageOrder );				
	
		return news;
	}
	
	@RequestMapping(value = {"/users"}, method = RequestMethod.GET)
	public String usersList( Locale locale, Model model ) {
		
		logger.info( "Inside usersList method" );
		
		List<Users> usersList;		
		usersList = ubo.selectAll();		
		model.addAttribute( "users", usersList );
		
		// If we are going to populate and display jsp page we return name of view, 
		// other words name of jsp (without .jsp) - here we call userlist.jsp
		return "userslist";
	}
}

/*
@Controller
@RequestMapping(value = {"/admin/users"})
public class AdminUsersController {
	
	final Logger logger = LoggerFactory.getLogger( AdminUsersController.class );
	
	@Autowired
	private UsersBusinessObject ubo;
	
	
}
*/