<script src="assets/updateCategory.js"></script>
<cfoutput>
        <cfset category_id = url.category_id>
        <cfset dataList = #rc.dataList#>
        <cfset categoryList = #rc.getCategories#>
    <div class="col-10 bg-light shadow" style="height: 100vh;">
        <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-2 h4">
            <a href="index.cfm?action=categories.create" id="newCategoryBtn" class="btn">New Category</a>
            <a href="index.cfm?action=categories.edit" id="editCategoryBtn" class="btn">Edit Category</a>
        </div>
        <nav class="navbar bg-primary shadow">
            <div class="container-fluid " style="font-family: 'Times New Roman', Times, serif;">
                <h6 class="text-white h4">Editing Category:#dataList.title# </h6>
            </div>
        </nav><br>
        <div class="border border-secondary p-4 bg-white fw-bolder container mt-4 p-4 d bg-white d-flex gap-5 " style="height: 35vh;">
            <div style="width:500px">
                <div class="mb-3">
                    <form action="index.cfm?action=categories.update" method="post">
                        <input type="hidden" name="category_id" value="#category_id#" id="categoryID">
                        <label for="categoryTitle" class="form-label text-dark">Title<span class="text-secondary">(required)</span></label><br>
                        <input type="text" class="" id="categoryTitle" name="title" value="#dataList.title#">
                        </div>
                        <div class="mb-3">
                        <label for="categoryDescription" class="form-label text-dark">Description</label><br>
                        <textarea id="categoryDescription" name="description" rows="4" cols="50" id="categoryDescription">#dataList.description#</textarea>
                    </div>
                </div>
            </div>
        <div><br>
            <button type="submit" class="btn btn-outline-secondary rounded border-secondary" id="catEditbtn" name="catEditbtn">Save</button>
        </form>
    </div>
</cfoutput>
</body>
</html>
