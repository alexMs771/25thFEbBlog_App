$(document).ready(function(){
    $("#saveCategoryBtn").click(function(){
        $.ajax({
            url: "controllers/categories.cfc?method=create",
            type: "post",
            dataType: "json",
            data: {
                category_id: $("#category_id").val(),
                title: $("#exampleFormControlInput1").val(),
                description: $("#exampleFormControlTextarea1").val()
            },
            success:function(res){
                if(res.status == "success"){
                    window.location.href="index.cfm?action=categories.allcategories";
                    $("#message").text("Category saved successfully").addClass("alert-success").removeClass("alert-info");
                }else{
                    $("#message").text("Error saving category").addClass("alert-danger").removeClass("alert-info");
                }
            }
        });
    });
});