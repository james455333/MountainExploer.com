package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.LifecycleListener;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import antlr.collections.List;
import product.model.ItemBasic;
import product.model.ItemBasicDAO;
import util.HibernateUtil;


/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/ProductDeleteServlet")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Delete(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Delete(request, response);
	}

	private void Delete(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		boolean result = new ItemBasicDAO(session).delete(request.getParameter("name"));
		
		if (result) {
			System.out.println("刪除成功");
		}else {
			System.out.println("刪除失敗");
		}
       
		RequestDispatcher rd = request.getRequestDispatcher("shopBackStage.jsp");
		rd.forward(request, response);
		
		
		
	}
	
	
}
