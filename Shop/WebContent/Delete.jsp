<%@page import="java.sql.PreparedStatement"%>
<%@ include file="db.jsp" %>
<%
String pid=request.getParameter("pid");
String qr="delete from product  where pid=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1,pid);
int i=ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("Show.jsp");
if(i>0)
{
	rd.include(request,response);
	out.println("deleted");
}
else
{
	rd.include(request,response);
	out.println("not deleted");
}
con.close();


%>