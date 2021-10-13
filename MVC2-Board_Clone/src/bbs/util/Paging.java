package bbs.util;

public class Paging {

	int nowPage = 1; // 현재 페이지
	int perPage = 5; // nowPage 당 보여질 게시물 수
	int totalBoard = 0; // 총 게시글을 저장하는 변수
	int perBlock = 5; // {nowPage = 1} 1 2 3 4 5 .. 한 블럭당 보여질 페이지 수
	int totalPage = 0; // 전체 페이지 수
	
	int begin = 0; // 한 페이지에서 보여질 시작 게시물의 행번호
	int end = 0 ;  // 한 페이지에서 보여질 마지막 게시물의 행번호
	
	/*
	 	if : 총 게시글이 10개이고 5개씩 나눴다고 가정할때..
		begin : 1 번째 게시글
		        2
		        3
		        4
	    end	    5 번째 게시글
	*/
	
	int startPage = 0; // 보여질 페이지 블럭에서 시작페이지 값
	int endPage = 0;   // 보여질 페이지 블럭에서 마지막 페이지 값
	
	public Paging() {
		
	}
	
	public Paging(int perPage, int perBlock) {
		this.perPage = perPage;
		this.perBlock = perBlock;
	}
	
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		if(nowPage > totalPage) {
			nowPage = totalPage;
		}
		
		// nowPage 값이 바뀌면 표현할 게시물들을 변경시켜야함.
		// ※ begin | end 값이 변경되도록 바꿔보자.
		
		
		// 예시 : nowPage 가 1일때 begin 1 end 5 를 만들자.
		
		// 현재페이지 - 1 * 보여질 게시글 수 + 1
		begin = (nowPage -1) * perPage + 1; // 1
		end = nowPage * perPage; // 5
		
		// 현재페이지 값에 의해 블럭의 시작페이지 구하기
		/*
		 	nowPage : 2
		 	( 2 - 1 ) / 5 ) * 5 + 1 = 2
		 	    1  / 5 = 0.2
		 	    0.2 * 5 = 1
		 	    1 + 1 = 2
		 	    
		 	nowPage : 3
		 	(3-1) / 5) * 5 + 1 = 3
		 	  2 / 5 = 0.4
		 	  0.4 * 5 = 2
		 	  2 + 1 = 3
		 	 
		 	 nowPage : 4
		 	 
		 	 (4-1) / 5 ) * 5 + 1 
		 	 3 / 5 = 0.6
		 	 0.6 * 5 = 3
		 	 3 + 1 = 4
		 	 
		 	 nowPage : 5
		 	 
		 	 (5-1) / 5 ) * 5 + 1 
		 	 4 / 5 = 0.8
		 	 0.8 * 5 = 4
		 	 4 + 1 = 5
		 	 
		 	 nowPage : 6
		 	 
		 	 (6-1) / 5 ) * 5 + 1 
		 	 5 / 5 = 1
		 	 1 * 5 = 5
		 	 5 + 1 = 6
		 	 
		 	 
		 * */
		startPage = (int) ( (nowPage-1) / perBlock) * perBlock +1; // startPage 1
		
		// 마지막 블럭 값 구하기
		endPage = startPage + perBlock -1; // 5
		
		// 현재 페이지 값이 총 페이지 값을 넘길 경우
		
		// 마지막페이지 값이 총 페이지 값을 넘길 경우
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
	
	public int getPerPage() {
		return perPage;
	}
	
	public void setPerPage(int perPage) {
		this.perPage = perPage;
		
	}
	
	public int getTotalBoard() {
		return totalBoard;
	}
	
	// 총 게시물 저장하기
	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
		
		// 10 / 5 
		totalPage = (int)Math.ceil((double)totalBoard / perPage);
		// toalPage = 5
	}
	
	public int getPerBlock() {
		return perBlock;
	}
	
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getBegin() {
		return begin;
	}
	
	public void setBegin(int begin) {
		this.begin = begin;
	}
	
	public int getEnd() {
		return end;
	}
	
	public void setEnd(int end) {
		this.end = end;
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
	
}
