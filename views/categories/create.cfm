<cfoutput>
    <div class="col-10 bg-light shadow" style="height: 100vh;">
        <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-2 h4">
            <a href="index.cfm?action=categories.create" id="newCategoryBtn" class="btn">New Category</a>
            <a href="index.cfm?action=categories.update" id="editCategoryBtn" class="btn">Edit Category</a>
        </div>
        <nav class="navbar bg-primary shadow">
            <div class="container-fluid " style="font-family: 'Times New Roman', Times, serif;">
                <h6 class="text-white h4">Create new category</h6>
            </div>
        </nav><br>
        <div class="border border-secondary p-4 bg-white fw-bolder container mt-4 p-4 d bg-white d-flex gap-5 " style="height: 35vh;">
            <div style="width:500px">
                <form action="index.cfm?action=categories.save" method="post">
                <div class="mb-3">
                    <input type="hidden" name="category_id"  id="category_id" value="#createUUID()#">
                    <label for="exampleFormControlInput1" class="form-label text-dark">Title<span class="text-secondary">(required)</span></label><br>
                    <input type="text" class="" name="title" id="exampleFormControlInput1">
                    </div>
                    <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label text-dark">Description</label><br>
                    <textarea name="description" id="exampleFormControlTextarea1" rows="4" cols="50"></textarea>
                    </div>
                </div>
            </div>
        <div><br>
            <button type="submit" class="btn btn-outline-secondary rounded border-secondary" id="saveCategoryBtn">Save</button><br><br>
            <div id="message" class="alert alert-info" role="alert"></div>
    </cfoutput>
    </form>
</div>

