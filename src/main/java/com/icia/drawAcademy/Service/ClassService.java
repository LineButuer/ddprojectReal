package com.icia.drawAcademy.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.drawAcademy.dao.classdao.ClassDao;
import com.icia.drawAcademy.dto.ClassDto;
import com.icia.drawAcademy.dto.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ClassService {

   @Autowired
   private ClassDao cDao;

   public String classPage(HttpSession session) {
      log.info("classPage()");
      
      String view = null;
      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");
      
      try {
      if (loggedInMember != null) {
         view = "Class/classpage";
         return view;
         } else {
            view = "redirect:login";
         
         return view;
         }
      }catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         view = "redirect:login";
         
         return view;
      }
   }

   public String class1proc(ClassDto classDto, HttpSession session, RedirectAttributes rttr) {
      log.info("class1proc()");
      String msg = null;
      String view = null;
      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");
      Integer m_id = loggedInMember.getM_id();
      String className = classDto.getClassName();
      
      try {
         
         classDto.setM_id(m_id);
       
         
         // System.out.println("classDto = " + classDto);
         // System.out.println("loggedInMember = " + loggedInMember);

         // MemberDto�� ClassName ���� ������Ʈ
         cDao.class1proc(classDto); // ���� ����
         
         
         view = "redirect:class1";
         msg = "������û ����";
         rttr.addFlashAttribute("msg", msg);
         return view;
         
      } catch (Exception e) { // ���� ����
         e.printStackTrace();
         view = "redirect:class1";
         msg = "������û ���� ���û����� �ٽ� �ѹ� Ȯ�� �� �ּ���";
         rttr.addFlashAttribute("msg", msg);
         return view;
      }   
   }

   public Integer getClassLimit(String className) {
       log.info("getClassLimitServ()");
       
       int classNameCount = cDao.classLimit(className);
       
      return classNameCount;
   }
      // �̸��� �ߺ�üũ 

   public void class1(Integer m_id, Model model, HttpSession session) {
      log.info("class1()");

      List<ClassDto> cList = cDao.checkClass(m_id);
      System.out.println(m_id);
      model.addAttribute("cList", cList);
      System.out.println("class1 serv = " + cList);
      
   }
}