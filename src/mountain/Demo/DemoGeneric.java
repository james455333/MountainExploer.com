package mountain.Demo;

import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.print.attribute.HashAttributeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import mountain.MountainGlobal;
import mountain.back.GenericDAO.GenericDAO;
import mountain.back.GenericService.AbstractService;
import mountain.back.GenericService.GenericService;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteBasic;
import mountain.mountainList.model.RouteInfo;

@Controller
public class DemoGeneric {
	
//	@Autowired
//	private  GenericDAO<NationalPark> nPDAO;
	@Autowired
	private GenericService<RouteBasic> npService;
	
	@RequestMapping(path = "/mountain/demoGeneric")
	public String demoGeneric( Model model) throws UnsupportedEncodingException {
		
		NationalPark nationalPark = new NationalPark();
		RouteBasic routeBasic = new RouteBasic();
		RouteInfo routeInfo = new RouteInfo();
		//	設定測試內值
		
		
		
//		nationalPark.setName("updateGeneric1");
		AbstractService<RouteBasic> npService = this.npService;
		npService.save(routeBasic);
		
		
		//Select(int) Success
//		nationalPark = npService.select(304);
		
		//select(String) Success
//		NationalPark npBean = npService.select("testGeneric");
		
		//selectAll() Success
//		List<NationalPark> selectAll = npService.selectAll();
		//insert(obj) Success
//		NationalPark insert = npService.insert(nationalPark);
//		if (insert != null) {
//		model.addAttribute("result", npBean);
//		}

		//update(obj) Success 		
		//要update從資料庫select方法抓取出來的資料 否則會出錯
//		nationalPark.setName("updateGeneric");
//		NationalPark update = npService.update(nationalPark);
		
		//delete(int) Success
//		boolean delete = npService.delete(304);
		
		//新增雙向資料
		nationalPark.setName("damn");
		
		routeInfo.setName("GenericTest");
		routeInfo.setTraffic("GenerciTraffic".getBytes(MountainGlobal.CHARSET));
		routeInfo.setAdvice("GenerciAdvice".getBytes(MountainGlobal.CHARSET));
		routeInfo.setDescription("GenerciDescription".getBytes(MountainGlobal.CHARSET));
		routeInfo.setRoute_basic(routeBasic);
		routeBasic.setRouteInfo(routeInfo);
		routeBasic.setNational_park(nationalPark);
		Set<RouteBasic> routBasicSet= new HashSet<RouteBasic>();
		routBasicSet.add(routeBasic);
		nationalPark.setRouteBasic(routBasicSet);
		
		NationalPark insert = npService.insert(nationalPark);
		
		model.addAttribute("result", insert);
		return "mountain/back/demoGeneric";
	}
	
}
