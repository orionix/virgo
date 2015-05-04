package ua.com.virgo.bo;

import java.util.List;

import ua.com.virgo.model.Users;

public interface UsersBusinessObject {
	
	void save( Users users );
	void delete( Users users );
	public Users findByUserId( Integer id );
	public List<Users> selectAll();
}
