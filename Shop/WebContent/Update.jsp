<%@page import="java.sql.PreparedStatement"%>
<%@ include file="db.jsp" %>
<%
String pid=request.getParameter("pid");
String name=request.getParameter("name");
String p=request.getParameter("price");
int price=Integer.parseInt(p);
String cat=request.getParameter("cat");
String cmp=request.getParameter("cmp");
String qr="update product set name=?,price=?,cat=?,cmp=? where pid=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(5, pid);
ps.setString(1, name);
ps.setInt(2, price);
ps.setString(3, cat);
ps.setString(4, cmp);
int i=ps.executeUpdate();
//response.sendRedirect("Show.jsp");
RequestDispatcher rd=request.getRequestDispatcher("Show.jsp");
if(i>0)
{
	rd.include(request,response);
	out.println("updated");
}
else
{
	rd.include(request,response);
	out.println("not updated");
}
con.close();

%>