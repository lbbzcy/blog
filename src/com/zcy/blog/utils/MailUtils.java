package com.zcy.blog.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * 邮件发送工具类
 */
public class MailUtils {
	/*
	 * 发送邮件的方法 to 发送邮件人 
	 */
	public static void sendMail(String to) {
		/*
		 * 1.获得一个Session对象 2.创建一个代表邮件对象的Message 3.发送邮件Transport
		 */
		// 1.获得连接对象
		Properties props = new Properties();
		props.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication("service@blog.com", "service");
			}
		});
		// 创建邮件对象
		Message message = new MimeMessage(session);
		try {
			// 设置发件人
			message.setFrom(new InternetAddress("service@blog.com"));
			// 设置收件人
			message.setRecipient(RecipientType.TO, new InternetAddress(to));// 抄送
																			// CC
																			// 密送BCC
			// 设置标题
			message.setSubject("来自博客的修改密码验证信息");
			// 设置邮件正文:
			message.setContent(
					"<h1>博客的修改密码验证信息!点下面链接跳转到修改密码页面!</h1>"
					+ "<h3>"
					+ "<a href='http://localhost:8090/blog/getPwd?email="
					+ to
					+ "'>http://localhost:8090/blog/getPwd?email="
					+ to + "</a></h3>", "text/html;charset=UTF-8");
			// 3.发送邮件:
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		sendMail("zhangsan@blog.com");
		System.out.println("aaa");
	}
}
