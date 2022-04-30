package study.spring.findhobby.helper;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MailHelper {
	JavaMailSender mailSender;
	
	public MailHelper(JavaMailSender sender) {
		this.mailSender = sender;
	}
	
	public void sendMail(String receiver, String subject , String content) throws Exception {
		log.debug("------------------------------------------------");
		log.debug(String.format("To: %s", receiver));
		log.debug(String.format("Subject: %s", subject));
		log.debug(String.format("Content: %s", content));
		log.debug("------------------------------------------------");
		
		JavaMailSenderImpl mailSenderImpl = (JavaMailSenderImpl) this.mailSender;
		String sender = mailSenderImpl.getUsername();
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setSubject(subject);
		helper.setText(content, true);
		helper.setFrom(new InternetAddress(sender));
		helper.setTo(new InternetAddress(receiver));
		
		mailSender.send(message);

	}
}
