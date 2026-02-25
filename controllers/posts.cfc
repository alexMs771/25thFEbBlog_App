component accessors="true" output="false"{
    property name="UserService" inject="model.UserService";
    remote function init(fw) {
        variables.fw = fw;
        return this;
    }

    remote void function list( struct rc) {
        rc.postsList = UserService.getPosts();
        rc.categoriesList = UserService.getsCategories();
    }
}
