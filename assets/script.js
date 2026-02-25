$(document).ready(function(){

    $("#loginbutton").click(function(){

        $.ajax({
            url: "model/UserService.cfc?method=checkLogin",
            type: "post",
            dataType: "json",
            data: {
                username: $("#username").val(),
                password: $("#password").val()
            },
            success: function(res){

                if(res.role == "admin"){
                    window.location.href="index.cfm?action=overviews.dashboard";
                }
                else if(res.role == "user"){
                    window.location.href="index.cfm?action=posts.list";
                }
                else{
                    $("#msg").text("Invalid Credentials");
                }
            }
        });

    });

});
