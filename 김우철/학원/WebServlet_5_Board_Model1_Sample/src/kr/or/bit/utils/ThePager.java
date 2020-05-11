package kr.or.bit.utils;

public class ThePager {
	 
	 private int pageSize;//�� �������� ������ ����
	 private int pagerSize;//��ȣ�� �����ִ� ������ Link ����
	 private int dataCount;//�� ������ ��
	 private int currentPage;//���� ������ ��ȣ
	 private int pageCount;//�� ������ ��
	 
	 private String linkUrl;//�������� ���ԵǴ� �������� �ּ�
	 
	 public ThePager(int dataCount, int currentPage, 
	  int pageSize, int pagerSize, String linkUrl) {
	  
	  this.linkUrl = linkUrl;
	  
	  this.dataCount = dataCount;
	  this.pageSize = pageSize;
	  this.pagerSize = pagerSize;
	  this.currentPage = currentPage;  
	  pageCount = 
	   (dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0); 
	 }
	 
	 public String toString(){
	  StringBuffer linkString = new StringBuffer();
	  
	  //1. ó��, ���� �׸� �����
	  if (currentPage > 1) {
	   linkString.append(
	    String.format("[<a href='%s?pageno=1'>ó��</a>]",linkUrl));
	   linkString.append("&nbsp;");
	   linkString.append("&nbsp;");
	   linkString.append(String.format(
	    "[<a href='%s?pageno=%d'>����</a>]", linkUrl, currentPage - 1));
	   linkString.append("&nbsp;");
	  }
	  
	  //2. ������ ��ȣ Link �����
	  int pagerBlock = (currentPage - 1) / pagerSize;
	  int start = (pagerBlock * pagerSize) + 1;
	  int end = start + pagerSize;
	  for (int i = start; i < end; i++) {
	   if (i > pageCount) break;
	   linkString.append("&nbsp;");
	   if(i == currentPage) {
	    linkString.append(String.format("[%d]", i));
	   } else { 
	    linkString.append(String.format(
	     "<a href='%s?pageno=%d'>%d</a>", linkUrl, i, i));
	   }
	   linkString.append("&nbsp;");
	  }
	  
	  //3. ����, ������ �׸� �����
	  if (currentPage < pageCount) {
	   linkString.append("&nbsp;");
	   linkString.append(String.format(
	    "[<a href='%s?pageno=%d'>����</a>]",linkUrl, currentPage + 1));
	   linkString.append("&nbsp;");
	   linkString.append("&nbsp;");
	   linkString.append(String.format(
	    "[<a href='%s?pageno=%d'>������</a>]", linkUrl, pageCount));
	  }
	  
	  return linkString.toString();
	 }
	 
	}