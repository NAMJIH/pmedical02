<%@page import="com.jihoon.pmedical.vo.PmedicalVo"%>
<%@page import="java.util.List"%>
<%@page import="com.jihoon.pmedical.dao.PmedicalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 	PmedicalDao pmedicalDao = new PmedicalDao();
	List<PmedicalVo> list = pmedicalDao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진료</title>
</head>
<body>
	<h1>내원 일지</h1>
	<form method="post" action="/pmedical02/pm?a=addform">
	<table>
		<tr>
			<td colspan=4 align=right><button onclick="window.location.href='/pmedical02/pm?a=addform'">추가하기</button></td>
		</tr>
	</table>
	</form>
	<br>		
	<% 
		for(int i = 0; i< list.size(); i++){
			PmedicalVo pv = list.get(i);
	%>	
	<table style="border: 1px solid; text-align: center;" >
		<tr>
			<td style="border: 1px solid;"><%=pv.getNo() %></td>
			<td width= 100 style="border: 1px solid;"><%=pv.getName() %></td>
			<td width= 20 style="border: 1px solid;"><%=pv.getGender() %></td>
			<td style="border: 1px solid;"><%=pv.getTel() %></td>
			<td style="border: 1px solid;"><%=pv.getDate() %></td>
		</tr>
		
		<tr>
			<td style="border: 1px solid;">진료내용</td>
			<td width=30 style="word-break:break-all; border: 1px solid"" colspan=4><%=pv.getStatus() %></td>
		</tr>
	</table>
<%-- 			<td><a href="/pmedical02/pm?a=delete&no=<%= pv.getNo()%>">삭제</a></td>
			<td><a href="/pmedical02/pm?a=updateform&no=<%= pv.getNo()%>">수정</a></td>
 --%><table>
		<tr>
			<td colspan=2 align=left><button onclick="window.location.href='/pmedical02/pm?a=delete&no=<%= pv.getNo()%>'">삭제</button></td>
			<td colspan=2 align=left><button onclick="window.location.href='/pmedical02/pm?a=updateform&no=<%= pv.getNo()%>'">수정</button></td>
		</tr>
	</table>
	<br>
	
	<% 
		}
	%>
</body>
</html>