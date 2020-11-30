//jQuery 處理button click event 當畫面DOM都載入時
$(function(){
    $("#btnSignIn").on("click", function(){
        $("#content").html(""); //清空顯示結果
        GoogleLogin(); //Google登入
    });
    $("btnDisconnect").on("click", function(){
        Google_disconnect(); //和Google App
    });

});

function GoogleClientInit(){
    gapi.load("client", function(){
        gapi.client.init({
            //client_id 和 scope兩者參數必填
            clientId: "578428677346-4jvc65cma0hl66a9vvv9ka9iijjh2l6a.apps.googleusercontent.com",
            scope: "profile",
            discoveryDocs: "4nwYIYzwvLL9RDjDMcnIyjdY"
        });

    });
}

function GoogleLogin(){
    let auth2 = gapi.auth2.getAuthInstance();
    auth2.signIn().then(function (GoogleUser){
        console.log("Google登入成功");
        let user_id = GoogleUser.getId();
        console.log(`user_id:${user_id}`);
        //true會回傳包含access token，false則不會
        let AuthResponse = GoogleUser.getAuthInstance(true);
        let id_token = AuthResponse.id_token;
        
        //people.get
        gapi.client.people.people.get({
            'resourceName': 'people/me',
            //用戶個資
            'personFields': 'names, phoneNumbers, emailAddresses, addresses, residences, genders, birthdays, occupations',
        }).then(function(res){

            //success
            //將物件列化為String，方便顯示結果在畫面上
            let str = JSON.stringify(res.result);

            //顯示授權你網站存取的用戶個資
            document.getElementById('content').innerHTML = str;
            //↑通常metadata標記primary:true的個字就是你該抓的資料

            //再自行parse JSON，可以將JSON字串丟到線上parse工具查看：http://json.parser.online.fr/

            //最終取得用戶個資後看要填寫在畫面表單上或是透過Ajax儲存到資料庫

        });


    })
}