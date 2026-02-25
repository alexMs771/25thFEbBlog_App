<cfoutput>
<cfset listingposts = #rc.postsList#>
<cfset commentCount = #rc.eachCommentCount#>
</cfoutput>
<div class="col-10 bg-light shadow" style="height: 100vh;">
    <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-2 h4">
        <a href="index.cfm?action=blogposts.newpost" id="newCategoryBtn" class="btn">New post</a>
        <a href="index.cfm?action=blogposts.edit" id="editCategoryBtn" class="btn">Edit post</a>
    </div>
    <nav class="navbar bg-primary shadow">
        <div class="container-fluid " style="font-family: 'Times New Roman', Times, serif;">
            <h6 class="text-white h4">All Posts</h6>
        </div>
    </nav><br>
<div><a href="index.cfm?action=blogposts.newpost" class="btn btn-secondary">Create New Post</a></div><br>
<table class="table table-bordered table-striped table-hover">
    <tr class="border border-secondary-subtle ">
        <th scope="col">Edit</th>
        <th scope="col">Title</th>
        <th scope="col">Date</th>
        <th scope="col">Status</th>
        <th scope="col">Comments</th>
        <th scope="col">Delete</th>
    </tr>
    <cfoutput query="listingposts" group="post_id">
    <tr>
        <td><a href="index.cfm?action=blogposts.edit&id=#listingposts.post_id#" class="text-secondary btn btn-sm btn-outline-secondary rounded-pill">Edit</a></td>
        <td>#listingposts.post_title#</td>
        <td>#dateFormat(listingposts.date, " mm/dd/yyyy ")#</td>
        <td><i class="bi bi-check-circle-fill text-secondary">published</i></td>
            <cfquery name="commentCount" datasource="CFtasks">
                SELECT COUNT(*) AS Comment_count
                FROM comments
                WHERE id = '#listingposts.post_id#'
            </cfquery>
        <cfif commentCount.Comment_count EQ 0>
        <td><a href="index.cfm?action=blogposts.commentList&id=#listingposts.post_id#" class="text-secondary">0</a></td>
        <cfelse>
        <td><a href="index.cfm?action=blogposts.commentList&id=#listingposts.post_id#" class="text-secondary">#commentCount.Comment_count#</a></td>
        </cfif>
        <td><a href="index.cfm?action=blogposts.delete&id=#listingposts.post_id#" class="text-secondary" onclick="return confirm('Are you sure you want to delete this post?');">Delete</a></td>
    </tr>
    </cfoutput>
</table>
</div>
