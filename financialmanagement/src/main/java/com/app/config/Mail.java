package com.app.config;

import java.util.ArrayList;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.mail.Message;
import sun.security.krb5.internal.Authenticator;

public class Mail {
	public void sendMail(ArrayList<String>details) throws MessagingException {
		System.out.println("sending mail");
		Properties properties=new Properties();
		
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		final String myAccountEmail="mail ID";
		final String password="xxxxxxx";
		
		Session session=Session.getInstance(properties, new javax.mail.Authenticator() {
				
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			// TODO Auto-generated method stub
			return new PasswordAuthentication(myAccountEmail, password);
		}
		});
		
		javax.mail.Message message=prepareMessage(session,myAccountEmail,details);
		Transport.send(message);
		System.out.println("Message sent successfully");
		
	}

	private javax.mail.Message prepareMessage(Session session, String myAccountEmail, ArrayList<String> details) throws AddressException, MessagingException {
		
		javax.mail.Message message=new MimeMessage(session);
		message.setFrom(new InternetAddress(myAccountEmail));
		message.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(details.get(0)));
		message.setSubject(details.get(1));
		message.setText(details.get(2));
		return message;
	}
}
