package ua.com.virgo.bo;

import ua.com.virgo.model.News;

public interface NewsBusinessObject {

	void save(News news);
	void update(News news);
	void delete(News news);
	News findByNewsId(Long id);
}
