package ua.com.virgo.dao;

import ua.com.virgo.model.News;

public interface NewsDao {

	void save(News news);
	void update(News news);
	void delete(News news);
	News findByNewsId(Long id);
}