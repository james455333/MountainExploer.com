package house.act;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import house.mountainhouseList.model.HouseInfoBean;
import house.mountainhouseList.model.HouseOrderBean;
import house.mountainhouseList.service.HouseInfoBeanService;
import house.mountainhouseList.service.HouseOrderService;
import member.model.MemberBasic;

@Controller
@RequestMapping("/mountainHouseActOrder")
@SessionAttributes(names = {"Member"})
public class ActHouseOrderController {
	@Autowired
	private HouseOrderService houseOrderService;
	@Autowired
	private HouseInfoBeanService houseService;
	
//	@GetMapping("/mountainHouseActOrder/inserhouseorder")
	@GetMapping("/inserhouseorder")
	public String inserHouseOrder(HouseOrderBean houseorder , Model m ,
			@RequestParam(name = "houseorder_bedamount")Integer bedamount,
			@RequestParam(name = "houseorder_campamount")Integer campamount,
			@RequestParam(name = "houseorder_houseid")Integer houseid,
			@RequestParam(name = "houseorder_shoppingdate")String shoppingdate,
			@RequestParam(name = "houseorder_bookdate")String bookdate,
			@RequestParam(name = "houseorder_bookdate")String daterange,
			@RequestParam(name = "houseorder_price")Integer price,
			@RequestParam(name = "houseorder_peoplename")String peoplename,			
			@RequestParam(name = "houseorder_cellphone")Integer cellphone,
			@RequestParam(name = "houseorder_textsuggest")String textsuggest) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		
		String qewtString = "";
		List<String> days = getDays(bookdate);
		for (String string : days) {
			qewtString += string;
		}
		HouseInfoBean houseInfoBean = houseService.select(houseid);
		houseorder.setHousebasicid(houseInfoBean);
		houseorder.setPeoplename(peoplename);
		houseorder.setBedamount(bedamount);
		houseorder.setBookdate(qewtString);
		houseorder.setCampamount(campamount);
		houseorder.setCellphone(cellphone);
		houseorder.setDaterange(daterange);
		houseorder.setMemberbasicid((MemberBasic) m.getAttribute("Member"));
		houseorder.setPrice(price);
		houseorder.setShoppingdate(shoppingdate);
		houseorder.setTextsuggest(textsuggest);
		
		System.out.println("-------------------"+price);
		houseOrderService.inserHouseOrder(houseorder);
		return "redirect:/mountainHouseActOrder/selecthouseorder";
		
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
		
		
	@GetMapping("/selecthouseorder")
	public String selectHouseOrder(Integer houseorderid , Model m) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		
		MemberBasic mb = (MemberBasic) m.getAttribute("Member");
		Integer memberid = mb.getSeqno();
		List<HouseOrderBean> list = houseOrderService.selectmemberid(memberid);
		System.out.println("+++++++++++++++++++" + list);
		String membername = mb.getName();
		
		
		m.addAttribute("membername",membername);
		m.addAttribute("memberhouseorder",list);
		return "house/act/HouseMemberOrder";

	}
	
	@GetMapping("/deletehouseorder")
	public String deleteHouseOrder(Model m,@RequestParam(name = "deleteorderid")Integer houseorderid) {
		
		houseOrderService.deleteHouseOrder(houseorderid);
		return "redirect:/mountainHouseActOrder/selecthouseorder";

	}
	
	@GetMapping("/orderjump")
	public String jumporder(@RequestParam(name = "orderjump_houseid")Integer houseid , Model m ,
			@RequestParam(name = "orderjump_bookdate")String bookdate,
			@RequestParam(name = "orderjump_totelprice")Integer totelprice,
			@RequestParam(name = "orderjump_bedamount")Integer bedamount,
			@RequestParam(name = "orderjump_campamount")Integer campamount) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		
		List<String> days = getDays(bookdate);
		Integer bookneight = (days.size()-1);
		m.addAttribute("bookneight",bookneight);
		
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		
		m.addAttribute("list",list);
		m.addAttribute("bedamount",bedamount);
		m.addAttribute("campamount",campamount);
		m.addAttribute("totelprice",totelprice);
		m.addAttribute("selectdate",bookdate);
		
		return "house/act/actHouseOrder";
		
	}
	
	//select house bed / camp left amount
	@GetMapping("/selectamount")
	public String houseamount(@RequestParam(name = "selecthouseid")Integer houseid,Model m ,
			@RequestParam(name = "select_bookdate")String bookdate) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		HouseInfoBean houseInfoBean = houseService.select(houseid);
		Integer bedallamount = houseInfoBean.getBed(); 	//床位All
		Integer campallamount = houseInfoBean.getCamp();	//營地位All
		
		m.addAttribute("selectdate",bookdate);
		
		List<String> days = getDays(bookdate);
		Integer bookneight = (days.size()-1);
		m.addAttribute("bookneight",bookneight);
		
		int bedamount = 0;
		int campamount = 0;
		
		for (String string : days) {
			Integer bookorderbed = houseOrderService.selectdatebed(string, houseid);
			if (bookorderbed > bedamount) {
				bedamount = bookorderbed;
			}
			Integer bookordercamp = houseOrderService.selectdatecamp(string, houseid);
			if (bookordercamp > campamount) {
				campamount = bookordercamp;
			}
//			System.out.println("+++++++++++++++++++++++++ bedamount : " + bedamount); //區間訂床最多數
//			System.out.println("+++++++++++++++++++++++++ campamount : " + campamount);
		}
		
		Integer leftbedamount = bedallamount - bedamount;
		Integer leftcampamount = campallamount - campamount;
		
		m.addAttribute("leftbedamount",leftbedamount);	//剩餘床位
		m.addAttribute("leftcampamount",leftcampamount);
		
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		Integer bedprice = houseInfoBean.getBedprice();
		Integer campprice = houseInfoBean.getCampprice();
		
		m.addAttribute("houseid",houseid);
		m.addAttribute("selecthouseid",list);
		m.addAttribute("house",list);
		m.addAttribute("bedprice",bedprice);
		m.addAttribute("campprice",campprice);
		
		return "house/act/Deschouse";
	}
	
	
	// House bed amount select ajax
	@GetMapping("/orderhousebedamount")
	@ResponseBody
	public List<HouseInfoBean> housetotalprice(@RequestParam(name = "selecthouseid")Integer houseid){
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		
		return list;
	}
	
	
	
}
