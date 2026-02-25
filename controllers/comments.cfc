component accessors="true" output="false"{
    property name="UserService" inject="model.UserService";
    remote function init(fw) {
        variables.fw = fw;
        return this;
    }
    remote void function save(struct rc) {
        var successStruct = UserService.saveComment(rc.post_id, rc.author, rc.email, rc.website, rc.content);
        if (structKeyExists(successStruct, "saved") && successStruct.saved) {
            variables.fw.redirect("comments.list") ;
        } else {
            variables.fw.redirect("comments.list");
        }
    }
    remote void function list(struct rc) {
        if(structKeyExists(rc, "id")){
            rc.commentsList = UserService.getComments();
            rc.postsList = UserService.getPostbyId(rc.id);
        } else {
            rc.commentsList = UserService.getComments();
            window.location.href = "index.cfm?action=comments.list";
        }
    }
     remote void function edit( struct rc){
        rc.categoriesList = UserService.getsCategories();
        rc.dataList = UserService.getPostbyId(rc.id);
    }
}