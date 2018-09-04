package com.controllers;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.data.Archive;
import com.data.ArchiveRepo;
import com.data.DepartmentData;
import com.data.EmailInfo;
import com.data.EmpRepo;
import com.data.EmpRole;
import com.data.Employee;
import com.data.LimitedData;
import com.data.LimitedRepo;
import com.data.Password;
import com.data.Payroll;

@Controller
@RequestMapping("/")
public class Home {
	@Autowired
	EmpRepo empRepo;
	
	@Autowired
	LimitedRepo limitedRepo;
	
	@Autowired
	ArchiveRepo archiveRepo;
	
	@Autowired
    private JavaMailSender mailSender;
	
	
	
	@RequestMapping("/")
	public String goHome() {
		return "home";
	}
	
	@RequestMapping("/staff")
	public String getStaff() {
		return "staff";
	}
	
	@RequestMapping("/employee")
	public String getEmployee(Model model) throws SQLException {
		String payroll = SecurityContextHolder.getContext().getAuthentication().getName();
		Employee employee = empRepo.findByPayrollEquals(payroll);
		if(employee.getImageFile() != null) {
		byte[] bytes = employee.getImageFile().getBytes(1, (int)employee.getImageFile().length());
		String base64image = Base64.getEncoder().encodeToString(bytes);
		employee.setBase64image(base64image);
		}
		model.addAttribute("empDetails",employee);
		return "employee";
	}
	
	@RequestMapping("/department")
	public String getDepartment() {
		return "department";
	}
	@RequestMapping("/admin")
	public String getAdmin() {
		return "admin";
	}
	@RequestMapping(value="/registerEmployee",method=RequestMethod.POST)
	@ResponseBody
	public String registerEmp(@ModelAttribute Employee employee) {
		//System.out.println(employee);
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String encodedPassword = encoder.encodePassword(employee.getPassword(),null);
		employee.setPassword(encodedPassword);
		employee.setRole("ROLE_EMPLOYEE");
		empRepo.save(employee);
		return "Register was successful";
	}
	
	@RequestMapping(value="/limitAccess", method=RequestMethod.POST)
	@ResponseBody
	public String limitAccess(@ModelAttribute DepartmentData data) {
		String department = data.getDepartment();
		System.out.println(department);
		List<String> list = Arrays.asList(data.getAddress(),data.getAge(),data.getEmail(),data.getGender(),data.getMaritalStatus(),
				data.getName(),data.getNumber());
		Loop: for(String item : list) {
			if(item == null) {
				continue Loop;
			}
			LimitedData limited = new LimitedData(department,item);
			limitedRepo.save(limited);
		}
		return "Data for "+department+" has been limited";
		
		
	}
	
	@RequestMapping(value="/archiveSearch", method=RequestMethod.POST)
	@ResponseBody
	public Employee archiveSearch(@ModelAttribute Payroll entered) {
		String enteredPayroll = entered.getPayroll();
		System.out.println(enteredPayroll);
		Employee employee = empRepo.findByPayrollEquals(enteredPayroll);		
		return employee;
	}
	/*@RequestMapping("/archiveEmployee/{payroll}")
	@ResponseBody
	public String archiveEmp(@PathVariable("payroll") String payroll) {
		Employee employee = empRepo.findByPayrollEquals(payroll);
		Archive archive = new Archive();
		BeanUtils.copyProperties(employee,archive);
		archiveRepo.save(archive);
		empRepo.delete(employee);
		return "Archive successful";
	}*/
	@RequestMapping("/archiveEmployee")
	@ResponseBody
	public String archiveEmp(@ModelAttribute Payroll payroll) {
		String myPayroll = payroll.getPayroll();
		Employee employee = empRepo.findByPayrollEquals(myPayroll);
		Archive archive = new Archive();
		BeanUtils.copyProperties(employee,archive);
		archiveRepo.save(archive);
		empRepo.delete(employee);
		return "Archive successful";
	}
	
	@RequestMapping(value="/fillForm",method=RequestMethod.POST)
	@ResponseBody
	public String fillForm(@ModelAttribute Employee employee) {
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		Employee emp = empRepo.findByPayrollEquals(name);
		employee.setId(emp.getId());
		employee.setDepartment(emp.getDepartment());
		employee.setPassword(emp.getPassword());
		employee.setPayroll(emp.getPayroll());
		employee.setRole(emp.getRole());
		empRepo.save(employee);
		return "Registration successful";
	}
	@RequestMapping("/updateForm")
	@ResponseBody
	public String updateForm(@ModelAttribute Employee employee) {
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		Employee emp = empRepo.findByPayrollEquals(name);
        if(employee.getPhoneNumber() != 0) {
        	emp.setPhoneNumber(employee.getPhoneNumber());
        }
        if(employee.getEmail() != "") {
        	emp.setEmail(employee.getEmail());
        }
        if(employee.getAddress() != "") {
        	emp.setAddress(employee.getAddress());
        }
		empRepo.save(emp);
		return "Update successful";
	}

