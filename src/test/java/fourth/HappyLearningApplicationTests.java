package fourth;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import fourth.bean.CartItem;
import fourth.bean.OrderUser;
import fourth.dao.CartRepository;
import fourth.dao.OrderRepository;
import fourth.util.DateUtil;


class HappyLearningApplicationTests {
	
	@Autowired
	CartRepository cartRepository;
	
	@Autowired
	OrderRepository orderRepository;

	@Test
	void contextLoads() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String format = dateFormat.format(new Date());
		System.out.println(format);
		try {
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
