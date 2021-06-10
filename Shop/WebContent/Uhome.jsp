<%
String email=(String) session.getAttribute("id");
out.println("welcome "+email);
%>
<a href="Logout">Logout</a>
<a href="viewcart.jsp"><img src="cart.jpg" height="25px" width="25px" /></a>
<%@page errorPage="error.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="db.jsp"%><%
String qr="select * from product";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(qr);
if(rs.next())
{
	do
	{
		String pid=rs.getString("pid");
		String name=rs.getString("name");
		int price=rs.getInt("price");
		String cat=rs.getString("cat");
		String cmp=rs.getString("cmp");
		%>
		<div style="height: 200px;width: 100%;background-color: rgb(100,100,100);color: white;text-align: center;">
	PRODUCT NAME: <%=name %><br><br>
	PRODUCT PRICE: <%=price %><br><br>
	PRODUCT CATEGORY: <%=cat %><br><br>
	PRODUCT COMPANY : <%=cmp %><br><br>
	<a href="https://www.paypal.com/signin">BUY NOW</a>
	<a href="addcart.jsp?pid=<%=pid %>&name=<%=name %>&price=<%=price %>&cat=<%=cat %>&cmp=<%=cmp %>">ADD TO CART</a>
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
