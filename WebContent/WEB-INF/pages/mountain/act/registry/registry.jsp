<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>岳進者 - 報名頁面</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <link rel="stylesheet" href="/MountainExploer.com/css/font.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="registry/registry.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/MountainExploer.com/mountain/js/mountain.js"></script>
    <script src="registry/registry.js"></script>
    <script src="registry/registryFunction.js"></script>
</head>
<body>
	<div class="count1">
        <div class="count1_img">
            <img src="/MountainExploer.com/images/logo1.png">
            <hr>
            <h1 class="font">可能改成輪播</h1>
            <!-- <a class="font">岳進者</a> -->
        </div>
    </div>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light zline">
            <a class="navbar-brand" href="#"><img src="/MountainExploer.com/images/logo1.png" height="30%" width="30%"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent" include-html="/MountainExploer.com/forinclude/includeForIndex.html"></div>
        </nav>
    </header>
    <div class="div_ul">
        
        <div class="div_li1 dl1_adj">
        </div>
        <div class="div_li3 dl3_adj">
        </div>
        <div class="div_li2 dl2_adj">
            <!-- 每頁不同的內容從這裡開始 -->
            <div class="secDivContent">
            	<div class="mainContainer">
            		<table class="reg-ta">
            			<thead>
            				<tr>
            					<th colspan="7" id="title">
            						
            					</th>
            				</tr>
            				<tr>
            					<th colspan="3" style="font-size:25px;">
            						簡易活動資訊
            					</th>
            					<th colspan="4" style="font-size:25px;">
            						備註
            					</th>
            				</tr>
            				<tr>
            					<th colspan="3" style="font-size:12.5px;">
            						<div class="reg-ta-th-quick">
	            						<div>目前報名人數 : </div>
	            						<div>報名人數上限 : </div>
	            						<div>報名截止日期 : </div>
            						</div>
            					</th>
            					<th colspan="4" style="font-size:12.5px;">
            						<div class="reg-ta-th-note"></div>
            					</th>
            				</tr>
            				<tr>
            					<th style="width: 12.5%;">姓名</th>
            					<th style="width: 12.5%;">出生年月日</th>
            					<th style="width: 15%;">身分證字號</th>
            					<th style="width: 15%;">電話號碼(住)</th>
            					<th style="width: 15%;">手機號碼</th>
            					<th style="width: 17.5%;">電子信箱</th>
            					<th><button type="button" class="btn btn-primary btn-lg btn-block"><i class="fa fa-mail-forward"></i> 發送</button></th>
            				</tr>
            			</thead>
            			<tbody class="reg-ta-tb">
            				<tr class="reg-ta-tb-tr">
								<td><div><input type="text" name="name" maxlength="10" required></div></td>
								<td><div><input type="text" name="birthDay" required>			</div></td>
								<td><div><input type="text" name="personID" required>			</div></td>
								<td><div><input type="text" name="contactPhone" required>		</div></td>
								<td><div><input type="text" name="contactCellphone" required>	</div></td>
								<td><div><input type="text" name="contactEmail" required>		</div></td>
								<td><div class="reg-tb-controller">
									<div>
										<button type="button" class="btn btn-success"><i class="fa fa-plus"></i></button>
									</div>
									<div>
										<button type="button" class="btn btn-danger"><i class="fa fa-minus"></i></button>
									</div>		
								</div></td>
            				</tr>
            			</tbody>
            		
            		</table>
            	</div>
               
               
               
               
            </div>
            <!-- 每頁不同的內容到這裡結束 -->
        </div>
    </div>

    <footer id="footer">
        <a>全站導覽</a>
        <button id="demo1">確認demo1</button>
        <button id="demo2">錯誤demo2</button>
        <button id="demo3">確認提醒demo3</button>
        <button id="demo4">多重選項&提醒視窗demo4</button>
        <button id="demo5">Demo5</button>
        <button id="demo6">Demo6</button>



    </footer>
</body>
</html>