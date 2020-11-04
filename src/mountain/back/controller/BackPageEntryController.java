package mountain.back.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mountain.back.function.TransFuction;
import mountain.mountainList.model.MountainBean;
import mountain.mountainList.model.NationalPark;
import mountain.mountainList.model.RouteInfo;
import mountain.mountainList.service.NationalParkHibernateService;
import mountain.mountainList.service.RouteInfoHibernateService;
import mountain.mountainList.service.impl.NationalParkService;
import mountain.mountainList.service.impl.RouteInfoService;

@Controller
public class BackPageEntryController {
	@Autowired
	private RouteInfoHibernateService rtInfoService;
	@Autowired
	private NationalParkHibernateService npService;
	
	@RequestMapping(path = "/mountainBackStage/createDataPage" , method = RequestMethod.GET)
	public String createPage() {
		
		return "mountain/back/backMountainCreate";
	}
	
	@RequestMapping(path = "/mountainBackStage/updateDataPage" , method = RequestMethod.GET)
	public String updatePage(@RequestParam(name = "seqno")String seqno, Model model) {
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		updateViewSet(seqno,model,errors);
		
		
		
		if (!errors.isEmpty()) {
			return "mountain/back/backMountain";
		}
		
		return "mountain/back/backMountainUpdate";
	}

	private void updateViewSet(String seqno, Model model, Map<String, String> errors) {
		NationalParkService npService = this.npService;
		RouteInfoService rtInfoService = this.rtInfoService;
		
		// 設置現有國家公園列表
		List<NationalPark> npBeans = npService.selectAll();
		model.addAttribute("npBean", npBeans);
		Integer rbPK = Integer.valueOf(seqno);
		RouteInfo select = rtInfoService.select(rbPK);
		// 設置本資料預設國家公園
		NationalPark selectNP = select.getRoute_basic().getNational_park();
		model.addAttribute("defaultNP",selectNP.getId());
		if (select!=null) {
			try {
				List<MountainBean> transSingleRI = TransFuction.transSingleRI(select);
				MountainBean mountainBean = transSingleRI.get(0);
				model.addAttribute("mainBean", mountainBean);
			} catch (Exception e) {
				errors.put("msg","發生錯誤 : ".concat(e.getMessage()));
				e.printStackTrace();
			}
		}
	}

}
