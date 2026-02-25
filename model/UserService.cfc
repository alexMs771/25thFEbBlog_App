<cfcomponent output="false">
    <cffunction name="checkLogin" access="remote" returnformat="json">
        <cfargument name="username" required="true">
        <cfargument name="password" required="true">
        <cfif arguments.username EQ "admin" AND arguments.password EQ "admin">
            <cfset session.role = "admin">
            <cfreturn { "role" : "admin" }>
        </cfif>
        <cfquery name="qUser" datasource="CFtasks">
            SELECT username
            FROM users
            WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
            AND password = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif qUser.recordCount EQ 1>
            <cfset session.role = "user">
            <cfreturn { "role" : "user" }>
        <cfelse>
            <cfreturn { "role" : "invalid" }>
        </cfif>
    </cffunction>
    <cffunction name ="saveCategory" access="remote" returnformat="json">
        <cfargument name="category_id" required="true">
        <cfargument name="title" required="true">
        <cfargument name="description" required="true">
        <cfquery datasource="CFtasks">
            INSERT INTO Categories(category_id, title, description)
            VALUES (
                <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfreturn { "status" : "success" }>
    </cffunction>
    <cffunction name="getsCategories" access="remote" returntype="any" returnformat="json">
         <cfquery name="qCategories" datasource="CFtasks">
            SELECT category_id, title, description
            FROM Categories
            ORDER BY category_id DESC
        </cfquery>
        <cfreturn qCategories>
    </cffunction>
    <cffunction name= "getCatbyId" access="remote" returntype="any" returnformat="json">
        <cfargument name="category_id" required="true">
            <cfquery name="qgetCat" datasource="CFtasks">
                SELECT category_id, title, description
                FROM Categories
                WHERE category_id = <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_varchar">
            </cfquery>
            <cfreturn qgetCat>
    </cffunction>
     <cffunction name= "getPostbyId" access="remote" returntype="any" returnformat="json">
        <cfargument name="post_id" required="true">
        <cfargument name="title" required="false">
        <cfargument name="content" required="false">
        <cfargument name="excerpt" required="false">
        <cfargument name="category_id" required="false">
             <cfquery name="qgetPost" datasource="CFtasks">
                SELECT c.title AS category_title, pc.id AS post_id, pc.title AS post_title, pc.date, pc.content,pc.excerpt,pc.category_id
                FROM Categories c
                LEFT JOIN blogposts pc ON pc.category_id = c.category_id
                WHERE pc.id = <cfqueryparam value="#arguments.post_id#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfreturn { "status" : "updated"}>
    </cffunction>
    <cffunction name="updateCategory" access="remote" returnformat="json">
        <cfargument name="category_id" required="true">
        <cfargument name="title" required="true">
        <cfargument name="description" required="true">
        <cfquery name="qUpdateCategory" datasource="CFtasks">
            UPDATE Categories
            SET title = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                description = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">
            WHERE category_id = <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn { "status" : "updated" }>
    </cffunction>
    <cffunction name="deleteCategory" access="remote">
        <cfargument name="category_id" required="true">
        <cfquery datasource="CFtasks" name="qDeleteCategory">
            DELETE FROM Categories
            WHERE category_id = <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn { "status" : "success" }>
    </cffunction>
    <cffunction name="savePost" access="remote" returntype="any" returnformat="json">
         <cfargument name="title" required="true">
        <cfargument name="content" required="true">
        <cfargument name="excerpt" required="true">
        <cfargument name="category_id" required="true">
        <cfquery datasource="CFtasks" name="qSavePost">
            INSERT INTO blogposts(title, content, excerpt, category_id)
            VALUES (
                <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.content#" cfsqltype="cf_sql_clob">,
                <cfqueryparam value="#arguments.excerpt#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfreturn { "saved" : true }>
    </cffunction>
    <cffunction name="getPosts" access="remote" returntype="any" returnformat="json">
        <cfquery name="qPosts" datasource="CFtasks">
            SELECT c.title AS category_title, pc.id AS post_id, pc.title AS post_title, pc.date, pc.content,pc.category_id
            FROM Categories c
            LEFT JOIN blogposts pc ON pc.category_id = c.category_id
            ORDER BY pc.id DESC
        </cfquery>
        <cfreturn qPosts>
    </cffunction>
    <cffunction name="deletePost" access="remote" returntype="any" returnformat="json">
        <cfargument name="id" required="true">
        <cfquery datasource="CFtasks" name="qDeletePost">
            DELETE FROM blogposts
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn { "deleted" : true }>
    </cffunction>
    <cffunction name="editPost" access="remote" returntype="any" returnformat="json">
        <cfargument name="id" required="true">
        <cfargument name="title" required="true">
        <cfargument name="content" required="true">
        <cfargument name="excerpt" required="true">
        <cfargument name="category_id" required="true">
        <cfquery name="qEditPost" datasource="CFtasks">
            UPDATE blogposts
            SET title = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                content = <cfqueryparam value="#arguments.content#" cfsqltype="cf_sql_clob">,
                excerpt = <cfqueryparam value="#arguments.excerpt#" cfsqltype="cf_sql_varchar">,
                category_id = <cfqueryparam value="#arguments.category_id#" cfsqltype="cf_sql_varchar">
            WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qEditPost>
    </cffunction>
    <cffunction name="saveComment" access="remote" returntype="any" returnformat="json">
        <cfargument name="post_id" required="true">
        <cfargument name="author" required="true">
        <cfargument name="email" required="true">
        <cfargument name="website" required="false">
        <cfargument name="content" required="true">
        <cfquery datasource="CFtasks" name="qSaveComment">
            INSERT INTO comments(id, author, email, website, content)
            VALUES (
                <cfqueryparam value="#arguments.post_id#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.author#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.website#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.content#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfreturn { "saved" : true }>
    </cffunction>
    <cffunction name="getPostCount" access="remote" returntype="any" returnformat="json">
        <cfquery name="qPostCount" datasource="CFtasks">
            SELECT COUNT(*) AS postCount
            FROM blogposts
        </cfquery>
        <cfreturn qPostCount.postCount>
    </cffunction>
    <cffunction name="getComments" access="remote" returntype="any" returnformat="json">
        <cfquery name="qComments" datasource="CFtasks">
            SELECT c.id AS post_id,c.comment_id, c.author, c.date, c.email, c.website, c.content, bp.title AS post_title
            FROM comments c
            LEFT JOIN blogposts bp ON bp.id = c.id
            ORDER BY c.comment_id DESC
        </cfquery>
        <cfreturn qComments>
    </cffunction>
    <cffunction name="TotalCommentCount" access="remote" returntype="any" returnformat="json">
        <cfquery name="qCommentCount" datasource="CFtasks">
            SELECT COUNT(*) AS commentCount
            FROM comments
        </cfquery>
        <cfreturn qCommentCount.commentCount>
    </cffunction>
    <cffunction name="getEachCommentCount" access="remote" returntype="any" returnformat="json">
        <cfquery name="qEachCommentCount" datasource="CFtasks">
            SELECT id, (
                SELECT COUNT(*)
                FROM comments
                WHERE id = blogposts.id
            ) AS Comment_count
            FROM blogposts
            ORDER BY id DESC
        </cfquery>
        <cfreturn qEachCommentCount>
    </cffunction>
    <cffunction name="editComment" access="remote" returntype="any" returnformat="json">
        <cfargument name="comment_id" required="true">
        <cfquery name="qEditComment" datasource="CFtasks">
            SELECT comment_id, id AS post_id, author, email, website, content
            FROM comments
            WHERE comment_id = <cfqueryparam value="#arguments.comment_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qEditComment>
    </cffunction>
    <cffunction name="deleteComment" access="remote">
        <cfargument name="comment_id" required="true">
        <cfquery datasource="CFtasks" name="qDeleteComment">
            DELETE FROM comments
            WHERE comment_id = <cfqueryparam value="#arguments.comment_id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn { "deleted" : true }>
    </cffunction>
</cfcomponent>