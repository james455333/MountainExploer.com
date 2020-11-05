package product.dbImport;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.hibernate.Hibernate;
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

@WebServlet("/product/DbDataImportServlet")
public class DbDataImportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String imgTitle = "imgShop";
	private static int imgNum = 1;
	private static final String CHARSET = "UTF-8";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String path1 = "C:\\imges/imgShop1.jpg";
//		path1 = path1.concat(imgTitle);
//		String imgNUMString = String.valueOf(imgNum++);
//		path1 = path1.concat(imgNUMString + ".jpg");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();

		File file = new File("C:\\DataSource\\workspace\\MountainEX_Project\\data/shopitem_UTF8.csv");
//		File file = new File("C:\\iii\\csv/shopitem_MS950.csv");
		importDataToDB(file, session, request, response);

	}

//		String url = "";
//		InputStream is = new URL(url).openStream();
	public static void importDataToDB(File file, Session session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
//		int importCounter = 0;

		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, CHARSET);
				BufferedReader br = new BufferedReader(isr);) {
			CSVParser parser = CSVFormat.EXCEL.withHeader().parse(br);
			out.write("檔案載入成功");
			
			FirstClassDAO firstClassDAO = new FirstClassDAO();
			SecondClassDAO secondClassDAO = new SecondClassDAO();
			ItemBasicDAO itemBasicDAO = new ItemBasicDAO();
			ItemInfoDAO itemInfoDAO = new ItemInfoDAO();
			
			List<CSVRecord> results = parser.getRecords();
			Set<FirstClass> firstSet = null;
			// 資料要先分類
			for (CSVRecord csvRecord : results) {
				// FirstClass資料注入
				firstSet = new HashSet<FirstClass>();

				FirstClass firstBean = new FirstClass();
				String firstClassName = csvRecord.get("FIRST_CLASS_NAME");

				firstBean.setName(firstClassName);

				firstSet.add(firstBean);
				
			}
			
			for (CSVRecord csvRecord : results) {
				Iterator<FirstClass> firstIterator = firstSet.iterator();
				while(firstIterator.hasNext()) {
					// SecondClass資料注入
					FirstClass checkFirst = firstIterator.next();
					String firstClassName = csvRecord.get("FIRST_CLASS_NAME");
					if((checkFirst.getName()).equals(firstClassName)) {
						Set<SecondClass> secondSet = checkFirst.getSecondClasses();
						SecondClass secondBean = new SecondClass();
						String secondClassName = csvRecord.get("SECOND_CLASS");
						secondBean.setName(secondClassName);
						
						secondSet.add(secondBean);
					}
					
				}
				
			}
			// ItemBasic及ItemBasic資料注入
			for (CSVRecord csvRecord : results) {
				Iterator<FirstClass> firstIterator = firstSet.iterator();
				while (firstIterator.hasNext()) {
					FirstClass checkFirst = firstIterator.next();
					String firstClassName = csvRecord.get("FIRST_CLASS_NAME");
					if((checkFirst.getName()).equals(firstClassName)) {
						Iterator<SecondClass> secondIterator = checkFirst.getSecondClasses().iterator();
						while (secondIterator.hasNext()) {
							SecondClass checkSecond = secondIterator.next();
							String secondClassName = csvRecord.get("SECOND_CLASS");
							if((checkSecond.getName()).equals(secondClassName)) {
								Set<ItemBasic> itemBasics = checkSecond.getItemBasics();
								
								//ItemInfo資料注入
								ItemInfo itemInfoBean = new ItemInfo();
								String name = csvRecord.get("NAME");
								int stock = 100;
								String type = csvRecord.get("TYPE");
								String price = csvRecord.get("PRICE");
								String imgURL = csvRecord.get("IMG_URL");
								String description = csvRecord.get("DESCRIPTION");
								
								itemInfoBean.setName(name);
								itemInfoBean.setStock(stock);
								itemInfoBean.setType(type);
								itemInfoBean.setType(price);
								byte[] bytesDescption = description.getBytes(CHARSET);
								Blob descptionBlob = Hibernate.getLobCreator(session).createBlob(bytesDescption);
								itemInfoBean.setDescription(descptionBlob);
								String localPath = downloadGetLocalPath(imgURL);
								byte[] bytesImgURL = localPath.getBytes(CHARSET);
								Blob imgUrlBlob = Hibernate.getLobCreator(session).createBlob(bytesImgURL);
								itemInfoBean.setImgUrl(imgUrlBlob);
								//ItemBasic資料注入
								ItemBasic itemBasicBean = new ItemBasic();
								itemBasicBean.setItemInfo(itemInfoBean);
								itemBasicBean.setSecondClass(checkSecond);
								itemBasics.add(itemBasicBean);
								
								itemInfoBean.setItemBasic(itemBasicBean);
								System.out.println(name);
							}
							
							
						}
						
						
					}
				}
				
				
			}
			
			Iterator<FirstClass> firstIterator = firstSet.iterator();
			while (firstIterator.hasNext()) {
				FirstClass next = firstIterator.next();
				firstClassDAO.insert(next);
			}

		}

	}

	public static String downloadGetLocalPath(String imgURL) throws UnsupportedEncodingException {

		String routeImgNum = String.valueOf(imgNum++);
		String localPath = "C:\\DataSource\\workspace\\MountainEX_Project\\src\\main\\webapp\\shopping\\images/"
				+ imgTitle + routeImgNum + ".jpg";

		// download
		try (InputStream is = new URL(imgURL).openStream();) {
			Files.copy(is, Paths.get(localPath), StandardCopyOption.REPLACE_EXISTING);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (MalformedURLException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		return localPath;
	}

}
