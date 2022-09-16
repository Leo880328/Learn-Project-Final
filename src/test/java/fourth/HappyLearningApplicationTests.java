package fourth;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import fourth.bean.CartItem;
import fourth.dao.CartRepository;

@SpringBootTest
class HappyLearningApplicationTests {
	
	@Autowired
	CartRepository cartRepository;

	@Test
	void contextLoads() {
		
	}

}
