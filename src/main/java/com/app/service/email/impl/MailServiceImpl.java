package com.app.service.email.impl;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.app.service.email.MailService;

@Service
public class MailServiceImpl implements MailService {

	private static final Logger log = LoggerFactory.getLogger(MailServiceImpl.class);

	private final JavaMailSender mailSender;

	@Value("${mail.from.address}")
	private String fromAddress;

	@Value("Scout 비밀번호 재설정")
	private String fromName;

	public MailServiceImpl(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Override
	@Async
	public void sendMail(String to, String subject, String htmlContent) {

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom(new InternetAddress(fromAddress, fromName, "UTF-8"));
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(htmlContent, true);

			mailSender.send(message);
		} catch (MessagingException | UnsupportedEncodingException e) {
			log.error("메일 전송 실패 to={}", to, e);
		}
	}

}
