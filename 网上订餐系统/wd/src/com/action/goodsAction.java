package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.dao.TGoodsDAO;
import com.model.TGoods;
import com.opensymphony.xwork2.ActionSupport;

public class goodsAction extends ActionSupport
{
	private Integer goodsId;
	private String goodsName;
	private String goodsMiaoshu;
	private String fujian;

	private Integer goodsShichangjia;
	private Integer goodsTejia;
	private String goodsIsnottejia;
	private String goodsIsnottuijian;

	private Integer goodsCatelogId;
	private String goodsDel;
	
	
	private String message;
	private String path;
	
	private TGoodsDAO goodsDAO;
	private TCatelogDAO catelogDAO;
	
	public String goodsAdd()
	{
		TGoods goods=new TGoods();
		
		goods.setGoodsCatelogId(goodsCatelogId);
		goods.setGoodsName(goodsName);
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic(fujian);
		goods.setGoodsShichangjia(goodsShichangjia);
		if(goodsTejia==0)//特格为0表示没有特价
		{
			goods.setGoodsTejia(goodsShichangjia);
			goods.setGoodsIsnottejia("no");
		}
		else
		{
			goods.setGoodsTejia(goodsTejia);
			goods.setGoodsIsnottejia("yes");
		}
		
		goods.setGoodsDel("no");
		
		goodsDAO.save(goods);
		this.setMessage("操作成功");
		this.setPath("goodsMana.action");
		return "succeed";
		
	}
	
	public String goodsDel()
	{
		TGoods goods=goodsDAO.findById(goodsId);
		goods.setGoodsDel("yes");
		goodsDAO.attachDirty(goods);
		this.setMessage("操作成功");
		this.setPath("goodsMana.action");
		return "succeed";
	}
	
	public String goodsMana()
	{
		String sql="from TGoods where goodsDel='no' order by goodsIsnottejia";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<goodsList.size();i++)
		{
			TGoods goods=(TGoods)goodsList.get(i);
			System.out.println(goods.getGoodsCatelogId());
			goods.setCatelog(catelogDAO.findById(goods.getGoodsCatelogId()));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String goodsDetailHou()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	
	
	
	
	
	
	public String goodsAll()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		
		String sql="from TGoods where goodsDel='no' and goodsIsnottejia='no' order by goodsCatelogId";
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		request.put("goodsList", goodsList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String goodsDetailQian()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		
		TGoods goods=goodsDAO.findById(goodsId);
		request.put("goods", goods);
		return ActionSupport.SUCCESS;
	}
	
	public String goodsByCatelog()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and goodsCatelogId=? order by goodsCatelogId";
		Object[] con={goodsCatelogId};
		List goodsList=goodsDAO.getHibernateTemplate().find(sql,con);
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String goodsSearch()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		
		String sql="from TGoods where goodsDel='no' and goodsName like '%"+goodsName.trim()+"%'";
		
		List goodsList=goodsDAO.getHibernateTemplate().find(sql);
		request.put("goodsList", goodsList);
		
		return ActionSupport.SUCCESS;
	}

	public Integer getGoodsId()
	{
		return goodsId;
	}

	public void setGoodsId(Integer goodsId)
	{
		this.goodsId = goodsId;
	}

	public String getGoodsName()
	{
		return goodsName;
	}

	public void setGoodsName(String goodsName)
	{
		this.goodsName = goodsName;
	}

	public String getGoodsMiaoshu()
	{
		return goodsMiaoshu;
	}

	public void setGoodsMiaoshu(String goodsMiaoshu)
	{
		this.goodsMiaoshu = goodsMiaoshu;
	}

	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public Integer getGoodsShichangjia()
	{
		return goodsShichangjia;
	}

	public void setGoodsShichangjia(Integer goodsShichangjia)
	{
		this.goodsShichangjia = goodsShichangjia;
	}

	public Integer getGoodsTejia()
	{
		return goodsTejia;
	}

	public void setGoodsTejia(Integer goodsTejia)
	{
		this.goodsTejia = goodsTejia;
	}

	public String getGoodsIsnottejia()
	{
		return goodsIsnottejia;
	}

	public void setGoodsIsnottejia(String goodsIsnottejia)
	{
		this.goodsIsnottejia = goodsIsnottejia;
	}

	public String getGoodsIsnottuijian()
	{
		return goodsIsnottuijian;
	}

	public void setGoodsIsnottuijian(String goodsIsnottuijian)
	{
		this.goodsIsnottuijian = goodsIsnottuijian;
	}

	public Integer getGoodsCatelogId()
	{
		return goodsCatelogId;
	}

	public void setGoodsCatelogId(Integer goodsCatelogId)
	{
		this.goodsCatelogId = goodsCatelogId;
	}

	public String getGoodsDel()
	{
		return goodsDel;
	}

	public void setGoodsDel(String goodsDel)
	{
		this.goodsDel = goodsDel;
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

	public TGoodsDAO getGoodsDAO()
	{
		return goodsDAO;
	}

	public void setGoodsDAO(TGoodsDAO goodsDAO)
	{
		this.goodsDAO = goodsDAO;
	}

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}
	
}
