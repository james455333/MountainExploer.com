<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台資料維護系統/山岳資料</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href='<c:url value="/backstage/css/backStage.css"/>'> 
<link rel="stylesheet" href='<c:url value="/mountain/back/act/actIndex.css"/>' >
<link rel="shortcut icon" type="image/png" href="<c:url value="/favicon.ico"/>"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/act/actIndex.js"/>'></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/act/postFunction.js"/>'></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/act/registryFunction.js"/>'></script>
<script type="text/javascript" charset="UTF-8" src='<c:url value="/mountain/back/act/checkFunction.js"/>'></script>
</head>
<body>
	
	
	
	<div id="container1">
		<!-- 引入共同頁首 -->
		<jsp:include page="../../../fragment/backTopNav.jsp"></jsp:include>
		
		<%-- <c:forEach var="peakName" items="${mountainBean}" varStatus="vs">
		</c:forEach> --%>
		<!-- 查詢列 -->
		<div id="searchBar">
			<div class="sideNav">
	            	<div class='m-si-op'><button id="btn-post" class="btn btn-rounded btn-info btn-lg">舉辦活動管理</button></div>
	            	<div class='m-si-op'><button id="btn-reg" class="btn btn-rounded btn-info btn-lg">報名活動管理</button></div>
<!-- 	            	<div class='m-si-op'><div>活動紀錄</div></div> -->
	            	<div class='m-si-op'><button id="btn-repo" class="btn btn-rounded btn-info btn-lg">求助及問題回報</button></div>
	        </div>
		</div>
		
		<!-- 控制列 -->
		<div id="controller">
		
		</div>
		<!-- 呈現畫面 -->
		<div id="mainContainer" class="m-ma-container">
			<!-- 顯示頁面 -->
			
			<!-- 顯示資料 -->
			
			
		</div>
		
	</div>
	<div class="m-hide">
   		<table class="order-table m-ma-ta">
        	<thead class="order-table-th"><tr>
				<th scope="col" style="width:75px">活動編號</th>
				<th scope="col" class="d-li-na">活動名稱</th>
				<th scope="col" class="m-tb-date">開始時間</th>
				<th scope="col" class="m-tb-date">結束時間</th>
				<th scope="col" style="width:75px">活動價格</th>
				<th scope="col" style="width:75px">路線名稱</th>
				<th scope="col" class="m-tb-date">發布時間</th>
				<th scope="col" style="width:75px">報名人數 / 人數上限</th>
				<th scope="col" class="m-tb-date">報名截止日</th>
				<th scope="col" style="width:50px">備註</th>
				<th scope="col" style="width:50px">回覆</th>
				<th scope="col">控制選項</th>
			</tr></thead>
			<tbody  class='order-table-tb hideTbody'>
				<tr class="tr-main-post">
					<td></td>
					<td><a class="m-tb-ti" href=""></a></td>
					<td></td>
					<td></td>
					<td></td>
					<td class="m-tb-rt"></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button>備註顯示</button></td>
					<td><button>CM</button></td>
					<td>
						<div class="flex-box">
							<button class="bt-reg-show">報名選單</button>
							<button class="bt-update-show">修改內容</button>
						</div>
						<div class="flex-box">
							<button class="bt-act-hide"></button>
							<button class="bt-act-delete">取消活動</button>
						</div>
					</td>
				</tr>
				<tr class="m-note hideTr">
					<td colspan="12"> 
					</td>
				</tr>
				<tr class="tr-up hideTr">
					<td colspan="12">
						<div>
							<form class="tr-form" enctype="multipart/form-data">
								<div class="tr-up-form">
									<input type="hidden" name="id">
									<div class="tr-up-fld">
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動標題</label>
											</div>
											<div>
												<input type="text"  name="title" maxlength="15"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動開始時間</label>
											</div>
											<div>
												<input name="startDate" readonly="readonly"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動結束時間</label>
											</div>
											<div>
												<input name="endDate" readonly="readonly"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>總天數</label>
											</div>
											<div>
												<input name="totalDay" readonly="readonly">
												<div></div>
											</div>
										</div>
									</div>
									<div class="tr-up-fld">
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>活動價格</label>
											</div>
											<div>
												<input type="text" name="price" maxlength="9"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>報名人數上限</label>
											</div>
											<div>
												<input type="text" name="regTop" maxlength="9"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
										<div class="tr-up-fld-div">
											<div class="tr-up-label">
												<label>報名截止日期</label>
											</div>
											<div>
												<input name="regEndDate" readonly="readonly"><span></span>
												<div class="tr-up-error"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="tr-up-form">
									<label>備註 : 
										<textarea rows="5" cols="100" name="note" class="m-note-form"></textarea>
									</label>
								</div>
								<div class="tr-up-form">
									<input type="submit" value="確認修改">
									<input type="reset" class="cancel-up" value="取消修改">
								</div>
							</form>
						</div>
					</td>
				</tr>
				<tr class="tr-reg hideTr">
					<td colspan="12">
						<div class="tr-reg-con">
							<div class="tr-reg-head">
								<div class="tr-reg-seqno">報名編號</div>
								<div class="tr-reg-mbName">報名會員名稱</div>
								<div class="tr-reg-regNum">報名人數</div>
								<div class="tr-reg-regDate">報名日期</div>
								<div class="tr-reg-attr">狀態列</div>
								<div class="tr-reg-control">控制列</div>
							</div>
							<div class="tr-reg-body">
								<div class="tr-reg-order">
									<div class="tr-reg-seqno"><a></a></div>
									<div class="tr-reg-mbName"></div>
									<div class="tr-reg-regNum"></div>
									<div class="tr-reg-regDate"></div>
									<div class="tr-reg-attr"></div>
									<div class="tr-reg-control"></div>
								</div>
								<div class="tr-reg-bar">
									<div><img src="/MountainExploer.com/mountain/images/down.png"></div>
								</div>
								<div class="tr-reg-info hideTr">
									<div class="tr-reg-info-head">
										<div class="tr-reg-info-name">姓名</div>
										<div class="tr-reg-info-bDay">出生年月日</div>
										<div class="tr-reg-info-pID">身分證字號</div>
										<div class="tr-reg-info-phone">電話</div>
										<div class="tr-reg-info-cellphone">手機</div>
										<div class="tr-reg-info-email">電子信箱</div>
									</div>
									<div class="tr-reg-info-body">
										<div class="tr-reg-info-name"></div>
										<div class="tr-reg-info-bDay"></div>
										<div class="tr-reg-info-pID"></div>
										<div class="tr-reg-info-phone"></div>
										<div class="tr-reg-info-cellphone"></div>
										<div class="tr-reg-info-email"></div>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
        <table class="order-table m-ma-reg-ta">
        	<thead class="order-table-th m-ma-reg-ta-th"><tr>
					<th scope="col" style="width:100px">報名編號</th>
					<th scope="col" style="width:250px">報名狀態列</th>
	        		<th scope="col" style="width:250px; font-size : 20px;">活動名稱</th>
					<th scope="col" style="width:100px">報名人數</th>
					<th scope="col" style="width:100px">報名詳情</th>
					<th scope="col" style="width:200px">報名日期</th>
					<th scope="col" >控制列</th>
        	</tr></thead>
        	<tbody class="order-table-tb">
        		<tr class="rg-main">
        			<td></td>
        			<td></td>
        			<td><a></a></td>
        			<td></td>
        			<td><button class="bt-reg-info">詳情</button></td>
        			<td></td>
        			<td><button class="bt-reg-cancel">取消報名</button></td>
        		</tr>
        		<tr class="rg-info hideTr">
        			<td colspan="7">
        				<div class="rg-info-con">
	        				<div class="rg-info-head">
	        					<div class="rg-info-seqno">報名詳情編號</div>
	        					<div class="rg-info-name">姓名</div>
								<div class="rg-info-bDay">出生年月日</div>
								<div class="rg-info-pID">身分證字號</div>
								<div class="rg-info-phone">電話</div>
								<div class="rg-info-cellphone">手機</div>
								<div class="rg-info-email">電子信箱</div>
								<div class="rg-info-controll">控制項</div>
	        				</div>
	        				<div class="rg-info-body">
	        					<div class="rg-info-body-info">
	        						<div class="rg-info-seqno"></div>
		        					<div class="rg-info-name"></div>
									<div class="rg-info-bDay"></div>
									<div class="rg-info-pID"></div>
									<div class="rg-info-phone"></div>
									<div class="rg-info-cellphone"></div>
									<div class="rg-info-email"></div>
									<div class="rg-info-controll"></div>
	        					</div>
	        					<div class="rg-info-body-info2 hideTr">
	        						<form action="#" class="rg-info-body-update">
		        						<div class="rg-info-seqno">
		        							<input type="hidden" name="seqno" readonly>
		        						</div>
			        					<div class="rg-info-name">
		        							<input type="text" name="name" maxlength="10" required>
			        					</div>
										<div class="rg-info-bDay">
											<input type="text" name="birthDay" required>
										</div>
										<div class="rg-info-pID">
											<input type="text" name="personID" required>
										</div>
										<div class="rg-info-phone">
											<input type="text" name="contactPhone" required>
										</div>
										<div class="rg-info-cellphone">
											<input type="text" name="contactCellphone" required>
										</div>
										<div class="rg-info-email">
											<input type="text" name="contactEmail" required>
										</div>
										<div class="rg-info-updateCtrl" >
											<div>
												<button class="bt-reg-info-update-confirm">確定</button>
											</div>
											<div>
												<button class="bt-reg-info-update-cancel">取消</button>
											</div>
										</div>
	        						</form>
	        					</div>
	        				</div>
        				</div>
        			</td>
        		</tr>
        	</tbody>
        </table>
		<table class="order-table m-ma-repo-ta">
			<thead class="order-table-th"><tr>
				<th scope="col">回報編號</th>
				<th scope="col">回報時間</th>
				<th scope="col">回覆狀態</th>
				<th scope="col">回報主題</th>
				<th scope="col">回報主旨</th>
				<th scope="col">回報內容</th>
				<th scope="col">回報選項</th>
			</tr></thead>
			<tbody class="order-table-tb">
				<tr class="main-repo-tr">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
        <nav class="pageControl ver-mid">
        	<ul>
            	<li class="li1">
            		<div class="m-page">
	            		«第一頁
            		</div>
				</li>
                <li class="li1">
                	<div class="m-page">
	                	‹上一頁
                	</div>
                </li>
                <li class="li1">
                	<div  class="m-page">
                	</div>
				</li>
                <li class="li1">
                	<div class="m-page">
                		下一頁›
                	</div>
                </li>
                <li class="li1">
                	<div  class="m-page">
                		最末頁»
                	</div>
				</li>
			</ul>
		</nav>
    </div>	

</body>

	
</html>