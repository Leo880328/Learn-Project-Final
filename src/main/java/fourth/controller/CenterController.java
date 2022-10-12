package fourth.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.client.elc.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.IndexOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import fourth.bean.MemberBean;
import fourth.bean.OrderUser;
//import fourth.bean.document.OrderUser;
//import fourth.dao.OrderElaticSearchRepository;
import fourth.dao.OrderRepository;
import fourth.service.MemberService;
import fourth.service.VoucherService;

@Controller
@SessionAttributes(names = {"user"})
public class CenterController {
	
	@Autowired
	VoucherService service ;
	
//	@Autowired
//	private OrderElaticSearchRepository elaticSearchRepository;
	
	@Autowired
	private ElasticsearchRestTemplate elasticsearchRestTemplate;
	
//	@Autowired
//	private ElasticsearchTemplate elasticsearchTemplate;
//	
	@GetMapping("/backendIndex")
	public String showBackendIndex(HttpServletRequest request,Model m) {
		request.getSession().setAttribute("pageStatus","3");
		System.out.println("後台");
		return "BackendIndex";
	}
	
	
	@GetMapping("/Index")
	public String Index(HttpServletRequest request,Model m) {
		request.getSession().setAttribute("pageStatus","1");
		System.out.println("前台");
		
//		boolean createIndexAndPushMapping = createIndexAndPushMapping();
//		System.out.println(createIndexAndPushMapping);
		//service.insertVoucher();
//		elasticsearchTemplate.createIndex(fourth.bean.OrderUser.class);
//		elasticsearchTemplate.putMapping(fourth.bean.OrderUser.class);
//		fourth.bean.OrderUser orderUser = elasticsearchRestTemplate.get("16639592361740", fourth.bean.OrderUser.class);
//		System.out.println(orderUser);
		return "Index";
	}
	
	public boolean createIndexAndPushMapping() {

	    IndexOperations indexOperations = elasticsearchRestTemplate.indexOps(OrderUser.class);
	    //创建索引
	    boolean a = indexOperations.create();
	    if (a){
	        //生成映射
	        org.springframework.data.elasticsearch.core.document.Document mapping = indexOperations.createMapping();
	        //推送映射
	        boolean b = indexOperations.putMapping(mapping);
	        return b;
	    }else {
	        return a;
	    }
	}

	
}
