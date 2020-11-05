package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import product.model.ItemBasicDAO;
import product.model.ItemInfoDAO;
import util.HibernateUtil;

@WebServlet("/ProductUpdateServlet")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Update(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Update(request, response);
	}

	private void Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		ItemBasicDAO itemBasicDAO = new ItemBasicDAO(session);
		ItemInfoDAO itemInfoDAO = new ItemInfoDAO(session);
		
		itemBasicDAO.update(Integer.valueOf((String)request.getAttribute("stock")));
		itemInfoDAO.update(Integer.valueOf((String)request.getAttribute("price")));
       
		RequestDispatcher rd = request.getRequestDispatcher("shopBackStage.jsp");
		rd.forward(request, response);
	}

}
