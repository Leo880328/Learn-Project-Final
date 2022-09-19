package fourth.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fourth.bean.MemberBean;

public interface MemberRepository extends JpaRepository<MemberBean, Integer> {

//	@Query(value = "from MemberBean where account and password and email  ")
//	MemberBean checkRegister(String account,String password, String email);
	MemberBean findByEmail(String email);

	MemberBean findByAccount(String account);

	// 透過帳號查詢
	@Query(value = "from MemberBean where account like concat('%',?1,'%') ")
	public List<MemberBean> findByAccountLike(String account);

}
