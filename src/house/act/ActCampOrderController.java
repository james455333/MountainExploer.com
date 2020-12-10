package house.act;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import house.mountainhouseList.model.CampInfoBean;
import house.mountainhouseList.model.CampOrderBean;
import house.mountainhouseList.service.CampInfoBeanService;
import house.mountainhouseList.service.CampOrderService;
import member.model.MemberBasic;

@Controller
@RequestMapping("/mountaincCampActOrder")
@SessionAttributes(names = { "Member" })
public class ActCampOrderController {
	@Autowired
	private CampOrderService campOrderService;
	@Autowired
	private CampInfoBeanService campService;

	@InitBinder
	public void allowEmptyDateBinding(WebDataBinder binder) {
		// Custom String Editor. tell spring to set empty values as null instead of
		// empty string.
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));

		// Custom Date Editor

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日");
		simpleDateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, false));
	}

//	@GetMapping("/mountaincCampActOrder/insercamporder") 只要填寫資料
	@GetMapping("/insercamporder")
	public String inserCampOrder(CampOrderBean camporder, Model m,
			@RequestParam(name = "camporder_amount") Integer amount,
			@RequestParam(name = "camporder_shoppingdate") String shoppingdate,
			@RequestParam(name = "camporder_bookdate") String bookdate, Integer price,
			@RequestParam(name = "camporder_campid") Integer campid,
			@RequestParam(name = "camporder_peoplename")String peoplename,
			@RequestParam(name = "camporder_bookdate")String daterange) {

		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}

		String qewString = "";
		List<String> days = getDays(bookdate);
		for (String string : days) {
			qewString += string;
		}

		CampInfoBean campInfoBean = campService.select(campid);
		camporder.setCampbasicid(campInfoBean);
		
		camporder.setAmount(amount);
		camporder.setPeoplename(peoplename);
		camporder.setBookdate(qewString);
		camporder.setDaterange(bookdate);
		camporder.setPrice(price);
		camporder.setShoppingdate(shoppingdate);
		camporder.setMemberbasicid((MemberBasic) m.getAttribute("Member"));

		campOrderService.inserCampOrder(camporder);
		return "redirect:/mountaincCampActOrder/selectcamporder";
	}
	//查詢Member order 
	@GetMapping("/selectcamporder") 
	private String selectCampOrder(Integer camporderid, Model m ) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		MemberBasic mb = (MemberBasic) m.getAttribute("Member");
		Integer memberSeqno = mb.getSeqno();
		List<CampOrderBean> selectMemberOrders = campOrderService.selectmemberid(memberSeqno);

		m.addAttribute("memberorder", selectMemberOrders);
		return "house/act/MemberOrder";

	}

	@GetMapping("/selectmemberorder")
	private String selectMemberOrder(Model m ) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		MemberBasic mBasic = (MemberBasic) m.getAttribute("Member");
		Integer memberid = mBasic.getSeqno();
		List<CampOrderBean> list = campOrderService.selectmemberid(memberid);

		m.addAttribute("list", list);
		return "house/act/actCampOrder";
	}

	// delete order
	@GetMapping("/deletecamporder")
	private String deleteCampOrder(Model m, Integer camporderid) {

		campOrderService.deleteCampOrder(camporderid);
		return "house/act/actCampOrder";
	}

	//inser order jump
	@GetMapping("/orderjump")
	public String jumptoorder(@RequestParam(name = "orderjump_campid") Integer campid, Model m,@RequestParam(name = "orderjump_bookdate")String bookdate) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}

		List<CampInfoBean> list = campService.selectcampid(campid);
		
		m.addAttribute("list", list);
		m.addAttribute("selectdate",bookdate);
		return "house/act/actCampOrder";
	}

	// 日期運算
	public static List<String> getDays(String bookdate) {

		// 返回的日期集合

		List<String> days = new ArrayList<String>();

		String[] datesplit = bookdate.split("~");
		DateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日");
		try {

			Date start = dateFormat.parse(datesplit[0]);
			Date end = dateFormat.parse(datesplit[1]);

			Calendar tempStart = Calendar.getInstance();
			tempStart.setTime(start);

			Calendar tempEnd = Calendar.getInstance();
			tempEnd.setTime(end);
			tempEnd.add(Calendar.DATE, +1);// 日期加1(包含结束)
			while (tempStart.before(tempEnd)) {
				days.add(dateFormat.format(tempStart.getTime()));
				tempStart.add(Calendar.DAY_OF_YEAR, 1);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return days;
	}

	// ajax date order select 庫存
	
	@RequestMapping("/selectamount")
	public String campamount(@RequestParam(name = "selectcampid")Integer campid, @RequestParam(name = "select_bookdate") String bookdate, Model m) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		CampInfoBean campInfoBean = campService.select(campid);
		Integer campamount = campInfoBean.getCampamount(); //總庫存
//印出查詢~日期
		m.addAttribute("selectdate",bookdate); 
		
		CampOrderBean campOrderBean = new CampOrderBean();
		Integer orderamount = campOrderBean.getAmount();
		// 日期查詢
		List<String> days = getDays(bookdate);
				
//已訂房數量		
		int hotel = 0;
		for (String string : days) {
			
			System.out.println("+++++++++++++++++"+(days.size()-1));
			Integer bookorderdate = campOrderService.selectdate(string,campid);
			if(bookorderdate>hotel) {
				hotel = bookorderdate;
			}
			System.out.println("................."+bookorderdate);
			System.out.println("----------------------"+hotel);
		}
		
		
		
//露營地資訊		
		List<CampInfoBean> list = campService.selectcampid(campid); //原本資料
		
		m.addAttribute("selectcamp",list);
		
		return "house/act/DescCamp";
	}
	
	
	
	
}
