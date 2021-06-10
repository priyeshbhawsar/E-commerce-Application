<h1 align="center">your cart elements</h1>
<%@page import="java.sql.PreparedStatement"%>
<%
String email=(String) session.getAttribute("id");
out.println("welcome "+email);
%>
<a href="Logout">Logout</a>
<%@page errorPage="error.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="db.jsp"%>
<%
String qr="select * from cart where email=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, email);
ResultSet rs=ps.executeQuery();
int total=0;
if(rs.next())
{
	do
	{
		String pid=rs.getString("pid");
		String name=rs.getString("name");
		int price=rs.getInt("price");
		String cat=rs.getString("cat");
		String cmp=rs.getString("cmp");
		total=total+price;
		%>
		<div style="height: 200px;width: 100%;background-color: rgb(100,100,100);color: white;text-align: center;">
	PRODUCT NAME: <%=name %><br><br>
	PRODUCT PRICE: <%=price %><br><br>
	PRODUCT CATEGORY: <%=cat %><br><br>
	PRODUCT COMPANY : <%=cmp %><br><br>
	<hr>
	</div>
		<%
	}while(rs.next());
}
else
{
	out.println("no records found");
}
con.close();
%>
<h2 align="center">TOTAL AMOUNT IS : <%=total %></h2>
<br>
<br>
<a href="https://www.paypal.com/signin">CHECK OUT</a>
