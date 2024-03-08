package com.icia.drawAcademy.Service;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.drawAcademy.dao.Qboarddao.CmtDao;

import com.icia.drawAcademy.dto.CmtDto;
import com.icia.drawAcademy.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service("cServ")
public class CmtService {

   @Autowired
   @Qualifier("cDao")
   private CmtDao cDao;

   public String insertCmt(CmtDto cDto, HttpSession session, RedirectAttributes rttr) {
         log.info("insertCmt()");
         System.out.println("댓글");
         MemberDto loggedInMember = (MemberDto) session.getAttribute("login");

         Integer m_id = loggedInMember.getM_id();
         String m_name = loggedInMember.getM_name();
         String view = null;
         String msg = "";

         try {
            cDto.setM_id(m_id);
            cDto.setM_name(m_name);
            cDao.insertCmt(cDto);
            System.out.println("cmtDTO SERV =  "+cDto.getM_id());
            System.out.println("CmtDto SERV SERV  +== " + cDto);
            msg = "등록 성공";
         } catch (Exception e) {
            e.printStackTrace();
            msg = "등록 실패";
         }

         view = "redirect:detail?b_code=" + cDto.getB_code();
         rttr.addFlashAttribute("msg", msg);

         return view;
      }

   public String commentDelete(HttpSession session ,RedirectAttributes rttr, CmtDto cmtDto, Model model) {

         String view = null;
         log.info("commentDelete()");
         
         MemberDto login = (MemberDto) session.getAttribute("login");
         Integer m_id = login.getM_id();
         try {
            cDao.deleteMemCmt(m_id, cmtDto.getC_code());
            System.out.println("댓삭성공");
            System.out.println(m_id);
            
         } catch (Exception e) {
            e.printStackTrace();
            System.out.println("댓글 삭제 실패");
            
         }

         view = "redirect:qboard?b_code=";
         return view;
      }

}