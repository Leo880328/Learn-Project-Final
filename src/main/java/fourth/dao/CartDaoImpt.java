package fourth.dao;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.CartItem;
import fourth.bean.CourseBean;
import fourth.bean.MemberBean;



@Repository
public class CartDaoImpt   {
	
	@Autowired
	SessionFactory factory ;
	
	@Autowired
	CartRepository cartRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public CartDaoImpt() {
		//factory = HibernateUtil.getFactory();
	}
	
	//@Override
	public List<CartItem> carList(int id) {
		Session session = entityManager.unwrap( Session.class );
		//Session session = factory.getCurrentSession();
		try {
			List<CartItem> resultList = session.createQuery("from CartItem where user_id = :id",CartItem.class)
					.setParameter("id", id).getResultList();
			return resultList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//@Override
	public void addCart(CartItem cart) {
		Session session = entityManager.unwrap( Session.class );
		//Session session = factory.getCurrentSession();
		try {
			CourseBean courseBean = session.get(CourseBean.class, cart.getCourseBean().getCourse_id());
			MemberBean memberBean = session.get(MemberBean.class, cart.getUser_id());
			cart.setCourseBean(courseBean);
			cart.setMemberBean(memberBean);
			cart.setPrice(courseBean.getCourse_price());
			cartRepository.save(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//@Override
	public void deleteCart(int paseInt) {
		Session session = entityManager.unwrap( Session.class );
		//Session session = factory.getCurrentSession();
		try {
			CartItem cartItem = session.get(CartItem.class, paseInt);
			session.delete(cartItem);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	//@Override
	public void clearCard(int userId) {
		Session session = entityManager.unwrap( Session.class );
		//Session session = factory.getCurrentSession();
		try {
			
			session.createQuery("delete from CartItem where user_id = :id")
			.setParameter("id", userId).executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	
}
