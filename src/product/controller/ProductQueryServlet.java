package product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import product.model.FirstClass;
import product.model.FirstClassDAO;
import product.model.ItemBasic;
import product.model.ItemBasicDAO;
import product.model.ItemInfo;
import product.model.ItemInfoDAO;
import product.model.SecondClass;
import product.model.SecondClassDAO;
import util.HibernateUtil;

@WebServlet("/ProductQueryServlet")
public class ProductQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Query(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Query(request, response);
	}

	private void Query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();

		FirstClassDAO firstClassDAO = new FirstClassDAO(session);
		SecondClassDAO secondClassDAO = new SecondClassDAO(session);
		 ItemBasicDAO itemBasicDAO = new ItemBasicDAO(session);
		 ItemInfoDAO itemInfoDAO = new ItemInfoDAO(session);
		if (request.getParameter("firstclass") != null) {
			List<FirstClass> firstClassList= firstClassDAO.selectAll();
			((ServletRequest) session).setAttribute("query", firstClassList);
		}
		if (request.getParameter("secondclass") != null) {
			List<SecondClass> secondClassList =secondClassDAO.selectAll();
			((ServletRequest) session).setAttribute("query", secondClassList);
		}
		if (request.getParameter("itembasic") != null) {
			List<ItemBasic> itemBasicList = itemBasicDAO.selectAll();
			((ServletRequest) session).setAttribute("query", itemBasicList);
		}
		if (request.getParameter("iteminfo") != null) {
			List<ItemInfo> itemInfoList = itemInfoDAO.selectAll();
			((ServletRequest) session).setAttribute("query", itemInfoList);
		}
		
       
		RequestDispatcher rd = request.getRequestDispatcher("shopBackStage.jsp");
		rd.forward(request, response);
		return;
		
		
	}
}
