
$(function () {
  var name = $("#name"),
    password = $("#password"),
    allFields = $([]).add(name).add(password),
    tips = $(".validateTips");
  $("#dialog-form").dialog({
    autoOpen: false,
    modal: true,
    show:'true',
    // hide:'puff',
    height: 350,
    width: 300,
    
    
    resizable: false,
    buttons: {
      登入: function () {
        $(this).dialog("close");
        // $.ajax({
        //    url : "",
        //    type : "GET"
        //    data : {
        //      account : $(".class").find("input[name='']").val()
        //    }
        // })
        window.location.href = '../index.html'
      },
      取消: function () {
        $(this).dialog("close");
      }
    },
    close: function () {
      allFields.val("").removeClass("ui-state-error");
    }
  });

  $("#create-user")
    .button()
    .click(function () {
      $("#dialog-form").dialog("open");
    });
});