<%@page import="java.sql.PreparedStatement"%>
<%@include file="db.jsp" %>
<%
String email=(String) session.getAttribute("id");
String pid=request.getParameter("pid");
String name=request.getParameter("name");
String p=request.getParameter("price");
int price=Integer.parseInt(p);
String cat=request.getParameter("cat");
String cmp=request.getParameter("cmp");
String qr="insert into cart values(?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, pid);
ps.setString(2, name);
ps.setInt(3, price);
ps.setString(4, cat);
ps.setString(5, cmp);
ps.setString(6, email);
int i=ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("Uhome.jsp");
if(i>0)
{
	rd.include(request, response);
	out.println("<script>window.alert('sucessfully added to cart');</script>");
}
else
{
	rd.include(request, response);
	out.println("<script>window.alert('not to cart');</script>");
}
con.close();
%>