component {
    property name="UserService";
    remote function init(fw) {
        variables.fw = fw;
        return this;
    }
    remote function setupview(struct rc )  {
        if(session.role EQ "admin"){
            variables.fw.setView("adminLayout");
        } else {
            variables.fw.setView("default");
        }
    }
}




