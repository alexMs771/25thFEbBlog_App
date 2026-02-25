<cfoutput>
    <div class="col-10 bg-light shadow" style="height: 100vh;">
        <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-2 h4">
            <a href="index.cfm?action=categories.create" id="newCategoryBtn" class="btn">New Category</a>
            <a href="index.cfm?action=categories.edit" id="editCategoryBtn" class="btn">Edit Category</a>
        </div>
        <nav class="navbar bg-primary shadow">
            <div class="container-fluid " style="font-family: 'Times New Roman', Times, serif;">
                <h6 class="text-white h4">All Categories</h6>
            </div>
        </nav><br>
    <cfset categories= #rc.dataList#>
    </cfoutput>
         <table class="table table-bordered">
            <tr class="border border-secondary-subtle">
                <th scope="col">Edit</th>
                <th scope="col">Title</th>
                <th scope="col">Delete</th>
            </tr>
            <cfoutput query="categories">
            <tr>
                <td><a href="index.cfm?action=categories.edit&category_id=#categories.category_id#" class="text-secondary">Edit</a></td>
                <td>#categories.title#</td>
                <td><a href="index.cfm?action=categories.delete&category_id=#categories.category_id#" class="text-secondary" onclick="return confirm('Are you sure you want to delete this category?');">Delete</a></td>
            </tr>
    </cfoutput>
        </table><br><br>
        <div id="message" class="alert-info" role="alert"></div>
</div>

