package org.sos.vo;

public class PagingVO {
	private int totalPage;
	private int cntPerPage = 5; // 한 페이지당 게시물 개수
	private int cntPerPagination = 5; // 한 페이지 목록 당 개수
	private int pageCnt;
	private int pageNo;
	private int minPage;
	private int maxPage;

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		pageCnt = (int) Math.ceil((double) totalPage / (double) cntPerPage);
		minPage = (int) (Math.floor((double) (pageNo - 1)
				/ (double) cntPerPagination) * cntPerPagination);
		maxPage = ((minPage + cntPerPagination) > pageCnt) ? pageCnt
				: (minPage + cntPerPagination);
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getMinPage() {
		return minPage;
	}

	public int getMaxPage() {
		return maxPage;
	}
	
	public int getCntPerPage() {
		return cntPerPage;
	}
	
	public int getCntPerPagination() {
		return cntPerPagination;
	}
	
	@Override
	public String toString() {
		return "BbsPagingVO [totalPage=" + totalPage + ", cntPerPage="
				+ cntPerPage + ", cntPerPagination=" + cntPerPagination
				+ ", pageCnt=" + pageCnt + ", pageNo=" + pageNo
				+ ", minPage=" + minPage + ", maxPage=" + maxPage + "]";
	}

}
