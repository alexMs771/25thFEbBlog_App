$(document).ready(function(){

    $("#savePostBtn").click(function(){

        $.ajax({
            url: "controllers/blogposts.cfc?method=savePost",
            type: "post",
            dataType: "json",
            data: {
                title: $("#exampleFormControlInput1").val(),
                content: $("#exampleFormControlTextarea1").val(),
                excerpt: $("#exampleFormControlInput2").val(),
                category_id: $("input[name='category_id']:checked").map(function(){return $(this).val();}).get() //it is ckeckbox value, when user ckecks th box it taks that ID and send to controller, if user ckecks multiple box it will send multiple ID in array format
            },
            success:function(res){
                if(res.saved){
                    window.location.href="index.cfm?action=blogposts.list";
                    $("#message").text("Post saved successfully").addClass("alert-success").removeClass("alert-info");
                }else{
                    $("#message").text("Error saving post").addClass("alert-danger").removeClass("alert-info");
                }
            }
        });
    });

});