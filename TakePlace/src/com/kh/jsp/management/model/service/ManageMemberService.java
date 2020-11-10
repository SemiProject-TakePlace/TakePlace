package com.kh.jsp.management.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.commit;
import static com.kh.jsp.common.JDBCTemplate.getConnection;
import static com.kh.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jsp.management.model.dao.ManageMemberDAO;
import com.kh.jsp.management.model.vo.ManageMember;

public class ManageMemberService {
	
	private Connection con;
	private ManageMemberDAO mmDAO = new ManageMemberDAO();
	
	public ArrayList<ManageMember> selectMemberList(String type) {
		con = getConnection();
		
		ArrayList<ManageMember> list = mmDAO.selectMemberList(con, type);
		
		close(con);
		
		return list;
	}

	public ManageMember selectOne(String type, int mno) {
		con = getConnection();
		
		ManageMember mm = mmDAO.selectOne(con, type, mno);
		
		close(con);
		
		return mm;
	}

	public int confirmHost(ManageMember mm) {
		con = getConnection(); 
		
		int result = mmDAO.confirmHost(con, mm); 
		
		if(result > 0) { 
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return result;
	}

	public ArrayList<ManageMember> searchMember(String condition, String keyword) {
		con = getConnection();
		
		ArrayList<ManageMember> list = null;
		
		if(condition.length() > 0) {
			list = mmDAO.searchMember(con, condition, keyword);
		} else {
			list = mmDAO.searchAll(con, keyword);
		}
		return list;
	}



}
