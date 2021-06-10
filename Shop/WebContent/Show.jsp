<%@page errorPage="error.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="db.jsp"%>
<body style="background-color:powderblue;" >
<table align="center" border="1px" ;>
<tr>
<th>PRODUCT_ID</th><th>PRODUCT_NAME</th><th>PRODUCT_PRICE</th><th>PRODUCT_CATEGORY</th><th>PRODUCT_COMPANY</th>
</tr>
<%
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
		String iname=rs.getString("img");
		%>
		<tr>
		
		<td><%=pid %></td>
		
		<td><%=name%></td>
		<td><%=price%></td>
		<td><%=cat%></td>
		<td><%=cmp%></td>
		<td><a href="UpdatePro.jsp?pid=<%=pid %>&name=<%=name %>&price=<%=price %>&cat=<%=cat %>&cmp=<%=cmp %>">Update</a></td>
		<td><a href="Delete.jsp?pid=<%=pid %>">delete</a></td>
		<td><img src="<%=iname %>" alt="noimg" height="100px" width="100px" /></td>
		<td><a href="uploadimg.jsp?pid=<%=pid %>">Upload Image</a></td>
		<td><a href=adminhome.jsp>Adminhome</a></td>
		</tr>
		<%
		
	}while(rs.next());
}
else
{
	
	out.println("no records found");
}
con.close();
%>
</table>
</body>