package vo;

import java.util.List;

public class Page<T> {
	
	private List<T> datas;
	/**
	 * 每页条数
	 */
	private Integer pagesize;
	/**
	 * 当前页数
	 */
	private Integer pageno;
	/**
	 * 总记录条数
	 */
	private Integer totalno;
	
	
	public Page(Integer pagesize, Integer pageno) {
		this.pagesize = pagesize<=0?5:pagesize;
		this.pageno = pageno<=0?1:pageno;
	}
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	public Integer getPagesize() {
		return pagesize;
	}
	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}
	public Integer getPageno() {
		return pageno;
	}
	public void setPageno(Integer pageno) {
		this.pageno = pageno;
	}
	public Integer getTotalno() {
		return totalno;
	}
	public void setTotalno(Integer totalno) {
		this.totalno = totalno;
	}
	public Integer getStartIndex() {
		return (pageno-1)*pagesize;
	}
	@Override
	public String toString() {
		return "Page [datas=" + datas + ", pagesize=" + pagesize + ", pageno=" + pageno + ", totalno=" + totalno + "]";
	}
	
}
