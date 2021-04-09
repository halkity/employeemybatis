package jp.co.employeemybatis.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jp.co.employeemybatis.dao.EmployeeMapper;
import jp.co.employeemybatis.entity.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeMapper mapper;

	@RequestMapping("/")
	public ModelAndView index(){
		ModelAndView mav = new  ModelAndView("serchEmployeesList");
		mav.addObject("employee", new Employee());
		return mav;
	}
	
	@RequestMapping("/formEmployee")
	public ModelAndView formEmployee(){
		ModelAndView mav = new ModelAndView("addEmployee");
		mav.addObject("employee", new Employee());
		return mav;
	}
	
	@RequestMapping("/seachEmployee")
	public ModelAndView serchEmployee(@ModelAttribute("employee") Employee employee){
		ModelAndView mav = new ModelAndView("serchEmployeesList");
		
		Integer count = 0;
		
		String name = employee.getName();
		if (!(name.equals(""))) {
			count += 1;
		}
		
		String email = employee.getEmail();
		if (!(email.equals(""))) {
			count += 1;
		}
		
		String gender = employee.getGender();
		if (!(gender.equals(""))) {
			count += 1;
		}
		
		if (count == 0) {
			mav.addObject("listemployee", mapper.getAllEmployees());
		} else {
			mav.addObject("listemployee", mapper.findEmployeeLike(employee));
		}
		
		return mav;
	}
	
	@RequestMapping("/saveProcess")
	public String saveEmployee(@Validated @ModelAttribute("employee") Employee employee, BindingResult result){
		if (result.hasErrors()) {
			return "addEmployee";
		} else {
			if (employee.getId() == null) {
				mapper.saveEmployee(employee);
			} else {
				mapper.updateEmployee(employee);
			}
			return "redirect:/";
		}
	}
	
	@RequestMapping("/editEmployee")
	public ModelAndView editEmployee(@RequestParam("employeeId") int employeeId){
		ModelAndView mav = new ModelAndView("addEmployee");
		Employee employee = mapper.findById(employeeId);
		mav.addObject("employee", employee);
		return mav;
	}
	
	@RequestMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("employeeId") int employeeId){
		mapper.deleteEmployee(employeeId);
		return "redirect:/";
	}
}