	@RequestMapping("/changeRole")
	@ResponseBody
	public String changeRole(@ModelAttribute  EmpRole role) {
		if(empRepo.findByPayrollEquals(role.getPayroll()) == null) {
			return role.getPayroll()+ " does not exist";
		}else {
		Employee employee = empRepo.findByPayrollEquals(role.getPayroll());
		employee.setRole(role.getRole());
		empRepo.save(employee);
		}
		return "Role changed successfully";
		
	}
	
	

	@RequestMapping(value="/getEmployee", method=RequestMethod.POST)
	@ResponseBody
	public Employee findEmployee(@ModelAttribute Payroll payroll) {
		String thisPayroll = payroll.getPayroll();
		Employee employee = empRepo.findByPayrollEquals(thisPayroll);
		return employee;
	}
/*	@RequestMapping(value="/getLimitedEmployee", method=RequestMethod.POST)
	@ResponseBody
	public Employee findLimitedEmployee(@ModelAttribute Payroll payroll) {
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		Employee employee = empRepo.findByPayrollEquals(name);
		String department = employee.getDepartment();
		List<String> data = limitedRepo.findByDepartmentEquals(department);
       
		String combined = "";
		
		for(int i=0; i<data.size(); i++) {
			combined += data.get(i);
			data.remove(i);
			if(!(data.isEmpty())) {
				combined += ",";
			}
		}
		
		JdbcTemplate jdbc = new JdbcTemplate();
		Employee emp = (Employee)jdbc.query("select "+combined+ "from employee where payroll = "+ payroll.getPayroll(),Employee.class);
		
		
		return emp;
	}
	*/
	
	@RequestMapping("/addImage")
	@ResponseBody
	public String addImage(@RequestParam("image") MultipartFile file) throws IOException, SerialException, SQLException{
		
			byte[] bytes = file.getBytes();
			Blob blob = new SerialBlob(bytes);
			String payroll = SecurityContextHolder.getContext().getAuthentication().getName();
			Employee employee = empRepo.findByPayrollEquals(payroll);
			employee.setImageFile(blob);
			empRepo.save(employee);
			String base64image = Base64.getEncoder().encodeToString(bytes);
		
		return base64image;
	}
	
	@RequestMapping("/changePassword")
	@ResponseBody
	public String changePassword(@ModelAttribute Password password) {
		String name = SecurityContextHolder.getContext().getAuthentication().getName();
		Employee employee = empRepo.findByPayrollEquals(name);
		String existingPassword = employee.getPassword();
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String encodedCurrentPassword = encoder.encodePassword(password.getCurrentPassword(),null);
		if(!(encodedCurrentPassword.equals(existingPassword))) {
			return "You entered a wrong current password";
		}else {
			String newPassword = encoder.encodePassword(password.getNewPassword(), null);
			employee.setPassword(newPassword);
			empRepo.save(employee);
		}
		
		
		return "Password changed successfully";
	}
	@RequestMapping("/sendEmail")
	@ResponseBody
	public String sendEmail(@ModelAttribute EmailInfo emailInfo) {
		String subject = emailInfo.getSubject();
		String message = emailInfo.getMessage();
		
		SimpleMailMessage email = new SimpleMailMessage();
		List<Employee> employees = empRepo.findAll();
		for(Employee employee : employees) {
			String address = employee.getEmail();
			email.setTo(address);
			email.setSubject(subject);
			email.setText(message);
		}
		
		mailSender.send(email);
		
		return "All emails have been sent";
	}
	
	@RequestMapping("/sendComment")
	@ResponseBody
	public String sendComment(@ModelAttribute EmailInfo emailInfo) {
		String subject = emailInfo.getSubject();
		String message = emailInfo.getMessage();
		
		SimpleMailMessage email = new SimpleMailMessage();
		
			String address = "shaddygimmz@gmail.com";
			email.setTo(address);
			email.setSubject(subject);
			email.setText(message);
		
		mailSender.send(email);
		
		return "Your comment has been sent";
	}
	
}
