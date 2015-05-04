package ua.com.virgo.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="download")
public class DownloadController {

	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);
	
	@RequestMapping(method = RequestMethod.GET)
	public void download(HttpServletResponse response) {
		File docFile;
        Resource resource = new ClassPathResource("application_form.doc");
        
		try {            
			docFile = resource.getFile();	    			
	    		
	        logger.info("File " + resource.getFilename() + " downloading");	            
	            
	        if (docFile.exists()) {
	        	response.setContentType("application/doc");                
	            response.setContentLength(new Long(docFile.length()).intValue());
	            response.setHeader("Content-Disposition", "attachment; filename=application_form.doc");            		            	
	            FileCopyUtils.copy(new FileInputStream(docFile), response.getOutputStream());
	        } else {
	            System.out.println("File" + docFile + "(" + docFile.getAbsolutePath() + ") does not exist");
	        }
	    } catch (IOException ioe) {
	    	ioe.printStackTrace();
		}
	}	
}