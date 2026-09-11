

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public loginservlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		
		if(name.equals("admin")&& pass.equals("admin123")) {
			response.sendRedirect("adminui.jsp");
		}
		else {
			
			
			response.sendRedirect("adminlogin.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
