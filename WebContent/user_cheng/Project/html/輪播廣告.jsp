<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/MountainExploer.com/css/other.css">
    <style>
        .coverflow {
            width: 1430px;
            height: 350px;
            position: absolute;
            margin-top: 10px;
        }

        .coverflow>a {
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            /* 當圖片數量增加，影片長度需更改，變為5s圖片數量 */
            -webkit-animation: silder 15s linear infinite;
            animation: silder 15s linear infinite;
        }

        .coverflow>a>img {
            max-width: 100%;
        }

        /* 動畫關鍵影格 */
        @-webkit-keyframes silder {
            3% {
                opacity: 1;
                filter: alpha(opacity=100);
            }

            27% {
                opacity: 1;
                filter: alpha(opacity=100);
            }

            30% {
                opacity: 0;
                filter: alpha(opacity=0);
            }
        }

        @keyframes silder {
            3% {
                opacity: 1;
                filter: alpha(opacity=100);
            }

            27% {
                opacity: 1;
                filter: alpha(opacity=100);
            }

            30% {
                opacity: 0;
                filter: alpha(opacity=0);
            }
        }


        /* 每個圖片各延遲5秒 */
        .coverflow>a:nth-child(3) {
            -webkit-animation-delay: 10s;
            animation-delay: 10s;

        }

        .coverflow>a:nth-child(2) {
            -webkit-animation-delay: 5s;
            animation-delay: 5s;

        }

        .coverflow>a:nth-child(1) {
            -webkit-animation-delay: 0s;
            animation-delay: 0s;

        }

        /* 滑入停止 */
        /* .coverflow:hover>a {
            -webkit-animation-play-state: paused;
            animation-play-state: paused;
        } */

        /* border-radius: 50%; */
        /* margin: 0px auto; */
        }
    </style>
</head>

<body>
    <div class="count1_1">

        <div class="coverflow">
            <a href="#"><img id="output1" src="/MountainExploer.com/images/BGI.jpg"></a>
            <a href="#"><img id="output1" src="/MountainExploer.com/images/亮的.jpg"></a>
            <a href="#"><img id="output1" src="/MountainExploer.com/images/橋山.jpg"></a>
        </div>
        <div class="coverflow" style="">
            <a href="#"><img src="/MountainExploer.com/images/logo.png"></a>
            <a href="#"><img src="/MountainExploer.com/images/logo.png"></a>
            <a href="#"><img src="/MountainExploer.com/images//logo.png"></a>
        </div>
    </div>
</body>
<script src="/MountainExploer.com/js/upLoadImg.js"></script><!-- 上傳頭像 -->
<script src="/MountainExploer.com/js/table.js"></script>
<script src="/MountainExploer.com/js/topBar.js"></script>
<script src="/MountainExploer.com/js/sweetalert.js"></script><!--sweet alert-->
<script src="/MountainExploer.com/js/includejsp.js"></script>
</html>