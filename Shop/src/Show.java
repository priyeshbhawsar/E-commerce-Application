

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Show
 */
@WebServlet("/Show")
public class Show extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava","root","root");
			String qr="select * from product";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(qr);
			if(rs.next())
			{
				out.println("<table align='center' border='1px' >");
				out.println("<th>PRODUCT_ID</th><th>PRODUCT_NAME</th><th>PRODUCT_PRICE</th><th>PRODUCT_CATEGORY</th><th>PRODUCT_COMPANY</th>");
				do
				{
					String pid=rs.getString("pid");
					String name=rs.getString("name");
					int price=rs.getInt("price");
					String cat=rs.getString("cat");
					String cmp=rs.getString("cmp");
					out.println("<tr>");
					out.println("<td>");
					out.println(pid);
					out.println("</td>");
					out.println("<td>");
					out.println(name);
					out.println("</td>");
					out.println("<td>");
					out.println(price);
					out.println("</td>");
					out.println("<td>");
					out.println(cat);
					out.println("</td>");
					out.println("<td>");
					out.println(cmp);
					out.println("</td>");
					out.println("<td>");
					out.println("<a href=Delete?pid="+pid+" >delete</a>");
					out.println("</td>");
					out.println("<td>");
					out.println("<a href=UpdatePro?pid="+pid+"&name="+name+"&price="+price+"&cat="+cat+"&cmp="+cmp+" >Update</a>");
					out.println("</td>");
					out.println("</tr>");
				}while(rs.next());
				out.println("</table>");
			}
			else
			{
				out.println("no records found");
			}
			con.close();
		}catch(Exception e)
		{
			out.println(e);
		}
	}

}
