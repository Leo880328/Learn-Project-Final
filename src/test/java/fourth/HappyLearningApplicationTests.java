package fourth;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;

import fourth.bean.CartItem;
import fourth.bean.OrderUser;
import fourth.bean.Voucher;
import fourth.dao.CartRepository;
import fourth.dao.OrderRepository;
import fourth.dao.VoucherRepository;
import fourth.service.OrderService;
import fourth.util.DateUtil;
import fourth.util.VoucherGenerate;

@DataJpaTest
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
class HappyLearningApplicationTests {
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	OrderRepository orderRepository;

	@Autowired
	VoucherRepository voucherRepository;
	
	@Autowired
	OrderService service ;
	@Test
	void contextLoads() {
		System.out.println(service);
		List<OrderUser> findAll = orderRepository.findAll();
		System.out.println(findAll);
	}

}
