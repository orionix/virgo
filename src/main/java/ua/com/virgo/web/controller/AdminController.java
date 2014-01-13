package ua.com.virgo.web.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ua.com.virgo.bo.NewsBusinessObject;
import ua.com.virgo.model.News;

@Controller
@RequestMapping(value = {"/admin"})
public class AdminController {
	
	final Logger logger = LoggerFactory.getLogger( AdminController.class );
	
	@Autowired
	private NewsBusinessObject nbo;
	
	@RequestMapping(method = RequestMethod.GET)
	public String admin( Locale locale, Model model ) {
		logger.info( "Inside admin method of admin controller" );
		
		return "admin";
	}
	
	@RequestMapping(method = RequestMethod.POST, consumes="application/json") 
	public String update( @RequestBody final News news, Model model, BindingResult result, HttpServletRequest httpRequest, HttpServletResponse httpResponse ) { 
		
		logger.info( "Saving text: " + news.getMessage() );
		logger.info( "HttpRequest " + httpRequest );
		logger.info( "HttpResponse " + httpResponse );

		nbo.save( news ); 
		
		return "redirect:/admin"; 
	}
}
