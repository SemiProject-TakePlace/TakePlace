package com.kh.jsp.mypage.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.mypage.model.vo.Question;
import com.kh.jsp.payrecord.model.vo.PayRecord;
import com.kh.jsp.productReview.model.vo.ProductReview;
import com.kh.jsp.products.model.vo.Product;
import com.kh.jsp.reservation.model.vo.Reservation;

public class MypageDAO {
   private Properties prop;

   public MypageDAO() {
      prop = new Properties();
      
      String filePath = MypageDAO.class
                        .getResource("/config/mypage-sql.properties")
                        .getPath();
      try{
         prop.load(new FileReader(filePath));
         
      } catch (FileNotFoundException e) {
         
         e.printStackTrace();
      
      } catch(IOException e) {
         
         e.printStackTrace();
      
      }
   }
    
   ////////////////////////  문의 내역  //////////////////////////////
   public int getListCount(Connection con, int mno) {
      int result = 0; 
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("listCount");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setInt(1, mno);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            result = rset.getInt(1);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return result;
   }
   
   public ArrayList<Question> selectQList(Connection con, int mno, int currentPage, int limit) {
      ArrayList<Question> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectQList");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         // 1. 마지막 행의 번호
         // 2. 첫 행의 번호
         int startRow = (currentPage - 1) * limit + 1; 
         int endRow = startRow + limit - 1;

         pstmt.setInt(1, mno);
         pstmt.setInt(2, endRow);
         pstmt.setInt(3, startRow);
                  
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            
            Question q = new Question();
            
            q.setmNo(mno);
            q.setInqNo(rset.getInt("inqno"));
            q.setInqType(rset.getString("inqtype"));
            q.setInqTitle(rset.getString("inqtitle"));
            q.setInqContent(rset.getString("inqcontent"));
            q.setInqEmail(rset.getString("inqemail"));
            q.setInqTel(rset.getString("inqtel"));
            q.setInqIsdone(rset.getString("inqisdone"));
            
            list.add(q);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
         
      } finally {
         close(rset);
         close(pstmt);
      }   
      return list;
   }
   
   public int insertInq(Connection con, Question q, int mno) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertInq");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setInt(1, mno);
         pstmt.setString(2, q.getInqType());
         pstmt.setString(3, q.getInqTitle());
         pstmt.setString(4, q.getInqContent());
         pstmt.setString(5, q.getInqEmail());
         pstmt.setString(6, q.getInqTel());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   public Question selectOne(Connection con, int inqNo) {
         
         Question m = null;
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         
         String sql = prop.getProperty("selectOne");
         
         try {
            pstmt = con.prepareStatement(sql);
            
            pstmt.setInt(1, inqNo);
            
            rset = pstmt.executeQuery();
            
            if ( rset.next() ) {
               m = new Question();
               
               m.setInqNo(rset.getInt("inqno"));
                  m.setmNo(rset.getInt("mno"));
                  m.setInqType(rset.getString("inqtype"));
                  m.setInqTitle(rset.getString("inqtitle"));
                  m.setInqContent(rset.getString("inqcontent"));
                  m.setInqEmail(rset.getString("inqemail"));
                  m.setInqTel(rset.getString("inqtel"));
                  m.setInqIsdone(rset.getString("inqisdone"));

            }
            
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            close(rset);
            close(pstmt);
         }      
         
         return m;
      }
   
   public int deleteQuestion(Connection con, int inqno) throws NoticeException {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteQuestion");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setInt(1, inqno);
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         
         e.printStackTrace();
         
         throw new NoticeException("[DAO] : " + e.getMessage());
      } finally { 
         
         close(pstmt);
      }
            
      return result;
   }
   
   ////////////////////////// 예약내역(게스트) ////////////////////////////////////
   
   
   public HashMap<String, Object> selectRList(Connection con, ArrayList<Reservation> list,
         Product p, int mno) {
      
      HashMap<String, Object> hmap = new HashMap<>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectRList");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setInt(1, mno);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            
            Reservation r = new Reservation();
            
            r.setPreqno(rset.getInt("preqno"));
            r.setPno(rset.getInt("pno"));
            r.setPname(rset.getString("pname"));
            r.setGname(rset.getString("gname"));
            r.setGtel(rset.getString("gtel"));
            r.setResDate(rset.getString("resDate"));
            r.setGdemand(rset.getString("gdemand"));
            r.setPisOk(rset.getString("pisOk").charAt(0));
            r.setPisPaid(rset.getString("pisPaid").charAt(0));
            r.setPisCncld(rset.getString("pisCncld").charAt(0));
            r.setPayAmount(rset.getInt("payAmount"));
            r.setBsnum(rset.getString("bsnum"));
            
            list.add(r);
            
            p.setPno(rset.getInt("pno"));
            p.setPname(rset.getString("pname"));
            
         }
         
         hmap.put("list", list);
         hmap.put("p", p);
         
      } catch (SQLException e) {
         e.printStackTrace();
         
      } finally {
         close(rset);
         close(pstmt);
      }   
      return hmap;
   }

   public ArrayList<PayRecord> selectPList(Connection con, ArrayList<PayRecord> list, int mno) {
      list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
   
      String sql = prop.getProperty("selectPList");
      
      try {
         pstmt = con.prepareStatement(sql);
        
         pstmt.setInt(1, mno);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            
            PayRecord p = new PayRecord();
            
            p.setPayno(rset.getInt("payno"));
            p.setMno(rset.getInt("mno"));
            p.setPreqno(rset.getInt("preqno"));
            p.setPayDate(rset.getDate("paydate"));
            p.setPayMethod(rset.getString("paymethod"));
            p.setPayAmount(rset.getInt("payamount"));
            p.setPayStatus(rset.getNString("paystatus").charAt(0));
            p.setPname(rset.getString("pname"));
            p.setPaddress(rset.getString("paddress"));
            
            list.add(p);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
         
      } finally {
         close(rset);
         close(pstmt);
      }   
      return list;
   }

