<!DOCTYPE html>
<html>
<head>
    <title>CF Mitrah Blog</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-secondary">
    <div class="col-10 bg-light shadow" style="height: 100vh;">
        <cfoutput>
            <cfset post_id = url.id>
            <cfset commentsList = #rc.commentsList#>
            <cfset postsList = #rc.postsList#>
        </cfoutput>
        <nav class="navbar bg-primary shadow">
            <div class="container-fluid " style="font-family: 'Times New Roman', Times, serif;">
                <cfoutput>
                <h6 class="text-white">Comments for: #postsList.title#</h6>
                </cfoutput>
            </div>
        </nav>
    <div>
        <br>
        <div class="bg-white p-2">
            <cfoutput query="commentsList">
            <div class="border-white">
                <p><span class="text-secondary">Name: #commentsList.author# | E-mail:<a href="mailto:#commentsList.email#"> #commentsList.email#</a> | website:<a href="#commentsList.website#"> #commentsList.website#</a></span></p>
                <p class="card-text">#commentsList.content#</p>
                <p style="font-size: 0.9em;"><i class="text-secondary">Posted #dateFormat(commentsList.date, "mmmm dd, yyyy ")# #timeFormat(commentsList.date, "hh:mm tt")#</i> <span><a href=""> Edit</a></span> | <span><a href="index.cfm?action=blogposts.deleteComment&comment_id=#commentsList.comment_id#">Delete</a></span></p><hr>
            </div><hr>
             </cfoutput>
        </div>
    </div>
</div>
</div><br>
</body>
</html>