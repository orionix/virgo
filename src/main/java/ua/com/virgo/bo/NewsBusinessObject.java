package ua.com.virgo.bo;

import java.util.List;

import ua.com.virgo.model.News;

public interface NewsBusinessObject {

	void save( News news );
	void update( News news );
	void delete( News news );
	public News findByNewsId( Integer id );
	public List<News> selectAll();
	public Integer getMaxOrder();
	public void updateOrder( News news, Integer messageOrder );
}
