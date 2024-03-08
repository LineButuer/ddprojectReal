package com.icia.drawAcademy.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.icia.drawAcademy.dao.Qboarddao.CmtDao;
import com.icia.drawAcademy.dao.Qboarddao.QboardDao;
import com.icia.drawAcademy.dto.CmtDto;
import com.icia.drawAcademy.dto.MemberDto;
import com.icia.drawAcademy.dto.QboardDto;
import com.icia.drawAcademy.util.PagingUtil;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("Qserv")
public class QboardService {

   @Autowired
   private QboardDao qDao;

   @Autowired
   private CmtDao cDao;
   
   
   public String getQboardList(Integer pageNum, Model model, HttpSession session) {

      if (pageNum == null) {
         pageNum = 1;
      }

      int listCnt = 5; // 페이지당 보여지는 개수

      Map<String, Integer> pMap = new HashMap<String, Integer>();
      pMap.put("pageNum", (pageNum - 1) * listCnt);
      pMap.put("listCnt", listCnt);

      List<QboardDto> qList = qDao.getQboardList(pMap);

      model.addAttribute("qList", qList);
      System.out.println(qList);
      System.out.println(pMap);
      // 페이징 처리
      String pageHtml = getPaging(pageNum, listCnt);
      model.addAttribute("paging", pageHtml);

      session.setAttribute("pageNum", pageNum);

      return "QBoard/qboard";

   }

   private String getPaging(Integer pageNum, Integer listCnt) {
      String pageHtml = null;

      // 전체 게시물 개수
      int maxNum = qDao.cntQboard();
      // 페이지당 보여질 번호 개수
      int pageCnt = 5;

      PagingUtil paging = new PagingUtil(maxNum, pageNum, listCnt, pageCnt);

      pageHtml = paging.makePaging();

      return pageHtml;

   }

   // 게시물 작성
   public String insertQBoard(QboardDto qboard, HttpSession session, RedirectAttributes rttr) {
               log.info("insertQBoard()");
      String msg = "";
      String view = "";
      MemberDto loggedInMember = (MemberDto) session.getAttribute("login");
      Integer m_id = loggedInMember.getM_id();
      String m_name = loggedInMember.getM_name();
      
      try {  
        System.out.println("qboardServ = " + qboard);
        qboard.setM_name(m_name);
        qboard.setM_id(m_id);
         qDao.insertQBoard(qboard);
         
         view = "redirect:qboard";
         msg = "게시물 등록 성공";

      } catch (Exception e) {
         e.printStackTrace();
         view = "redirect:qwrite";
         msg = "게시물 등록 실패";
      }

      rttr.addFlashAttribute("msg", msg);
      System.out.println(msg);
      return view;
   }

   public void getQBoard(Integer b_code, Model model) {
      QboardDto qboard = qDao.selectQBoard(b_code);
      model.addAttribute("qboard_m_id", qboard.getM_id());
      System.out.println(b_code);
      
      List<CmtDto> cmtList = cDao.getCommentList(b_code);
      
      
      model.addAttribute("qboard", qboard);
      model.addAttribute("cmtList", cmtList);
      System.out.println("cmtList getQboard = " + qboard);
      
      
      System.out.println(model);

   }
   
   // 게시믈 수정 ----------------------------------------------------------------------------------------------------------------

   public String getQBUpdate(QboardDto qboard, HttpSession session, RedirectAttributes rttr) {
         
      System.out.println("수정시작");
      String view = null;
      String msg = null;

      
      
      try {
         qDao.updateQBoard(qboard);
         System.out.println("qboard" + qboard);
         msg = "게시물 수정 성공";
         
      } catch (Exception e) {
         e.printStackTrace();
         msg = "수정 실패.";

      }
      rttr.addFlashAttribute("msg", msg);
      view = "redirect:qboard";
      return view;
   }

   public String boardDelete(Integer b_code, RedirectAttributes rttr) {
      
      System.out.println("삭제중");
      
      String view =null;
      String msg = null;
      
      
      try {
         
         qDao.deleteQBoard(b_code);
         
         view="redirect:/?qboard";
         msg="삭제 성공";
               
      } catch (Exception e) {
         e.printStackTrace();
         view="redirect:/?qboard";
         msg="삭제 실패";
      }
      
      rttr.addFlashAttribute("msg", msg);
      
      return view;
   }

   public  String searchProcServ(String searchText,Model model) {
	   log.info("searchProcServ()");
	 
	  String msg = null;
	  
	  try {
		  System.out.println("searchText = " + searchText);
		  List<QboardDto> searchResult = qDao.searchProc(searchText);		  

	        if (!searchResult.isEmpty()) {	        	
	            // 검색 결과가 있을 경우
	            msg = "검색 성공";
	            // 검색 결과를 JSP로 전달
	            model.addAttribute("searchResult" , searchResult);
	            System.out.println("searchProcServ Result : " + searchResult);
	            model.addAttribute("msg", msg);
	        
	            return  "forward:/qboard";
	        } else {
	            // 검색 결과가 없을 경우
	            msg = "검색된 게시물이 없습니다.";
	            model.addAttribute("msg", msg);
	            return  "forward:/qboard";
	         
	        }

	        
	  }catch (Exception e) {
		  e.printStackTrace();
		
		msg = "검색 실패";
		model.addAttribute("msg", msg);
		  }
	   
	   return "foward:/qboard";
	   }
   
   
}