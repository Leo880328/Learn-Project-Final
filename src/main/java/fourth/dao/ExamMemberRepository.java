package fourth.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.MemberBean;

public interface ExamMemberRepository extends JpaRepository<MemberBean, Integer> {

}
