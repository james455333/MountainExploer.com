package house.act;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import house.mountainhouseList.model.HouseInfoBean;
import house.mountainhouseList.model.HouseOrderBean;
import house.mountainhouseList.service.HouseInfoBeanService;
import house.mountainhouseList.service.HouseOrderService;
import member.model.MemberBasic;
import oracle.net.aso.m;

@Controller
@RequestMapping("/mountainHouseActOrder")
@SessionAttributes(names = {"Member"})
public class ActHouseOrderController {
	@Autowired
	private HouseOrderService houseOrderService;
	@Autowired
	private HouseInfoBeanService houseService;
	
	//新增訂單  訂房
	@GetMapping("/inserhouseorder")
	public String inserHouseOrder(HouseOrderBean houseorder,Model m,
			@RequestParam(name = "houseorder_amount")Integer amount,@RequestParam(name = "houseorder_shoppingDate") String shoppingDate,
			@RequestParam(name = "houseorder_bookDate")String bookDate ,@RequestParam(name = "houseorder_price") Integer price ,
			@RequestParam(name = "houseorder_houseid")Integer houseid ) {
			
			if (m.getAttribute("Member") == null) {
				return "redirect:/member/memberLoginEntry";
			}
			
			HouseInfoBean houseInfoBean = houseService.select(houseid);
			houseorder.setAmount(amount);
			houseorder.setBookdate(bookDate);
			houseorder.setPrice(price);
			houseorder.setShoppingdate(shoppingDate);
			houseorder.setHousebasicid(houseInfoBean);
			houseorder.setMemberbasicid((MemberBasic) m.getAttribute("Member"));
			
			houseOrderService.inserHouseOrder(houseorder);
			
			return "redirect:/mountainHouseActOrder/selecthouseorderid";
	}
	
	//查詢訂單ID
	@GetMapping("/selecthouseorderid")
	public String selectHouseOrder(@RequestParam(name = "houseorder_id") Integer houseorderid,Model m) {
		
		List<HouseOrderBean> list = houseOrderService.selecthouseid(houseorderid);
		m.addAttribute("list",list);
		return "house/act/actHouseOrder";
	}
	
	// Member house order select
	@GetMapping("/selectmemberorder")
	public String selectMemberOrder(Model m) {
		if (m.getAttribute("Member") == null) {
			return "redirect:/member/memberLoginEntry";
		}
		MemberBasic mBasic = (MemberBasic) m.getAttribute("Member");
		Integer memberid = mBasic.getSeqno();
		List<HouseOrderBean> list = houseOrderService.selectmemberid(memberid);
		m.addAttribute("list",list);
		return "house/act/actHouseOrder";
		
	}
	@GetMapping("/deletehouseorder")
	public String deleteHouseOrder(Model m,@RequestParam(name = "delete_houseorderid") Integer houseorderid,@RequestParam(name = "select_houseid")Integer houseid) {
		houseOrderService.deleteHouseOrder(houseorderid);
		List<HouseInfoBean> list = houseService.selecthouseid(houseid);
		m.addAttribute("selecthouseid",list);
		return "house/act/Deschouse";
	}
	
	
	
}
