package ua.com.virgo.bo.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.com.virgo.bo.NewsBusinessObject;
import ua.com.virgo.dao.NewsDao;
import ua.com.virgo.dao.impl.NewsDaoImpl;
import ua.com.virgo.model.News;

@Service
@Repository
@Transactional
public class NewsBusinessObjectImpl implements NewsBusinessObject {
	 
	/*@Autowired
	NewsDao newsDao;
	
	public void setNewsDao(NewsDao тewsDao) {
		this.newsDao = newsDao;
	}*/
	
	private Log log = LogFactory.getLog(NewsBusinessObjectImpl.class);
	
	@PersistenceContext 
	private EntityManager em; 

	@Override
	public void save(News news) {
		if (news.getId() == null) { // вставить новость 
			log.info("Inserting new news"); 
			em.persist(news); 
		} else { // обновить новость 
			em.merge(news); 
			log.info("Updating existing news"); 
			log.info("News saved with id: " + news.getId()); 
		}
	}

	@Override
	public void update(News news) {
		//newsDao.update(news);

	}

	@Override
	public void delete(News news) {
		//newsDao.delete(news);

	}

	@Override
	public News findByNewsId(Long id) {
		return null;//newsDao.findByNewsId(id);
	}

}
