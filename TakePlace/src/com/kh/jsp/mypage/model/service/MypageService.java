package com.kh.jsp.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.controller.mypage;
import com.kh.jsp.member.model.vo.Member;
import com.kh.jsp.mypage.model.dao.MypageDAO;
import static com.kh.jsp.common.JDBCTemplate.*;
public class MypageService {
	private MypageDAO mDAO = new MypageDAO();
	private Connection con;
	
	public Member selectMember(Member m) {
		con = getConnection();
		
		Member result = mDAO.selectMember(con, m);
		
		close(con);
		
		return result;
	}
	
	public int updateMember(Member m) throws MemberException { 
		con = getConnection(); 
		
		int result = mDAO.updateMember(con, m); 
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;
	}
	
	public int deleteMember(String userId) throws MemberException {
		
		con = getConnection();
		
		int result = mDAO.deleteMember(con, userId);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<mypage> selectList() {
		return null;
	}
}

