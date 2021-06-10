

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdatePro
 */
@WebServlet("/UpdatePro")
public class UpdatePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String pid=request.getParameter("pid");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String cat=request.getParameter("cat");
		String cmp=request.getParameter("cmp");
		out.println("PRODUCT_ID"+pid);
		out.println("<form action=Update>");
		out.println("<input type=hidden name=pid value="+pid+" /><br>");
		out.println("NAME<input type=text name=name value="+name+" /><br>");
		out.println("PRICE<input type=number name=price value="+price+" /><br>");
		out.println("CATEGORY<input type=text name=cat value="+cat+" /><br>");
		out.println("COMPANY<input type=text name=cmp value="+cmp+" /><br>");
		out.println("<input type=submit value=Update /><br>");
		out.println("</form>");
	}

}
