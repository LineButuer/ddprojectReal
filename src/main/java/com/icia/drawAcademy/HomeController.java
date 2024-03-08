package com.icia.drawAcademy;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.drawAcademy.Service.ClassService;
import com.icia.drawAcademy.Service.CmtService;
import com.icia.drawAcademy.Service.MemberService;
import com.icia.drawAcademy.Service.QboardService;
import com.icia.drawAcademy.dto.ClassDto;
import com.icia.drawAcademy.dto.CmtDto;
import com.icia.drawAcademy.dto.MemberDto;
import com.icia.drawAcademy.dto.QboardDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

   @Autowired
   private MemberService mServ;

   @Autowired
   private ClassService cServ;

   @Autowired
   private QboardService Qserv;

   @Autowired
   private CmtService cmtServ;

   // --------------------------------------------------------------------------------//
   @GetMapping("/")
   public String home(Model model) {
      log.info("home()");

      return "home";

   }

   @GetMapping("instructors")
   public String instructors() {
      log.info("instructors()");
      return "headerMenu/instructors";
   }

   @GetMapping("about")
   public String about() {
      log.info("about()");
      return "headerMenu/about";
   }

   @GetMapping("test")
   public String test() {
      log.info("test()");
      return "test";
   }

   // --------------------------------------------------------------------------------//
   @GetMapping("signUp")
   public String signUp() {
      log.info("signUp()");

      return "member/signUp";
   }

   @PostMapping("signUpProc")
   public String signUpProc(MemberDto memberDto, RedirectAttributes rttr) {
      log.info("signUpProc()");
      String view = mServ.signUp(memberDto, rttr);
      System.out.println("rttr = " + rttr);

      return view;
   }

   @PostMapping(value = "emailCheckResult", produces = "application/text; charset=utf8")
   @ResponseBody
