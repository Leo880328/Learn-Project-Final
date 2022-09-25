package fourth.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import fourth.bean.MemberBean;

public interface MemberRepository extends JpaRepository<MemberBean, Integer> {


	
	public Optional<MemberBean> findByAccount(String account);

//	@Query(value = "from MemberBean where account =?1 and password =?2 and email=?3  ")
//	MemberBean checkRegister(String account,String password, String email);

	MemberBean findByEmail(String email);

	// 透過帳號查詢
	@Query(value = "from MemberBean where account like concat('%',?1,'%') ")
	public List<MemberBean> findByAccountLike(String account);

//	public MemberBean findByAccount(String account);
	


}
