package com.uml.book.entity;

/**
 * 分页辅助类
 * @author 寻花问柳
 *
 */
public class Page {
	    //当前页面
		private int currentPage = 1;
		
		//每页的记录数
		private int pageSize = 10;
		
		//总的记录数
		private long totalCount;
		
		//总的页面数
		@SuppressWarnings("unused")
		private int totalPageCount;
		
		//是否有首页
		@SuppressWarnings("unused")
		private boolean isHasFirstPage;
		
		//是否有上一页
		@SuppressWarnings("unused")
		private boolean isHasPrevPage;
		
		//是否有尾页
		@SuppressWarnings("unused")
		private boolean isHasLastPage;
		
		//是否有下一页
		@SuppressWarnings("unused")
		private boolean isHasNextPage;

		/**
		 * 通过构造函数传入总的记录数和当前页
		 * @param currentPage
		 * @param totalCount
		 */
		public Page(int currentPage,long totalCount) {
			this.currentPage = currentPage;
			this.totalCount = totalCount;
		}

		
		public int getCurrentPage() {
			return currentPage;
		}
		
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public long getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(long totalCount) {
			this.totalCount = totalCount;
		}
			
		/**
		 * 获取总的页数
		 * @return
		 */
		public long getTotalPageCount() {
			long totalPageCount = getTotalCount() / getPageSize(); 
			return (totalCount % pageSize == 0 ? totalPageCount : totalPageCount + 1);
		}
		public void setTotalPageCount(int totalPageCount) {
			this.totalPageCount = totalPageCount;
		}


		/**
		 * 是否是第一页
		 * @return
		 */
		public boolean isHasFirstPage(){
			//当前页是第一页就没有首页
			return (currentPage == 1) ? false : true;
		}
		public void setHasFirstPage(boolean isHasFirstPage) {
			this.isHasFirstPage = isHasFirstPage;
		}

		/**
		 * 是否有首页
		 * @return
		 */
		public boolean isHasPrevPage() {
			//有首页就有前一页
			return isHasFirstPage() ? true : false;
		}
		public void setHasPrevPage(boolean isHasPrevPage) {
			this.isHasPrevPage = isHasPrevPage;
		}

		/**
		 * 是否有尾页
		 * @return
		 */
		public boolean isHasLastPage() {
			//如果不是最后一页就有尾页
			return (currentPage == getTotalCount()) ? false : true;
		}
		public void setHasLastPage(boolean isHasLastPage) {
			this.isHasLastPage = isHasLastPage;
		}

		/**
		 * 是否有下一页
		 * @return
		 */
		public boolean isHasNextPage() {
			//如果有尾页就有下一页
			return isHasLastPage() ? true : false;
		}
		public void setHasNextPage(boolean isHasNextPage) {
			this.isHasNextPage = isHasNextPage;
		}
}
