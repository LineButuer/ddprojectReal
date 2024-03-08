package com.icia.drawAcademy.util;

import javax.xml.stream.events.StartDocument;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class PagingUtil {

	private int maxNum; // ��ü ������ ���� ����
	private int pageNum; // ���� ���̴� �������� ��ȣ ���� ����
	private int listCnt; // �� ������ �� ���� ������ ���� ���� ����
	private int pageCnt; // ������ ������ ��ȣ ���� ����

	// ����¡�� html �ڵ带 ����� �޼ҵ�
	public String makePaging() {
		String pageStr = null;
		StringBuffer sb = new StringBuffer();

		// 1. ��ü ������ ���� ���ϱ�

		int totalPage = (maxNum % listCnt) > 0 ? maxNum / listCnt + 1 : maxNum / listCnt;

		// 2.���� ������ �׷� ���ϱ�
		int curGroup = (pageNum % pageCnt) > 0 ? pageNum / pageCnt + 1 : pageNum / pageCnt;

		// 3.��ȣ �׸��� ���� ��ȣ
		int start = (curGroup * pageCnt) - (pageCnt - 1);

		// 4.��ȣ �׷��� ������ ��ȣ
		int end = (curGroup * pageCnt) >= totalPage ? totalPage : curGroup * pageCnt;

		// 5.ó�� ��ư ó��
		if (pageNum != 1) {
			sb.append("<a class='pno active' href='./qboard?pageNum=");
			sb.append((1) + "'>");
			sb.append("ó��</a>     ");
		}

		if (pageNum == 1) {
			sb.append("<a class='pno active' href='./qboard?pageNum=");
			sb.append((1) + "'>");
			sb.append("ó�� ��</a>");

		}

		if (start != 1) {
			if (pageNum != 1) {
				sb.append("<a class='pno active' href='./qboard?pageNum=");
				sb.append((start - 1) + "'>");
				sb.append("<</a>     ");

			}
		}

		// ���� ��ư ó��
//      if (pageNum !=1) {
//         sb.append("<a class='pno active' href='./qboard?pageNum=");
//         sb.append((pageNum - 1) + "'>");
//          sb.append("< </a>");
//      }
//      
//      
		// 6. �߰� ��ȣ ��ư ó��
		for (int i = start; i <= end; i++) {
			if (pageNum != i) {
				sb.append("<a class='pno active' href='./qboard?pageNum=");
				sb.append(i + "'>" + i + "</a>");
			} else {
				sb.append("<font class='pno'>" + i + "</font>");
			}
		}
//
//     if (pageNum !=totalPage) {
//        sb.append("<a class='pno active' href='./qboard?pageNum=");
//         sb.append((pageNum + 1) + "'>");
//         sb.append("> </a>");
//     }

		// 7. ���� ��ư ó��
		if (pageNum != totalPage) {
			sb.append("<a class='pno active' href='./qboard?pageNum=");
			sb.append((end + 1) + "'>");
			sb.append("></a>");
		}

		if (pageNum != totalPage) {
			sb.append("<a class='pno active' href='./qboard?pageNum=");
			sb.append((totalPage) + "'>");
			sb.append("������</a>");
		}

		if (pageNum == totalPage) {
			sb.append("<a class='pno active' href='./qboard?pageNum=");
			sb.append((totalPage) + "'>");
			sb.append("  ��������</a>");

		}

		// StringBuffer�� ����� ������ ���ڿ��� ��ȯ
		pageStr = sb.toString();
		return pageStr;

	}
}