package com.icia.drawAcademy.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("QueDTO")
public class QboardDto {
   
   private Integer b_code; // 게시판 번호
   private Integer m_id; // 회원 번호
   private String b_title; // 글 제목
   private String b_contents; // 글 내용
   private String m_name;
   
}