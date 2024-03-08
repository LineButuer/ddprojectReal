package com.icia.drawAcademy.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.drawAcademy.dao.MemberDao;
import com.icia.drawAcademy.dto.ClassDto;
import com.icia.drawAcademy.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {

   @Autowired
   private MemberDao mDao;

   // ȸ������
   public String signUp(MemberDto member, RedirectAttributes rttr) {
      log.info("signUp()");
      String msg = null; // DB ���� ����/���� ���� �޽��� ����
      String view = null; // ��� ������ ���� ����

      try {
         mDao.signUp(member); // ���� ����
         System.out.println("member" + member);
         view = "redirect:/?";
         msg = "ȸ������ ����";

      } catch (Exception e) { // ���� ����
         e.printStackTrace();
         view = "redirect:/?";
         msg = "ȸ������ ����";
      }

      rttr.addFlashAttribute("msg", msg);
      System.out.println(msg);
      return view;
   }

//-------------------------------------------------------------------------------------//
   // �α���
   public String login(MemberDto memberDto, HttpSession session, RedirectAttributes rttr) {
      log.info("login()");
      String msg = null;
      String view = null;

      MemberDto loggedInMember = mDao.login(memberDto);

      if (loggedInMember != null) {
//         mDao.login(m_email, m_password);
         msg = "�α��� ����";
         view = "redirect:/";

         System.out.println(loggedInMember);
         // �α��ν� ���ǿ� ����
         session.setAttribute("login", loggedInMember);

      } else {
         msg = "�α��� ����/ �̸��� �� ��й�ȣ�� �ٽ� Ȯ�����ֽñ� �ٶ��ϴ�.";
         view = "redirect:/login";
      }

      rttr.addFlashAttribute("msg", msg);
      return view;

   }

   public String logout(HttpSession session, RedirectAttributes rttr) {
      log.info("logout()");
      String msg = "�α׾ƿ� ����";

      session.removeAttribute("login");

      rttr.addFlashAttribute("msg", msg);
      return "redirect:/";
   }
   // -------------------------------------------------------------------------------------//

   // ȸ������ ����

   public String updateMember(MemberDto memberDto, HttpSession session, RedirectAttributes rttr) {
      log.info("updateMember()");

      String msg = null;
      String view = null;
      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");
      int m_id = loggedInMember.getM_id();
      memberDto.setM_id(m_id);
      try {
         mDao.updateMember(memberDto);
         System.out.println("memberDTO = " + loggedInMember);

         loggedInMember = mDao.login(memberDto);
         session.setAttribute("login", loggedInMember);

         msg = "���� ����";
         view = "redirect:/mypage";
      } catch (Exception e) {
         e.printStackTrace();
         msg = "���� ����";
         view = "redirect:/setting";
      }

      rttr.addFlashAttribute("msg", msg);
      return view;
   }

//------------------------------------------------------------------------------------------------------------//
   // ȸ��Ż��
   public String memout(HttpSession session, RedirectAttributes rttr) {
      log.info("memout()");
      String msg = null;
      String view = null;
      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");
      int id = loggedInMember.getM_id();

      try {
         // cmtDao.deleteMemCmt(id);
         // qDao.deleteMemQboard(id);
         mDao.memClassOut(id);
         mDao.memout(id);
         session.removeAttribute("login");
         session.invalidate();
         msg = "Ż�� ����";
         view = "redirect:/";

      } catch (Exception e) {
         e.printStackTrace();
         msg = "Ż�� ����";
         view = "redirect:mypage";
      }

      rttr.addFlashAttribute("msg", msg);
      return view;
   }

   public String checkEmail(String m_email) {
      String checkMsg = null;

      try {
         int emailCount = mDao.checkEmail(m_email);
         if (emailCount > 0) {
            checkMsg = "�ߺ��� �̸����Դϴ�.";
            return checkMsg;
         } else {
            checkMsg = "";
            return checkMsg;
         }
      } catch (Exception e) {
         e.printStackTrace();
         return "error";
      }
   }

   public void myPage(Integer m_id, Model model) {
      log.info("mypage()");
      // DB���� �����;���
      MemberDto memberDto = mDao.myPage(m_id);
      List<ClassDto> cList = mDao.getClasslist(m_id);

      // ���ڿ� ���
      model.addAttribute("memberDto", memberDto);
      model.addAttribute("cList", cList);
      System.out.println("service memberDto = " + memberDto);
   }

   public String classCancleProc(ClassDto classDto, RedirectAttributes rttr) {
      log.info("classCancleProc()");
      String msg = null;
      String view = null;
      System.out.println("classCancleProcServ = " + classDto);
      try {
         mDao.classCancleProc(classDto);

         msg = "������û ��� ����";
         view = "redirect:/mypage";
         rttr.addFlashAttribute("msg", msg);
         return view;
      } catch (Exception e) {
         e.printStackTrace();
         msg = "������û ��� ����";
         view = "redirect:/mypage";
         rttr.addFlashAttribute("msg", msg);
         return view;
      }

   }

}// end