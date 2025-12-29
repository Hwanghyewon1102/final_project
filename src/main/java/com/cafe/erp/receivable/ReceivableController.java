package com.cafe.erp.receivable;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/receivable/*")
public class ReceivableController {
	
	@Autowired
	private ReceivableService service;
	
	
	@GetMapping("receivable")
	public void receivableList(Model model) throws Exception {
		
		List<ReceivableDTO> list = service.receivableList();
		model.addAttribute("receivables", list);
		
	}
	
	
	
	
	
	
	
}
