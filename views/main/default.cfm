<cfset session.role = "">
<!DOCTYPE html>
<html>
<head>
    <title>Blog App</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/script.js"></script>
</head>
<cfoutput>
<body class="p-3 mb-2 text-dark bg-yellow">
    <div class="container w-25 p-3 rounded-3 border  mt-4 shadow bg-white text-center shadow">
        <h2 class="text-dark fw-bold"> Select Login</h2><br>
            <a href="#buildURL('userLogin.login')#">
                <button class="btn btn-secondary w-100">User</button>
            </a><br><br>
            <a href="#buildURL('adminLogin.login')#">
                <button class="btn btn-primary w-100">Admin</button>
            </a>
    </div><br>
</body>
</cfoutput>
</html>
<cfdump var="#session#"><br>
<cfdump var="#rc#" label="Request Scope"><br>
<cfdump var="#url#" label="URL Scope"><br>


