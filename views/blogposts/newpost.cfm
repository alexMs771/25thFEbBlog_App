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
            <a href="index.cfm?action=blogposts.create" id="newCategoryBtn" class="btn">New post</a>
            <a href="index.cfm?action=blogposts.edit" id="editCategoryBtn" class="btn">Edit post</a>
        </div>
        <nav class="navbar bg-primary shadow">
            <div class="container-fluid " style="font-family: 'Times New Roman', Times, serif;">
                <h6 class="text-white h4">Creating New Post</h6>
            </div>
        </nav><br>
    <form action="index.cfm?action=blogposts.save" method="post">
         <div class="container mt-4 p-4 d bg-white d-flex gap-2 " style="height: 50vh;" cols="2">
                <div class="col-8 border p-2" style="height: 45vh;">
                 <div class="mb-3" cols="2">
                    <label for="exampleFormControlInput1" class="form-label text-dark">Title<span class="text-secondary">(required)</span></label><br>
                    <input type="text" class="" name="title" id="exampleFormControlInput1">
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label text-dark">Content<span class="text-secondary">(required)</span></label><br>
                    <textarea name="content" id="exampleFormControlTextarea1" rows="4" cols="50"></textarea>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label text-dark">Excerpt</label><br>
                    <textarea name="excerpt" id="exampleFormControlTextarea1" rows="4" cols="50"></textarea>
                </div>

            </div>
            <div class="col-4 border p-2" style="height: 45vh;">
                <div class="mb-3" cols="2"><br>
                    <p class="h6">Fill this post under :</p>
                </div>
                <cfoutput>
                    <cfset categories = #rc.categoriesList#>
                </cfoutput>
                <!---it is ckeckbox value, when user ckecks th box it taks that ID and send to controller, if user ckecks multiple box it will send multiple ID in array format--->
                <cfoutput query="categories">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="category_id" value="#categories.category_id#" id="categoryCheck">
                        <label class="form-check-label" for="categoryCheck">#categories.title#</label>
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
<!--- body content area--->
</body>
</html>
