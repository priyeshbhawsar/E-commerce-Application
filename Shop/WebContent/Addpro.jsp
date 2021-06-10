<%@page import="java.sql.PreparedStatement"%>
<%@ include file="db.jsp" %>
<%
String pid=request.getParameter("pid");
String name=request.getParameter("name");
String p=request.getParameter("price");
int price=Integer.parseInt(p);
String cat=request.getParameter("cat");
String cmp=request.getParameter("cmp");
String img=request.getParameter("img");
String qr="insert into product values(?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, pid);
ps.setString(2, name);
ps.setInt(3, price);
ps.setString(4, cat);
ps.setString(5, cmp);
ps.setString(6, img);
int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("Show.jsp");
	out.println("record added");
}
else
{
	out.println("record not added");
}
con.close();
%>