<!DOCTYPE html>
<html>
<head>
    <title>CF Mitrah Blog</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-secondary">
    <div class="col-10 bg-light shadow" style="height: 100vh;">
        <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-2 h4">
            <a href="index.cfm?action=blogposts.newpost" id="newCategoryBtn" class="btn">New post</a>
            <a href="index.cfm?action=blogposts.edit" id="editCategoryBtn" class="btn">Edit post</a>
        </div>
        <cfoutput>
        <cfset post_id = url.id>
        <cfset categories = #rc.categoriesList#>
        <cfset postsedit = #rc.dataList#>
        <nav class="navbar bg-primary shadow">
            <div class="container-fluid " style="font-family: 'Times New Roman', Times, serif;">
                <h6 class="text-white h4">Editing:<span class="fw-bold"> #postsedit.title# </span></h6>
            </div>
        </nav><br>
         <form action="index.cfm?action=blogposts.update&id=#post_id#" method="post">
         <div class="container mt-4 p-4 d bg-white d-flex gap-2" style="height: 50vh;" cols="2">
                <div class="col-8 border p-2" style="height: 45vh;">
                 <div class="mb-3" cols="2">
                    <input type="hidden" name="post_id" value="#post_id#">
                    <label for="exampleFormControlInput1" class="form-label text-dark">Title<span class="text-secondary">(required)</span></label><br>
                    <input type="text" name="title" id="exampleFormControlInput1" value="#postsedit.title#">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label text-dark">Content<span class="text-secondary">(required)</span></label><br>
                    <textarea name="content" id="exampleFormControlTextarea1" rows="4" cols="50">#postsedit.content#</textarea>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label text-dark">Excerpt</label><br>
                    <textarea name="excerpt" id="exampleFormControlTextarea1" rows="4" cols="50">#postsedit.excerpt#</textarea>
                </div>

            </div>
            <div class="col-4 border p-2" style="height: 45vh;">
                <div class="mb-3" cols="2"><br>
                    <p class="h6">Fill this post under :</p>
                </div>
                </cfoutput>
                <cfoutput>
                <cfset categories = #rc.categoriesList#>
                </cfoutput>
                <cfoutput query="categories">
                <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="categories" value="#categories.category_id#" id="checkDefault#categories.category_id#">
                        <label class="form-check-label" for="checkDefault#categories.category_id#">
                    #categories.title#
                    </label><br>
                </div>
                </cfoutput>
                <div class="mb-3" cols="2">
                    <label for="exampleFormControlInput1" class="form-label text-dark">New category</label><br>
                    <input type="text" class="" name="newCategory" id="exampleFormControlInput1">
                </div>
            </div>
        </div><br><br>
        <button type="submit" class="btn btn--secondary rounded border-secondary" id="saveCategoryBtn">Save</button><br><br>
    </form>
    </div>
</div>
</div><br>
</body>
</html>
