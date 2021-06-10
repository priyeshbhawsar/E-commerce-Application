<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp" %>
<%
String iname=request.getParameter("iname");
String pid=(String)session.getAttribute("pid");
String qr="update product set img=? where pid=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, iname);
ps.setString(2, pid);
ps.executeUpdate();
out.println("uploaded sucessfully");
%>
