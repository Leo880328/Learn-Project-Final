package fourth.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import fourth.bean.Voucher;

public interface VoucherRepository extends JpaRepository<Voucher, Integer> {
	
	public Voucher findAllByNumber(String number);
	
	public List<Voucher> findAllByStatus(Integer status);
	
}
