package fourth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.Voucher;
import fourth.dao.VoucherRepository;
import fourth.util.VoucherGenerate;

@Service
@Transactional
public class VoucherService {
	
	@Autowired
	private  VoucherRepository voucherRepository;
		
	
	public static  String randomNumber() {
		String number ="" ;
		
		String ran ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		
		
		for (int i = 0 ; i < 12; i++) {
			int n = (int)(Math.random() * 62) ;
			number += ran.charAt(n);
		}
		return number;
	}
	
	public static double ranDis() {
		int d = (int)(Math.random()*100);
		return (5*(Math.round(d/5)))/100.0;
	}
	
	
	public   void insertVoucher() {
		for (int i = 0 ; i <= 200; i++) {
			String randomNumber = VoucherGenerate.randomNumber();
			double ranDis = VoucherGenerate.ranDis();
			if (ranDis == 0.0) {
				continue;
			}
			Voucher voucher = new Voucher(0, randomNumber, ranDis, 1);
			voucherRepository.save(voucher);
			
		}
	}
	
	
	public Voucher findByNumber(String number) {
		System.out.println(number);
		Voucher voucher = voucherRepository.findAllByNumber(number);
		System.out.println(voucher);
		return voucher;
	}
	
	public void useVoucher(String number) {
		Voucher voucher = voucherRepository.findAllByNumber(number);
		voucher.setstatus(0);
		voucherRepository.save(voucher);
	}

	public Voucher randomVoucher() {
		List<Voucher> vouchers = voucherRepository.findAll();
		int ran = (int)(Math.random() * vouchers.size());
		Voucher voucher = vouchers.get(ran);
		return voucher;
	}

	public Voucher randomVoucherUse() {
		List<Voucher> list = voucherRepository.findAllByStatus(0);
		int ran = (int)(Math.random() * list.size());
		Voucher voucher =list.get(ran);
		return voucher;
	}
}