//@ResponseBody �� ���� ������ �ܼ��� xml���� �Ǵ� Json �������� ���� �� �ֱ� ������. / @ResponseBody�� ����ϸ� View Resolver�� ��ȸ�ϰ� ���� ��ȯ ���� HTTP ���� ������ �ֽ��ϴ�.
   public String checkEmail(@RequestParam String m_email) {
      log.info("checkEmail()");

      String result = mServ.checkEmail(m_email);
      return result;
   }

   // --------------------------------------------------------------------------------//
   @GetMapping("login")
   public String login() {
      log.info("login()");
      return "member/login";
   }

   @PostMapping("loginProc")
   public String loginProc(MemberDto memberDto, HttpSession session, RedirectAttributes rttr) {
      log.info("loginProc()");

      String view = mServ.login(memberDto, session, rttr);
      return view;
   }

   // --------------------------------------------------------------------------------//
   // �α׾ƿ�
   @GetMapping("logout")
   public String logout(HttpSession session, RedirectAttributes rttr) {
      log.info("logout");
      String msg = "�α׾ƿ� ����";
      // ���ǿ��� "login" �Ӽ����� ����

      session.removeAttribute("login");
      session.invalidate();

      // �α׾ƿ� �� �α��� �������� �����̷�Ʈ
      rttr.addFlashAttribute("msg", msg);
      return "redirect:/";
   }

   // --------------------------------------------------------------------------------//
   @GetMapping("mypage")
   public String mypage(Model model, HttpSession session) {
      log.info("mypage()");

      // ���ǿ��� �α����� ȸ�� ������ ������
      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");

      if (loggedInMember != null) {
         // �α����� ȸ�� ������ �𵨿� �߰��Ͽ� JSP�� ����
         mServ.myPage(loggedInMember.getM_id(), model);

         return "member/mypage";
      } else {
         // �α����� ȸ�� ������ ������ �α��� �������� �����̷�Ʈ
         return "redirect:/login";
      }
   }

   @PostMapping("classCancelProc")
   public String cancelClass(ClassDto classDto, RedirectAttributes rttr) {
      log.info("classCancleProc()");

      // �ʿ��� ���� ���� �� ���� ȣ��S
      String view = mServ.classCancleProc(classDto, rttr);
      return view;
   }

   // --------------------------------------------------------------------------------//
   @GetMapping("setting")
   public String setting(Model model, HttpSession session) {
      log.info("setting()");

      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");

      if (loggedInMember != null) {
         // �α����� ȸ�� ������ �𵨿� �߰��Ͽ� JSP�� ����
         model.addAttribute("loggedInMember", loggedInMember);

         return "member/setting";
      } else {
         // �α����� ȸ�� ������ ������ �α��� �������� �����̷�Ʈ
         return "redirect:/login";
      }
   }

   @PostMapping("updateMember")
   public String updateMember(MemberDto memberDto, HttpSession session, RedirectAttributes rttr) {
      log.info("updateMember()");

      String view = mServ.updateMember(memberDto, session, rttr);
      return view;

   }

   @GetMapping("memout")
   public String memout( HttpSession session, RedirectAttributes rttr) {
      log.info("memout()");

      String view = mServ.memout(session, rttr);
      return view;
   }

   // ������û ������
   // ---------------------------------------------------------------------------------------
   @GetMapping("classpage")
   public String classpage(HttpSession session) {
      log.info("classpage()");

      String view = cServ.classPage(session);
      return view;
   }

   @GetMapping("class1")
   public String class1(Model model, HttpSession session) {
      log.info("class1()");
      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");
      model.addAttribute("classLimitA", cServ.getClassLimit("classA"));
      model.addAttribute("classLimitB", cServ.getClassLimit("classB"));
      model.addAttribute("classLimitC", cServ.getClassLimit("classC"));
      model.addAttribute("classLimitD", cServ.getClassLimit("classD"));
      model.addAttribute("classLimitE", cServ.getClassLimit("classE"));

      if (loggedInMember != null) {
         cServ.class1(loggedInMember.getM_id(), model, session);
         return "Class/class1";
      } else {
         return "redirect:login";
      }

   }

   @PostMapping("class1proc")
   public String class1proc(ClassDto classDto, HttpSession session, RedirectAttributes rttr) {
      log.info("class1proc()");

      String view = cServ.class1proc(classDto, session, rttr);

      return view;
   }

   // ���� �Խ���
   // �Խù�
   // ���------------------------------------------------------------------------//
   @GetMapping("qboard")
   public String qboardString(Integer pageNum, Model model, HttpSession session) {

      // service���� ����� �����;���./

      log.info("qboard()");

      String view = Qserv.getQboardList(pageNum, model, session);

      return view;
   }

   // �Խù� �ۼ�---------------------------------------------------
   @GetMapping("qwrite")
   public String qBoardWrite(HttpSession session) {
      log.info("qwirte()");
      MemberDto login = (MemberDto) session.getAttribute("login");
      if (login != null) {
         return "QBoard/qwrite";
      } else {
         return "redirect:login";
      }

   }

   // �Խù� �ۼ�----------------------------------------------------------------
   @PostMapping("qwriteProc")
   public String qwriteProc(QboardDto qboard, HttpSession session, RedirectAttributes rttr) {
      log.info("qwritePoec()");
      MemberDto login = (MemberDto) session.getAttribute("login");
      System.out.println("qwriteProc Login = " + qboard);
      String view = null;
      // ������ ���� null�� �ƴ϶��
      if (login != null) {
         // ������ ���� Integer�� ��ȯ�Ͽ� qboardDTO ��ü�� ����
         // qboard.setM_id(Integer.parseInt(login));
         view = Qserv.insertQBoard(qboard, session, rttr);

      }

      return view;
   }

   @GetMapping("detail")
   public String detail(Integer b_code, Model model) {
      log.info("detail()");
      Qserv.getQBoard(b_code, model);

      // cServ.commentList(model, session, pageNum);
      return "QBoard/detail";
   }

   // �Խù� ����-------------------------------------------------------
   @GetMapping("QBUpdate")
   public String qboardUpdateString(Integer b_code, Model model) {
      log.info("QBUpdate()");
      Qserv.getQBoard(b_code, model);
      return "QBoard/QBUpdate";
   }

   @PostMapping("QBUpdateProc")
   public String QBUdateProc(QboardDto qboard, HttpSession session, RedirectAttributes rttr) {
      log.info("QBUpdateProc()");
      String view = Qserv.getQBUpdate(qboard, session, rttr);
      // ���ǿ��� "login" ���� ������
      MemberDto login = (MemberDto) session.getAttribute("login");
      Integer m_id = login.getM_id();

      // ������ ���� null�� �ƴ϶��

      if (login != null) {
         // ������ ���� Integer�� ��ȯ�Ͽ� qboardDTO ��ü�� ����
         qboard.setM_id(m_id);
      }
      return view;
   }

   // �Խù� ����
   @PostMapping("delete")
   public String boardDelete(Integer b_code, RedirectAttributes rttr) {
      String view = Qserv.boardDelete(b_code, rttr);

      return view;
   }
   
   @GetMapping("searchProc")
   public String searchProc(@RequestParam(name = "searchText") String searchText,Model model ) {
	   log.info("searchProc()");
	   String view = Qserv.searchProcServ(searchText,model);
	   return view;
   }
//-----------------------------------------------------------------------------------------------------------------------------
   // �Խù� ��� �ޱ�
   @PostMapping("inscProc")
   public String insertCmt(CmtDto cDto,
         // QboardDto qDto,
         HttpSession session, RedirectAttributes rttr) {
      MemberDto login = (MemberDto) session.getAttribute("login");
      if (login != null) {
         String view = cmtServ.insertCmt(cDto, session, rttr);
         return view;
      } else {
         return "redirect:login";
      }

   }

   // ��� ����
   @PostMapping("cDelete")
   public String commentDelete(HttpSession session, CmtDto cmtDto, RedirectAttributes rttr, Model model) {

      String view = cmtServ.commentDelete(session, rttr, cmtDto, model);

      return view;
   }
}