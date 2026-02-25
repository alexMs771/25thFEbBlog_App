component accessors="true" output="false"{
    property name="UserService" inject="model.UserService";
    remote function init(fw) {
        variables.fw = fw;
        return this;
    }
    remote void function save(struct rc) {
        rc.successStruct = UserService.savePost(rc.title, rc.content, rc.excerpt, rc.category_id);
        if (structKeyExists(rc.successStruct, "saved") && rc.successStruct.saved) {
            variables.fw.redirect("blogposts.list");
        } else {
            variables.fw.redirect("blogposts.newpost");
        }
    }
    remote void function list( struct rc) {
        rc.postsList = UserService.getPosts();
        rc.eachCommentCount = UserService.getEachCommentCount();
        rc.categoriesList = UserService.getsCategories();
        rc.deleted = structKeyExists(rc, "deleted") ? rc.deleted : false;
        rc.edited = structKeyExists(rc, "edited") ? rc.edited : false;
    }
    remote void function newpost( struct rc){
        rc.categoriesList = UserService.getsCategories();
    }
    remote void function edit( struct rc){
        rc.categoriesList = UserService.getsCategories();
        rc.dataList = UserService.getPostbyId(rc.id);
    }
    remote void function delete(struct rc) {
        var successStruct = UserService.deletePost(rc.id);
        if (structKeyExists(successStruct, "deleted") && successStruct.deleted) {
            variables.fw.redirect("blogposts.list?deleted=true");
        } else {
            variables.fw.redirect("blogposts.list?deleted=false");
        }
    }
    remote void function deleteComment(struct rc) {
        var successStruct = UserService.deleteComment(rc.comment_id);
        if (structKeyExists(successStruct, "deleted") && successStruct.deleted) {
            variables.fw.redirect("blogposts.commentList?id=#rc.id#");
        } else {
            variables.fw.redirect("blogposts.commentList?id=#rc.id#");
        }
    }
}