public int pisokChange(Connection con, int preqno) {
	int result = 0;
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("pisokChange");
	
	try {
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, preqno);
		
		result = pstmt.executeUpdate();
		
		
	} catch (SQLException e) {
		
		e.printStackTrace();
		
	} finally {
		
		close(pstmt);
	}
	
	return result;
}

public int pisokCancel(Connection con, int preqno) {
	int result = 0;
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("pisokCancel");
	
	try {
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, preqno);
		
		result = pstmt.executeUpdate();
		
		
	} catch (SQLException e) {
		
		e.printStackTrace();
		
	} finally {
		
		close(pstmt);
	}
	
	return result;
}

public int ListCountReview(Connection con, int mno) {
	 int result = 0; 
     PreparedStatement pstmt = null;
     ResultSet rset = null;
     
     String sql = prop.getProperty("ListCountReview");
     
     try {
        pstmt = con.prepareStatement(sql);
        
        pstmt.setInt(1, mno);
        
        rset = pstmt.executeQuery();
        
        if(rset.next()) {
           result = rset.getInt(1);
        }
        
     } catch (SQLException e) {
        e.printStackTrace();
     } finally {
        close(rset);
        close(pstmt);
     }
     
     return result;
  }


public ArrayList<ProductReview> selectReview(Connection con, int mno, int currentPage, int limit) {
	
	ArrayList<ProductReview> list = new ArrayList<>();
    PreparedStatement pstmt = null;
    ResultSet rset = null;
    
    String sql = prop.getProperty("selectReview");
    
    try {
       pstmt = con.prepareStatement(sql);
       
       // 1. 마지막 행의 번호
       // 2. 첫 행의 번호
       int startRow = (currentPage - 1) * limit + 1; 
       int endRow = startRow + limit - 1;

       pstmt.setInt(1, mno);
       pstmt.setInt(2, endRow);
       pstmt.setInt(3, startRow);
                
       rset = pstmt.executeQuery();
       
       while(rset.next()) {
          
    	  ProductReview pr = new ProductReview();
          
    	  pr.setRno(rset.getInt("rno"));
          pr.setPno(rset.getInt("pno"));
          pr.setMno(rset.getInt("mno"));
          pr.setRcontent(rset.getString("rcontent"));
          pr.setRrating(rset.getInt("rrating"));
          pr.setRdate(rset.getDate("rdate"));
          pr.setRlevel(rset.getInt("rlevel"));
          pr.setPname(rset.getString("pname"));
          pr.setPtype(rset.getString("ptype"));
          
          list.add(pr);
       }
       
    } catch (SQLException e) {
       e.printStackTrace();
       
    } finally {
       close(rset);
       close(pstmt);
    }   
    return list;
 }

public int deleteROne(Connection con, int preqno) throws NoticeException {
	 int result = 0;
     PreparedStatement pstmt = null;
     
     String sql = prop.getProperty("deleteROne");
     
     try {
        pstmt = con.prepareStatement(sql);
        
        pstmt.setInt(1, preqno);
        
        result = pstmt.executeUpdate();
        
     } catch (SQLException e) {
        
        e.printStackTrace();
        
        throw new NoticeException("[DAO] : " + e.getMessage());
     } finally { 
        
        close(pstmt);
     }
           
     return result;
  }
}















