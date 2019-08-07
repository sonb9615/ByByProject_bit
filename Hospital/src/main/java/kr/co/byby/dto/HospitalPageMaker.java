package kr.co.byby.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class HospitalPageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	
	private HospitalCriteria cri;

	
	public HospitalPageMaker() {
		super();
		
	}

	public HospitalPageMaker(int totalCount, int startPage, int endPage, boolean prev, boolean next, int displayPageNum,
			HospitalCriteria cri) {
		super();
		this.totalCount = totalCount;
		this.startPage = startPage;
		this.endPage = endPage;
		this.prev = prev;
		this.next = next;
		this.displayPageNum = displayPageNum;
		this.cri = cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public HospitalCriteria getCri() {
		return cri;
	}

	public void setCri(HospitalCriteria cri) {
		this.cri = cri;
	}

	
	private void calcData() {
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum)*displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int temp = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if(endPage > temp) {
			endPage = temp;
		}
		prev = startPage == 1 ? false:true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false: true;
	
	}
	
	public String makeQuery(int page) {
		
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		return uriComponents.toUriString();
	}
	
	@Override
	public String toString() {
		return "HospitalPageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	
	
	
}
