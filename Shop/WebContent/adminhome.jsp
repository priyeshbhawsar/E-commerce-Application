<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  background-image: url('a1.jpg');
}
</style>
</head>
<body>
<h1>welcome to admin home</h1>
<%
String id=(String)session.getAttribute("id");
%>
<%="welcome "+id %><br><br>
<a href="addpro.html">Add Product</a><br><br>
<a href="delpro.html">Delete Product</a><br><br>
<a href="update.html">Update Product</a><br><br>
<a href="Show.jsp">Show Product</a><br><br>
</body>
</html>