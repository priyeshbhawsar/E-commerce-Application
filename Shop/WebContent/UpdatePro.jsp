<%
String pid=request.getParameter("pid");
String name=request.getParameter("name");
String price=request.getParameter("price");
String cat=request.getParameter("cat");
String cmp=request.getParameter("cmp");
%>
<form action="Update.jsp">
<%=pid %>
pid<input type=hidden name=pid value="<%=pid %>"/><br>
NAME<input type=text name=name value="<%=name %>" /><br>
PRICE<input type=number name=price value="<%=price %>" /><br>
CATEGORY<input type=text name=cat value="<%=cat %>" /><br>
CAMPANY<input type=text name=cmp value="<%=cmp %>" /><br>
<input type="submit" value ="Update"/><br>
</form>