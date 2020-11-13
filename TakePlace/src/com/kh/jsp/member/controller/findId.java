package com.kh.jsp.member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

/**
 * Servlet implementation class findId
 */
@WebServlet("/find.me")
public class findId extends HttpServlet {
	
	private static String getSHA512(String pwd) {
	      
	      try {
	         MessageDigest md = MessageDigest.getInstance("SHA-512");
	         byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
	         md.update(bytes);
	         
	         return Base64.getEncoder().encodeToString(md.digest());
	         
	      } catch (NoSuchAlgorithmException e) {
	         
	         System.out.println("암호화 에러 발생!");
	         e.printStackTrace();
	         
	         return null;
	      }
	   }
	
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public findId() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      String command = request.getParameter("command");

      System.out.println(command);

      if (command.equals("findId")) {
         findId(request, response);
      } else if (command.equals("findPwd")) {
         findPWd(request, response);
      }

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

   private void findId(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      // TODO Auto-generated method stub
      // 아이디 찾기 메소드 호출
      String email = request.getParameter("findId");
      // System.out.println(email);

      Member m = new Member(email);

      MemberService ms = new MemberService();

      m = ms.findId(m);

      if (m != null) {
         response.getWriter().write(m.getId() + "," + m.getEmail() + "," + m.getMtype() + "," + m.getJoinDate());         
         // RequestDispatcher dispatch =
         // request.getRequestDispatcher("views/member/idFindSuccess.jsp");
         // dispatch.forward(request, response);
         
         return;

      } else {
         response.getWriter().write("fail");
         
         return;
      }
   }

   private void findPWd(HttpServletRequest request, HttpServletResponse response) throws IOException {
      // TODO Auto-generated method stub
      // 비멀번호 찾기 메소드 호출
      String id = request.getParameter("findPwd");
      String email = request.getParameter("findPwd2");
      
      System.out.println(id + " " + email);
      
      Member m = new Member();
      
      MemberService ms = new MemberService();
      
      m = ms.findPwd(id, email);
      
      if(m.getId().equals(id) && m.getEmail().equals(email)){
         System.out.println("아이디와 비밀번호 존재");
         
         // 임시 비밀번호 발급
         String newPwd = getRandomPwd(7);
         System.out.println("생성된 임시 비번 : " + newPwd);
        
         // 메일 전송
         sendEmail(email, newPwd);
         
         newPwd = getSHA512(newPwd);
         
         int result = ms.updatePwd(id, newPwd);
        
         if(result > 0){
            response.getWriter().write(result);
         }
      
      } else {
         System.out.println("일치하는 항목이 없음");
         response.getWriter().write("fail");
      	}
      }
   
   // 임시비밀번호 생성메소드
   public static String getRandomPwd(int len) {
      char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
            'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
      };
      
      int idx = 0; 
      
      StringBuffer sb = new StringBuffer();
      // System.out.println("charSet.length :::: "+ charSet.length);
      
      for (int i = 0; i < len; i++) {
         idx = (int)(charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출
         System.out.println("idx = " + idx);
         sb.append(charSet[idx]);
         
      }
      
      return sb.toString();
   }
   
   private void sendEmail(String email, String newPwd){
      String user = "gkdud6717@naver.com";
      String password = ""; // 실제 네이버 비번입력  // 전에 smtp 네이버메일에서 설정하기!!
      
      String host = "smtp.naver.com"; // smtp 서버
      String content = "임시 비밀번호 : " + newPwd;
      
      
      // Property에 SMTP 서버 정보 설정
      Properties props = new Properties();
      // Naver Smtp 서버 저장
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "587");
      props.put("mail.smtp.auth", "true");
      
      // Session 인스턴스 생성
      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
         }
      });
      
      try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         // 수신자 메일주소
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
         
         // Subject
         message.setSubject("Take Place 에서 임시 비밀번호가 발급되었습니다.");
         
         // Text
         message.setText(content);
         
         // send
         Transport.send(message);
         System.out.println("전송 성공");
         
      } catch (AddressException e) {
         // TODO: handle exception
         e.printStackTrace();
      } catch (MessagingException e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      
   }

}