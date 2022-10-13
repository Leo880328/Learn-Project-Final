package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.CommentsBean;

public interface CommentsRepository extends JpaRepository<CommentsBean, Integer> {

}
