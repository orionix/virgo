package ua.com.virgo.bo.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ua.com.virgo.bo.UsersBusinessObject;
import ua.com.virgo.model.Users;

@Service
@Repository
@Transactional
public class UsersBusinessObjectImpl implements UsersBusinessObject {
	
	private Log log = LogFactory.getLog( UsersBusinessObjectImpl.class );
	
	private static final String SELECT_ALL_QUERY = "select n from Users n";
	
	@PersistenceContext 
	private EntityManager em;
	
	public EntityManager getEntityManager() {
		return em;
	}
	
	public void setEntityManager( EntityManager em ) {
		this.em = em;
	}

	@Override
	public void save( Users user ) {
		if ( user.getUserId() == null ) {  	// New user creation
			log.info( "Inserting new user" );
			log.info( "user inside UsersBusinessObject " + user );
			
			em.persist( user );
			em.flush();
			
		} else { 							// User update			 
			log.info( "Updating existing user" ); 
			log.info( "User saved with id: " + user.getUserId() );
			em.merge( user );
			em.flush();
		}
	}

	@Override
	public void delete( Users user ) {
		log.info( "Deleting existing user:" + user );
		user = em.merge( user );
		em.remove( user );
		em.flush();
	}

	@Override
	public Users findByUserId( Integer id ) {
		Users user = em.find( Users.class, id );
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> selectAll() {
		Query query = em.createQuery( SELECT_ALL_QUERY );
		List<Users> usersList = ( List<Users> ) query.getResultList();
		return usersList;
	}
}
