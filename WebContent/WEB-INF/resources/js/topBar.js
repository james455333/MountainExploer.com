// top bar顯示/隱藏
$(document).ready(function () {
    $.extend({
        'goAnchor': function (to, time) {
            $obj = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
            $($obj).animate({
                scrollTop: to
            }, time);
        }
    });
    $('#click').click(function () {
        $.goAnchor($('#target').offset().top, 1000);
    });
    $('#progress').click(function () {
        $.goAnchor($('#target').offset().top, 1000);
    });
	var bodyClass = document.body.classList
	 lastScrollY = 0;
	window.addEventListener('scroll', function () {
	    var st = this.scrollY;
	    /* 判斷是向上捲動，而且捲軸超過 200px */
	    if (st < lastScrollY) {
	        bodyClass.remove('hideUp');
	    } else {
	        bodyClass.add('hideUp');
	    }
	    lastScrollY = st;
	    });
});
//console.log(document.body)
    

   