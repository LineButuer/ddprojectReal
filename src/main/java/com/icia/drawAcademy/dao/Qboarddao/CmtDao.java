package com.icia.drawAcademy.dao.Qboarddao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.icia.drawAcademy.dto.CmtDto;
@Repository("cDao")
public interface CmtDao {
   
   // ´ñ±Û ¸®½ºÆ®
   List<CmtDto> getCommentList(int b_code);
   
   void insertCmt(CmtDto cDto);

   @Select("SELECT count(*) FROM cmt")
   int cntcmt();
   
   void deleteMemCmt(Integer m_id);

   void deleteMemCmt(@Param("m_id")Integer m_id,@Param("c_code") Integer c_code);
   
}