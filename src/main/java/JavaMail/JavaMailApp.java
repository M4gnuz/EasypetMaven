/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaMail;

import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Luis Ragazzi
 */
public class JavaMailApp {
    public static void enviarEmail(String email, String senha) {
            Properties props = new Properties();
            // Parâmetros de conexão com servidor Gmail 
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.starttls.enable", "true");
 
            Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                             protected PasswordAuthentication getPasswordAuthentication() 
                             {
                                   return new PasswordAuthentication("easypet4@gmail.com", "easypet4!!!");
                             }
                        });
 
            //Ativa Debug para sessão 
            session.setDebug(true);
 
            try {
 
                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("easypet4@gmail.com")); //Remetente
 
                  Address[] toUser = InternetAddress //Destinatário(s)
                             .parse(email);  
 
                  message.setRecipients(Message.RecipientType.TO, toUser);
                  message.setSubject("Recuperação de senha");//Assunto
                  message.setText("Boas vindas do grupo Easy Pet. Você solicitou a recuperção de sua senha. Senha: "+senha);
                  //Método para enviar a mensagem criada
                 // Transport transport = session.getTransport();  
                 // transport.connect();  
                  Transport.send(message);
                  //transport.close();
 
                  System.out.println("Feito!!!");
 
             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
    
        public static void enviarEmailFaleConosco(String nome, String email, String mensagem, String telefone, String assunto, String motivo) {
            Properties props = new Properties();
            // Parâmetros de conexão com servidor Gmail 
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.starttls.enable", "true");
 
            Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                             protected PasswordAuthentication getPasswordAuthentication() 
                             {
                                   return new PasswordAuthentication("easypet4@gmail.com", "easypet4!!!");
                             }
                        });
 
            //Ativa Debug para sessão 
            session.setDebug(true);
 
            try {
 
                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("easypet4@gmail.com")); //Remetente
 
                  Address[] toUser = InternetAddress //Destinatário(s)
                             .parse("easypet4@gmail.com");  
 
                  message.setRecipients(Message.RecipientType.TO, toUser);
                  message.setSubject("Fale Conosco");//Assunto
                  message.setText("Nome do contado: " + nome + "\n" +
                                  "email do contado: " + email + "\n" + 
                                  "Telefone do contado: " + telefone + "\n\n" +        
                                  "Assunto do contado: " + assunto + "\n" +
                                  "Motivo do contado: " + motivo + "\n\n\n" +                                 
                                  "Mensagem do contado: " + mensagem + "\n");
                  //Método para enviar a mensagem criada
                 // Transport transport = session.getTransport();  
                 // transport.connect();  
                  Transport.send(message);
                  //transport.close();
 
                  System.out.println("Feito!!!");
 
             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
        
        
    public static void enviarEmailTrabalheConosco(String nome, String email, String areaInteresse, String telefone, String formacao1, String formacao2, String experiencia1, String experiencia2, String idioma1, String idioma2, String infoComplementares  ) {
            Properties props = new Properties();
            // Parâmetros de conexão com servidor Gmail 
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.starttls.enable", "true");
 
            Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                             protected PasswordAuthentication getPasswordAuthentication() 
                             {
                                   return new PasswordAuthentication("easypet4@gmail.com", "easypet4!!!");
                             }
                        });
 
            //Ativa Debug para sessão 
            session.setDebug(true);
 
            try {
 
                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("easypet4@gmail.com")); //Remetente
 
                  Address[] toUser = InternetAddress //Destinatário(s)
                             .parse("easypet4@gmail.com");  
 
                  message.setRecipients(Message.RecipientType.TO, toUser);
                  message.setSubject("Trabalhe Conosco");//Assunto
                  message.setText("Nome do contado: " + nome + "\n" +
                                  "email do contado: " + email + "\n" + 
                                  "Telefone do contado: " + telefone + "\n\n" + 
                                   "Área de interesse: " + areaInteresse + "\n\n" +
                          "Formação Acadêmica: " + formacao1 + "\n" + formacao2 + "\n" +
                          "Experiência Profissional: " + experiencia1 + "\n" + experiencia2 + "\n" +
                          "Idioma(s): " + idioma1 + "\n" + idioma2 + "\n" +
                          "Informações Complementares: " + infoComplementares + "\n");
                  //Método para enviar a mensagem criada
                 // Transport transport = session.getTransport();  
                 // transport.connect();  
                  Transport.send(message);
                  //transport.close();
 
                  System.out.println("Feito!!!");
 
             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
}
