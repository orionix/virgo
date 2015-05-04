package ua.com.virgo.bo.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;

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
	
	public void setNewsDao(NewsDao òewsDao) {
		this.newsDao = newsDao;
	}*/
	
	private Log log = LogFactory.getLog( NewsBusinessObjectImpl.class );
	
	private static final String SELECT_ALL_QUERY 		= "select n from News n";
	private static final String GET_MAX_ORDER	 		= "select max(n.messageOrder) from News n";
	//private static final String UPDATE_MESSAGE_ORDER 	= "update n from News n where n.id ";
	
	@PersistenceContext 
	private EntityManager em;
	
	public EntityManager getEntityManager() {
		return em;
	}
	
	public void setEntityManager( EntityManager em ) {
		this.em = em;
	}

	@Override
	public void save( News news ) {
		if ( news.getId() == null ) { 			// Saving news 
			log.info( "Inserting new news" );
			log.info( "news inside NewsBusinessObject " + news );
			
			em.persist( news );
			em.flush();
			//em.clear();
			
		} else { 								// Updating news
			log.info( "Updating existing news" ); 
			log.info( "News saved with id: " + news.getId() );
			em.merge( news );
			em.flush();
			//em.clear();
		}
	}

	@Override
	public void update( News news ) {
		//newsDao.update(news);

	}

	@Override
	public void delete( News news ) {
		log.info( "Deleting existing news:" + news );
		news = em.merge( news );
		em.remove( news );
		em.flush();
	}

	@Override
	public News findByNewsId( Integer id ) {
		News news = em.find( News.class, id );
		return news;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<News> selectAll() {
		Query query = em.createQuery( SELECT_ALL_QUERY );
		List<News> newsList = ( List<News> ) query.getResultList();
		return newsList;
	}

	@Override
	public Integer getMaxOrder() {
		Query query = em.createQuery( GET_MAX_ORDER );
		Object maxOrder = query.getSingleResult();
		 
		return maxOrder == null ? 0 : ( Integer ) maxOrder;
	}

	@Override
	public void updateOrder( News news, Integer messageOrder ) {
		log.info( "Updating messageOrder:" + messageOrder + " of the news: " + news );
		news.setMessageOrder( messageOrder );
		em.merge( news );
		em.flush();
	}
}
