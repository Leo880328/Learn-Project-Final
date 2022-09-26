package fourth;

import javax.persistence.EntityManagerFactory;

import org.hibernate.SessionFactory;
import org.hibernate.jpa.HibernateEntityManagerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.orm.jpa.vendor.HibernateJpaSessionFactoryBean;


@SpringBootApplication
@ServletComponentScan
public class HappyLearningApplication {

	public static void main(String[] args) {
		System.out.println("啟動專案");
		SpringApplication.run(HappyLearningApplication.class, args);
	}
	
}
