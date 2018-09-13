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

import com.model.Car;
import com.model.Goods;
import com.model.Jingjia;
import com.model.Jubao;
import com.model.Member;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import com.util.Retainone;
import org.springframework.beans.factory.annotation.Autowired;

public class JubaoAction extends ActionSupport {
	private int id;
	private String memberid;
	private String content;
	private String xiangpian;
	private String goodsid;
	private String hfmember;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getXiangpian() {
		return xiangpian;
	}

	public void setXiangpian(String xiangpian) {
		this.xiangpian = xiangpian;
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
	

	public String getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(String goodsid) {
		this.goodsid = goodsid;
	}
	
	

	public String getHfmember() {
		return hfmember;
	}

	public void setHfmember(String hfmember) {
		this.hfmember = hfmember;
	}

	// 举报
	public String jubaoAdd() {
		Jubao j = new Jubao();
		Goods g = (Goods)commonDAO.findById(goodsid, "Goods");
		j.setFilename(xiangpian);
		j.setContent(content);
		j.setMemberid(memberid);
		j.setGoodsid(goodsid);
		j.setSaleid(g.getMemberid());
		j.setHfmember("");
		j.setHfsale("");
		j.setHfmsavetime("");
		j.setHfssavetime("");
		j.setUrl("http://localhost:8080/productauctionssh/e/salegoodsx.jsp?goodsid="+goodsid);
		commonDAO.save(j);
		suc = "操作成功";
		return "success";
	}
	
	public String jubaoDel() {
		commonDAO.delete(id,"Jubao");
		suc = "撤销成功";
		return "success";
	}
	
	//回复
	public String jubaoHf() {
		Jubao j = (Jubao)commonDAO.findById(id, "Jubao");
		j.setHfmember(hfmember);
		commonDAO.update(j);
		suc = "回复成功";
		return "success";
	}
	
	


}
