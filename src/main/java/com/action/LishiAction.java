package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;

import com.model.Goods;
import com.model.Jingjia;
import com.model.Lishi;
import com.model.Liuyan;
import com.model.Member;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;

public class LishiAction extends ActionSupport {
	private int id;
	private String memberid;
	private String gid;
	private int chuprice;
	private String idlist;

	@Autowired
	private CommonDAO commonDAO;
	String suc;
	String no;
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public int getChuprice() {
		return chuprice;
	}

	public void setChuprice(int chuprice) {
		this.chuprice = chuprice;
	}

	public CommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	public String getSuc() {
		return suc;
	}

	public void setSuc(String suc) {
		this.suc = suc;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	
	

	public String getIdlist() {
		return idlist;
	}

	public void setIdlist(String idlist) {
		this.idlist = idlist;
	}

	
	//删除足迹
	public String favDel() {
		Map session = ActionContext.getContext().getSession();
		Member m = (Member)session.get("member");
		System.out.println(idlist);
		String[] a = idlist.split(",");
		for(int i=0;i<a.length;i++){
			ArrayList<Lishi> list = (ArrayList<Lishi>)commonDAO.findByHql("from Lishi where  memberid='"+m.getId()+"' and gid='"+a[i]+"'");

			for(Lishi j:list){

				commonDAO.delete(j);
			}
		}
		suc="";
		return "success";
	}
	

}
