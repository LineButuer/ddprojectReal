package com.icia.drawAcademy.dao.Qboarddao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.icia.drawAcademy.dto.QboardDto;

public interface QboardDao {
   
   // 게시판 목록 가져오기
   List<QboardDto> getQboardList(Map<String, Integer> pMap);

   // 전체 게시물 개수 구하기
   @Select("SELECT count(*) FROM Qboard")
   int cntQboard();
   
   // 게시물 정보 입력
   void insertQBoard(QboardDto qboard);

   QboardDto Qboardlist(QboardDto qboard);

   void updateQBoard(QboardDto qboard);

   QboardDto selectQBoard(Integer b_code);

   void deleteQBoard(Integer b_code);

   void deleteMemQboard(Integer id);
   
   List<QboardDto> searchProc(String searchText);
}