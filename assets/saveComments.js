$(document).ready(function(){

    $("#submitcomment").click(function(){

        $.ajax({
            url: "controllers/comments.cfc?method=saveComment",
            type: "post",
            dataType: "json",
            data: {
                post_id: $("#post_id").val(),
                author: $("#exampleFormControlInput1").val(),
                content: $("#exampleFormControlTextarea1").val(),
                email: $("#exampleFormControlInput2").val(),
                website: $("#exampleFormControlInput3").val(),
            },
            success:function(res){
                if(res.saved){
                    window.location.href="index.cfm?action=comments.list";
                    $("#message").text("Comment saved successfully").addClass("alert-success").removeClass("alert-info");
                }else{
                    $("#message").text("Error saving comment").addClass("alert-danger").removeClass("alert-info");
                }
            }
        });
    });

});