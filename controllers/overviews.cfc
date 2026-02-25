component accessors="true" output="false"{
    property name="UserService" inject="model.UserService";
    remote function init(fw) {
        variables.fw = fw;
        return this;
    }
    remote void function dashboard(struct rc){
        rc.postCount= Userservice.getPostCount();
        rc.commentCount= Userservice.TotalCommentCount();
    }
}
