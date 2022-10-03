package fourth.util;

import org.springframework.beans.factory.annotation.Autowired;

import fourth.bean.Voucher;
import fourth.dao.VoucherRepository;

public class VoucherGenerate {
	
	@Autowired
	private VoucherRepository voucherRepository;
		
	
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
		for (int i = 0 ; i <= 100; i++) {
			String randomNumber = VoucherGenerate.randomNumber();
			double ranDis = VoucherGenerate.ranDis();
			Voucher voucher = new Voucher(0, randomNumber, ranDis, 1);
			this.voucherRepository.save(voucher);
			voucherRepository.save(voucher);
			
		}
	}
	public static void main(String[] args) {
		VoucherGenerate generate = new VoucherGenerate();
		generate.insertVoucher();
			
	}
}
