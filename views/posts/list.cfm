        <cfoutput>
        <cfset posts = #rc.postsList#>
        <cfset categories = #rc.categoriesList#>
        </cfoutput>
    <div class="bg-white d-flex gap-2 p-2" style="font-family: 'Times New Roman', Times, serif;">
        <div class="col-9 m-2 scrollable">
            <div class="row-cols-1">
                <cfoutput query="posts">
                    <div class="border-white" style="max-width: 100%;">
                        <div class="card-body mydiv" onclick="window.location.href='index.cfm?action=comments.list&id=#posts.post_id#';">
                            <h5 class="card-title h4 mb-2">#posts.post_title#</h5>
                            <div class="" style="font-size:15px">#posts.content#</div>
                            <cfloop query="categories">
                                <cfif #categories.category_id# EQ #posts.category_id#>
                                    <button class="btn btn-secondary btn-sm fw-bold" style="font-size:8px">#categories.title#</button>
                                </cfif>
                            </cfloop>
                            <input type="hidden" name="post_id" value="#posts.post_id#">
                        </div>
                        <div class="card-footer border-white">
                            <small class="text-muted"><i>Posted by admin on #dateFormat(posts.date, 'mmmm dd, yyyy')#</i></small>
                        </div>
                    </div><hr>
                </cfoutput>
            </div>
        </div>
        <div class="card" style="height:44vh; width: 22%;">
            <p class="h5 p-2 text-white" style="background-color:  #379087">Categories</p>
             <cfoutput query="categories">
                <div class="d-flex gap-2 p-2">
                    <p class="text-secondary h6"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" style="fill: rgb(111, 114, 121);"><path d="M480-400 40-640l440-240 440 240-440 240Zm0 160L63-467l84-46 333 182 333-182 84 46-417 227Zm0 160L63-307l84-46 333 182 333-182 84 46L480-80Zm0-411 273-149-273-149-273 149 273 149Zm0-149Z"/></svg>#categories.title#</p>
                </div>
            </cfoutput><hr>
            <div class="card">
            <p class="h5 p-2 text-white" style="background-color:#379087">Archives</p>
                <cfoutput query="posts">
                    <div class="d-flex gap-2 p-2">
                        <p class="text-secondary h6"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" style= "fill: rgb(111, 114, 121);"><path d="M200-80q-33 0-56.5-23.5T120-160v-560q0-33 23.5-56.5T200-800h40v-80h80v80h320v-80h80v80h40q33 0 56.5 23.5T840-720v560q0 33-23.5 56.5T760-80H200Zm0-80h560v-400H200v400Zm0-480h560v-80H200v80Zm0 0v-80 80Zm280 240q-17 0-28.5-11.5T440-440q0-17 11.5-28.5T480-480q17 0 28.5 11.5T520-440q0 17-11.5 28.5T480-400Zm-188.5-11.5Q280-423 280-440t11.5-28.5Q303-480 320-480t28.5 11.5Q360-457 360-440t-11.5 28.5Q337-400 320-400t-28.5-11.5ZM640-400q-17 0-28.5-11.5T600-440q0-17 11.5-28.5T640-480q17 0 28.5 11.5T680-440q0 17-11.5 28.5T640-400ZM480-240q-17 0-28.5-11.5T440-280q0-17 11.5-28.5T480-320q17 0 28.5 11.5T520-280q0 17-11.5 28.5T480-240Zm-188.5-11.5Q280-263 280-280t11.5-28.5Q303-320 320-320t28.5 11.5Q360-297 360-280t-11.5 28.5Q337-240 320-240t-28.5-11.5ZM640-240q-17 0-28.5-11.5T600-280q0-17 11.5-28.5T640-320q17 0 28.5 11.5T680-280q0 17-11.5 28.5T640-240Z"/></svg>#dateFormat(posts.date, 'mmm, yyyy')#</p>
                    </div>
                </cfoutput>
            </div>
        </div>
    </div><hr>
 </body>
</html>