package ua.com.virgo.dao.impl;

import javax.persistence.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.hibernate.ejb.*;
import org.springframework.stereotype.Repository;

import ua.com.virgo.dao.NewsDao;
import ua.com.virgo.model.News;

@Repository("newsDao")
//@Transactional
public class NewsDaoImpl implements NewsDao {
	
	//private EntityManager entityManager;
	//private Entity entity;
	private SessionFactory sessionFactory;
	private Log log = LogFactory.getLog(NewsDaoImpl.class);

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	@Override
	public void save(News news) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(News news) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(News news) {
		// TODO Auto-generated method stub

	}

	@Override
	public News findByNewsId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
