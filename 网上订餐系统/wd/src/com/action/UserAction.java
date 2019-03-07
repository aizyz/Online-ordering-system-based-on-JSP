package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Cart;

public class UserAction extends ActionSupport
{
	private Integer userId;
	private String userName;
	private String userPw;
	private int userType;

	private String userRealname;
	private String userSex;
	private String userAge;
	private String userAddress;
	
	private String userTel;
	private String userEmail;
	private String userDel;
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	
	
	
	public String userReg()
	{
		TUser user=new TUser();
		
		//user.setUserId(0);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserType(0);
		
		
		user.setUserRealname(userRealname);
		user.setUserSex(userSex);
		user.setUserAge(userAge);
		user.setUserAddress(userAddress);
		
		
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		user.setUserDel("no");
		
		
		userDAO.save(user);
		Map session= ServletActionContext.getContext().getSession();
		session.put("user", user);
		return "successAdd";
	}
	
	
	public String userEdit()
	{
		TUser user=userDAO.findById(userId);
		
		//user.setUserId(0);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserType(0);
		
		
		user.setUserRealname(userRealname);
		user.setUserSex(userSex);
		user.setUserAge(userAge);
		user.setUserAddress(userAddress);
		
		
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		user.setUserDel("no");
		
		userDAO.attachDirty(user);
		Map session= ServletActionContext.getContext().getSession();
		session.put("user", user);
		return "successAdd";
	}
	
	
	public String userLogin()
	{
		String sql="from TUser where userName=? and userPw=?";
		Object[] con={userName,userPw};
		List userList=userDAO.getHibernateTemplate().find(sql,con);
		if(userList.size()==0)
		{
			this.setMessage("用户名或密码错误");
			this.setPath("qiantai/default.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 TUser user=(TUser)userList.get(0);
			 session.put("user", user);
			 
			 Cart cart=new Cart();
			 session.put("cart", cart);
			 
			 this.setMessage("成功登录");
			 this.setPath("qiantai/default.jsp");
		}
		return "succeed";
	}
	
	
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(userId);
		user.setUserDel("yes");
		userDAO.attachDirty(user);
		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	public String userXinxi()
	{
		TUser user=userDAO.findById(userId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return ActionSupport.SUCCESS;
	}
	
	
	public String userMana()
	{
		String sql="from TUser where userDel='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	public Integer getUserId()
	{
		return userId;
	}
	public void setUserId(Integer userId)
	{
		this.userId = userId;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserPw()
	{
		return userPw;
	}
	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}
	public int getUserType()
	{
		return userType;
	}
	public void setUserType(int userType)
	{
		this.userType = userType;
	}
	public String getUserRealname()
	{
		return userRealname;
	}
	public void setUserRealname(String userRealname)
	{
		this.userRealname = userRealname;
	}
	public String getUserSex()
	{
		return userSex;
	}
	public void setUserSex(String userSex)
	{
		this.userSex = userSex;
	}
	public String getUserAge()
	{
		return userAge;
	}
	public void setUserAge(String userAge)
	{
		this.userAge = userAge;
	}
	public String getUserAddress()
	{
		return userAddress;
	}
	public void setUserAddress(String userAddress)
	{
		this.userAddress = userAddress;
	}
	public String getUserTel()
	{
		return userTel;
	}
	public void setUserTel(String userTel)
	{
		this.userTel = userTel;
	}
	public String getUserEmail()
	{
		return userEmail;
	}
	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}
	public String getUserDel()
	{
		return userDel;
	}
	public void setUserDel(String userDel)
	{
		this.userDel = userDel;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public TUserDAO getUserDAO()
	{
		return userDAO;
	}
	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}
	
}
