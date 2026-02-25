<!DOCTYPE html>
<html>
<head>
    <title>CFPothys's Blog</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/script.js"></script>
    <script src="https://kit.fontawesome.com/your-kit-code.js" crossorigin="anonymous"></script>
</head>
<body>
    <div>
        <nav class="navbar" style="background-color: #379087;">
            <div class="container-fluid" style="font-family: 'Times New Roman', Times, serif; color:#917e7e;font-size: 14px;">
                <h6 class="text-white" style="margin: 10px 0px 10px 10px;">CFPothys's Blog</h6>
                <form class="d-flex justify-content-evenly" role="search">
                    <a href="index.cfm?action=posts.list" class="nav-link text-white">Home</a><a href="index.cfm?action=posts.create" class="nav-link text-white">|</a>
                    <a href="index.cfm?action=logout.logout" id="logoutbutton" class="nav-link text-white">Logout</a>
                </form>
            </div>
        </nav>
        <div class="d-flex" style="color:#148277; margin-left: 20px;">
            <svg xmlns="http://www.w3.org/2000/svg" x="10px" y="20px" width="30" height="26" viewBox="0 0 48 48">
                <path d="M 24 4 L 1.0371094 18.029297 L 1.9296875 19.488281 C 3.0816875 21.372281 5.5427344 21.965453 7.4277344 20.814453 L 24 10.689453 L 40.572266 20.814453 C 42.456266 21.965453 44.917313 21.372281 46.070312 19.488281 L 46.962891 18.029297 L 39 13.164062 L 39 4 L 35 4 C 33.9 4 33 4.9 33 6 L 33 9.4980469 L 24 4 z M 24 14.210938 L 8.9902344 23.380859 C 8.0802344 23.940859 7.05 24.269375 6 24.359375 L 6 43 L 18 43 L 18 29 C 18 27.34 19.34 26 21 26 L 30 26 L 30 43 L 36 43 C 39.31 43 42 40.31 42 37 L 42 24.359375 C 40.95 24.269375 39.919766 23.940859 39.009766 23.380859 L 24 14.210938 z"></path>
            </svg><i class="h5">Blog Home</i>
        </div><br>
        <cfif structkeyexists(url,"id")>
            <cfoutput>
            <cfset id = url.id>
            <cfset commentsList = #rc.commentsList#>
            <cfset postsList = #rc.postsList#>
            <div class="p-2">
            <div class="bg-white p-2">
                <h5 class="card-title h4 mb-2 text-success">#postsList.title#</h5>
                <p class="card-text">#postsList.content#</p><hr>
            </cfoutput>
            <div class="p-2">
            <form action="index.cfm?action=comments.save" method="post" class="bg-white" style="height: 50vh;">
                <div class="d-flex flex-column gap-2 p-2">
                    <div class="">
                         <p class="text-primary">Add Comments</p><hr>
                        <cfoutput>
                            <input type="hidden" name="post_id" value="#url.id#" id="post_id">
                            <label for="exampleFormControlInput1" class="form-label text-dark">Name<span class="text-secondary">(required)</span></label><br>
                            <input type="text" class="form-label text-dark" name="author" id="exampleFormControlInput1"><br>
                            <label for="exampleFormControlInput1" class="form-label text-dark">Email<span class="text-secondary">(will not be published)(required)</span></label><br>
                            <input type="email" class="form-label text-dark" name="email" id="exampleFormControlInput2"><br>
                            <label for="exampleFormControlInput1" class="form-label text-dark">Website</label><br>
                            <input type="text" class="form-label text-dark" name="website" id="exampleFormControlInput3"><br>
                            <label for="exampleFormControlTextarea1" class="form-label text-dark">Comment<span class="text-secondary">(required)</span></label><br>
                            <textarea name="content" class="form-label text-dark" id="exampleFormControlTextarea1" rows="4" cols="50"></textarea>
                        </cfoutput>
                    </div>
                    <button type="submit" class="btn btn-sm btn-secondary p-2" name="submitComment" id="submitComment">Submit Comment</button>
                </div>
            </form>
        <cfelse>
            <cfoutput>
                <cfset commentsList = #rc.commentsList#>
            </cfoutput><br>
            <div class="bg-white p-2" style="height: 50vh;">
             <cfoutput query="commentsList" group="post_id">
                <div class="border-white">
                    <h5 class="card-title h4 mb-2 text-success">#commentsList.post_title#<br><span class="btn btn-sm"> Add Comments<span><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px"><path d="M440-400h80v-120h120v-80H520v-120h-80v120H320v80h120v120ZM80-80v-720q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v480q0 33-23.5 56.5T800-240H240L80-80Zm126-240h594v-480H160v525l46-45Zm-46 0v-480 480Z"/></svg></span></span></h5>
                    <h6 class="card-subtitle mb-2 text-muted">Comments:</h6>
                    <p><span class="fw-bold">#commentsList.author#</span> says:</p>
                    <p class="card-text">#commentsList.content#</p><hr>
                    </cfoutput>
                </div><hr>
            </div>
        </cfif>
        </div>
</body>
</html>