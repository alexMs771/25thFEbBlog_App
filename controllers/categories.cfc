component accessors="true" output="false"{
    property name="UserService" inject="model.UserService";
     function init(fw) {
        variables.fw = fw;
        return this;
    }
    remote void function save( struct rc) {
        var successStruct = UserService.saveCategory(rc.category_id ,rc.title, rc.description);
    if (structKeyExists(successStruct, "saved") && successStruct.saved) {
            variables.fw.redirect("categories.allcategories");
        } else {
            variables.fw.redirect("categories.create");
        }
    }
    remote void function allcategories( struct rc){
        rc.dataList =UserService.getsCategories();
    }
     remote void function edit( struct rc){
        rc.getCategories =UserService.getsCategories();
        rc.dataList = UserService.getCatbyId(rc.category_id);
    }
    remote void function update(rc){
        rc.updateData = UserService.updateCategory(rc.category_id, rc.title, rc.description);
    if (structKeyExists(rc.updateData, "updated") && rc.updateData.updated) {
            variables.fw.redirect("categories.allcategories");
        } else {
            variables.fw.redirect("categories.edit?category_id=" & rc.category_id);
        }
    }
    remote void function delete(rc) {
        var successStruct = UserService.deleteCategory(rc.category_id);
    if (structKeyExists(successStruct, "status") && successStruct.status EQ "success") {
            variables.fw.redirect("categories.allcategories");
        } else {
            variables.fw.redirect("categories.create");
        }
    }
}