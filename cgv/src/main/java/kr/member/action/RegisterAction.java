package kr.member.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;

public class RegisterAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemberVO member = new MemberVO();
		
		member.setName(req.getParameter("name"));
		member.setUser_id(req.getParameter("id"));
		member.setPassword(req.getParameter("passwd"));
		member.setBirthdate(req.getParameter("birthdate"));
		member.setGender(req.getParameter("gender"));
		member.setPhone(req.getParameter("phone"));
		member.setEmail(req.getParameter("email"));
		member.setAddress(req.getParameter("address1") + " " +  req.getParameter("address2"));
		MemberDAO dao = MemberDAO.getInstance();
		dao.register(member);
		
		req.setAttribute("result_title", "회원가입 완료");
		req.setAttribute("result_msg", "회원가입이 완료되었습니다.");
		req.setAttribute("result_url", req.getContextPath()+"/main/main.do");
		return "common/result_view.jsp";
	}

}
