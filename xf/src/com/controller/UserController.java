package com.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.User;
import com.google.gson.Gson;
import com.service.UserService;
import com.util.Md5;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(Model model,HttpServletRequest request)
	{
		return "login";
	}
	/**
	 * 用户登录
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/dologinUser")
	public  String dologinUser(User user,String other,Model model,HttpServletRequest request){
		Md5 md5=new Md5();
		User resultUser=new User();
		try {
			System.out.println(other);
			resultUser = userService.checkLogin(user.getUserName(),md5.checkpassword(user.getPassWord()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(resultUser==null){
			request.setAttribute("user", user);
			request.setAttribute("error", "用户名或密码错误！");
			return "login";
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", resultUser);
			List<User>userlist=new ArrayList<User>();
			userlist=userService.queryAll();
			for(User user1:userlist)
			{
				System.out.println(user1.intId);
			}
			model.addAttribute("userlist",userlist);
			return "users";
		}
	}
	
	@RequestMapping("/queryall")
	public String queryall(Model model,HttpServletRequest request){
		List<User>userlist=new ArrayList<User>();
		userlist=userService.queryAll();
		model.addAttribute("userlist",userlist);
		if(request.getSession().getAttribute("currentUser")!=null)
		{
			System.out.println(((User)request.getSession().getAttribute("currentUser")).userName);
		}
		//request.setAttribute("userlist",userlist);
		return "users";	
	}
	
	@RequestMapping("/toAdd")
	public String toAdd(User user,Model model,HttpServletRequest request)
	{
		return "toAddUser";
	}
	
	@RequestMapping("Add")
	public String Add(User user,Model model,HttpServletRequest request)
	{
		System.out.println(user.getUserName());
		Md5 md5=new Md5();
		try {
			user.passWord=md5.EncoderByMd5(user.getPassWord());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userService.insertUser(user);
		return "redirect:/user/queryall";
		
	}
	
	@RequestMapping("/toUpdate/{id}")
	public String toUpdate(@PathVariable("id") int id,Model model,HttpServletRequest request)
	{
		model.addAttribute("user", userService.queryOne(id));
		return "toUpdatUser";
	}
	
	@RequestMapping("/update")
	public String update(User user,Model model,HttpServletRequest request)
	{
		userService.update(user);
		return "redirect:/user/queryall";
	}
	
	@RequestMapping("/delete")
	public @ResponseBody String delete(Integer id,HttpServletRequest request)
	{
		int result =userService.delete(id);
		if(result>0)
			return "1";
		else
			return "2";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request)
	{
		request.getSession().removeAttribute("currentUser");
		return "login";
	}
	
	@RequestMapping("/echarts")
	public String echarts(Model model,HttpServletRequest request)
	{
		//userService.update(user);
		return "echarts";
	}
	
	@RequestMapping("/echarts2")
	public String echarts2(Model model,HttpServletRequest request)
	{
		//userService.update(user);
		return "echarts2";
	}
	
	@RequestMapping("/getData")
	public @ResponseBody String getData(Model model,HttpServletRequest request)
	{
		List<User> list = new ArrayList<User>();
        Gson gson=new Gson();
        //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合
        list.add(new User("衬衣", "10"));
        list.add(new User("短袖", "20"));
        list.add(new User("大衣", "30"));
        System.out.println(gson.toJson(list));
		return gson.toJson(list);
	}
	
	@RequestMapping("/checkExist")
	public @ResponseBody int checkExist(String username, Model model,HttpServletRequest request)
	{
		return userService.checkExist(username);
	}

	
}
