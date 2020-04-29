<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    Emp e = new Emp();
    e.setEmpno(2000);
    e.setEname("bituser");
    /* �̷��� �ڹٷ� �ؾߵ�  ��¿�� ���� */
    
    HashMap<String, String> hp = new HashMap<>();
    hp.put("data", "1004");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
������� : <%=e %> <br>
������� : <%=e.getEmpno() %> <br>
������� : <%=e.getEname() %> <br>

<h3>EL (���)</h3>
�ڹٰ�ü�� ����ϱ�(��ü�� ���� �������� �Ұ�) : ${e}<br> 
�ڹٰ�ü�� ������ �Ӽ� ����ϱ�(�ȵ�) : ${e.getEmpno()}<br> 

1. JSTL(core) : ������ �����ϰų� ����� �� �� �ִ� �ڿ��� ����<br> <!-- %�ȿ� ���� ����Ŷ� ���� , JSTL�� �����ʿ��� �ؼ��Ǵ� ��� -->
<c:set var="m" value="<%= e %>"></c:set>
JSTL�� ����ؼ� ���� m�� ����(e��� ��ü�� �ּҰ�) : ${m}<br>
<!-- jstl�� �̿��� ������ ����� �� ������ �̿��� el�� ��ü ��� ���� (���� �̹���� ���� �ȵ���Ͻ�) -->
<hr>
EL ��� : JSTL �������� ��� : ${m}<br> 
EL ��� : JSTL ����(���� : �׷��� �̹�� �߾Ⱦ�) : ${m.getEmpno()}<br>
EL ��� : JSTL ����(m�̶�� ������ �ڵ����� getter �Լ� ȣ��)(m.member field��) : ${m.empno}<br>
 <!-- �� ��� ����(�� getter�Լ��� �ݵ�� �����ؾ��� -> ���������� getter�Լ��� ȣ���ϴ� ���̱� ������ -->
EL ��� : JSTL ����(m�̶�� ������ �ڵ����� getter �Լ� ȣ��)(m.member field��) : ${m.ename}<br> 
<!-- private���� ���Ƶ� �ڵ����� getter �Լ� ȣ��  -->
<hr>
<h3>EL & JSTL ����ϱ�</h3>
**** EL�� ���ؼ� JAVA ��ü�� ���� �������� ���� �Ұ� ****<br>
**** JSTL�� ������ �ִ� set ������ ����ؼ� ������ ����..�̿� ****
<%-- **1. EL : Parameter �� �ޱ� (${param.})<br> --%>
<!-- **2. ��ü(requestScope, sessionScope) ������ �־ <br>
	request��ü, session��ü�� ������ �ִ� ���� ���<br> -->
<c:set var="username" value="${m.ename}"></c:set>	
<!-- c:set�±��� value������ el������ �� �� �ִ�. -->
������ ��� : ${username}<br> 
<hr>
<h3>JSTL ���� ����� SCOPE �����ϱ�</h3>
<%-- <%
	String job = "�󱸼���"
%> --%>
<!-- ��ũ��Ʈ ���� ���� �Ⱦ� c:set ��� -->
<!-- ��� JSP���� EL�� JSTL�� �˸� ����, ������ request�� �ϴ� ������ �����ڵ带 ���������ϱ� ���ؼ�...  -->
<c:set var="job" value="�󱸼���" scope="request"></c:set>
<!-- scope="session"�� �ָ� ��� ���������� ���� ���� -->
<!-- request��  -->
����� ������ : ${job}<br>
���࿡ ����� [include], [forward] �� �������� �ִٸ� �� ������������ job�̶�� ������ ����� �� �ִ�.
<hr>
<c:set var="job2" value="�߱�����" scope="request" />
���� ���<br>
${job2}<br>
������ ���� ����
<c:remove var="job2"/><br>
job2���� ���� : ${job2}<br>
<!-- EL�� JSTML�� 500������ ��������,������ �׳� ȭ�鿡 ��¾���  -->
<hr>
hp��ü(��ü�� ���� ���� ���� �Ұ�) : ${hp}<br>
<c:set var="vhp" value="<%=hp %>" /> 
<!-- value�κп� ��ũ��Ʈ���� ���� �͵� ��¿������  -->
hp��ü : ${vhp}<br>
hp��ü : ${vhp.data}<br>
<!-- �ڡڡڡڰ�ü�� c:set���� �ް� el�� ������ڡڡڡڡ�  -->
<!-- 
	hp.put("color", "red")
 -->
 <c:set target="${vhp}" property="color" value="red" />
 <!--�̷���� (���� ���� �Ҵ��ϴ� ��) ���� ����(���� �������) / �ִ� ��ü,�ڿ��� ����ϴ� ���� el,JSTL�� �� ������(�ۼ�Ʈ�� ������!!)  -->
 hp��ü : ${vhp}<br>
</body>
</html>