package ua.com.virgo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ua.com.virgo.model.News;

public interface NewsRepository extends JpaRepository<News, Long> {

}
