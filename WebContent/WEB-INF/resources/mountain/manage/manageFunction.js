
var shareURL = "/MountainExploer.com/mountain/public"
var mb;

function ajaxCheck(){
	$.ajax({
		url : shareURL + "/mbInfo",
		method : "GET",
		dataType : "json",
		success : function(data){
			checkStatus(data)
		}
	})		
}


/* 
100	General Member
110	Uncertified Member
120	General Guide
130	Uncertified Guide
140	Suspended Member
150	Suspended Guide
160	Administrator
 *
 */

function checkStatus(data){
	let status = data.memberStatus.seqno
	if( status == 100 ){
		if( status == 120){
			setGuideNav(data.seqno);
		}
		setGeneralNav(data.seqno);
	}
	
	
}