package fourth.coursemail;

import java.util.Properties;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.*;
public class JavaMail {
//	private String userName="fock360man@gmail.com";
//	private String userName="ch570991400@gmail.com";
	private String userName="chengkung0131@gmail.com";
	//private String password="ihlwavbwwwhgxcuo";
	//private String password="nqvaybltaybedklf";
//	private String password="rwzgvzouoxtqemik";
	private String password="fvterzcvzuhnggsn";//成功
//	private String password="ruvotguhuyntpvjg";//會員
	
	//private String password="wayne85423";
//	private String customer="fock360man@gmail.com";
//	private String customer = "ggyy45529441@gmail.com";
	private String customer = "ch570981400@gmail.com";
	private String subject="";
	private String txt="信件內容文字";
	
	public JavaMail() {
		
	}
	public JavaMail(String userName, String password, String customer, String subject, String txt) {
		this.userName = userName;
		this.password = password;
		this.customer = customer;
		this.subject = subject;
		this.txt = txt;
	}

	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getCustomer() {
		return customer;
	}


	public void setCustomer(String customer) {
		this.customer = customer;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getTxt() {
		return txt;
	}


	public void setTxt(String txt) {
		this.txt = txt;
	}


	public void sendMail() {
		
		Properties prop = new Properties();
		//設定連線方式smtp
		prop.setProperty("mail.transport.protocol","smtp" );
//		smtp.gmail.com
		prop.setProperty("mail.host","smtp.gmail.com" );
//      host port 465
		prop.put("mail.smtp.port", "465");
//		需要驗證：是
		prop.put("mail.smtp.auth","true");
//		需要安全資料傳輸層 (SSL)：是
		prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
//		安全資料傳輸層 (SSL) 通訊埠：465
		prop.setProperty("mail.smtp.socketFactory.port","465" );
		prop.put("mail.debug","true");
//		 Session session = Session.getDefaultInstance(prop,new Authenticator() {
			 Session session = Session.getInstance(prop,new Authenticator() {
			@Override 
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(userName, password);
			}
		});
		 MimeMessage message = new MimeMessage(session);
		 try {
			message.setSender(new InternetAddress(userName));
			message.setRecipient(RecipientType.TO,new InternetAddress(customer));
			message.setSubject(subject);
			message.setContent(txt,"text/html;charset=UTF-8");
			Transport transport = session.getTransport();
			transport.send(message);
			transport.close();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
