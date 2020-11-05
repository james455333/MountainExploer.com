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

import product.model.ItemBasic;
import product.model.ItemBasicDAO;
import util.HibernateUtil;

@WebServlet("/ProductInsertServlet")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Insert(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Insert(request, response);
	}

	private void Insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		ItemBasicDAO itemBasicDAO = new ItemBasicDAO(session);
		
		ItemBasic ibBean = new ItemBasic();
		
		
		itemBasicDAO.insert(ibBean);
		
		RequestDispatcher rd = request.getRequestDispatcher("shopBackStage.jsp");
		rd.forward(request, response);
		return;
	}

}
