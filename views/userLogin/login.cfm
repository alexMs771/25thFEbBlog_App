<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/script.js"></script>
</head>
<body class="p-3 mt-5">
    <div class="container w-25 shadow rounded"><br>
        <h4 class="text-secondary text-center fw-bold"><span class="text-info">User</span> Login</h4>
        <form  method="POST">
            <!---img src="download.png" width="150" alt="Login Form"--->
            <label for="username" class="flex-start text-secondary">Username:</label>
            <input type="text" id="username" name="username" required class="form-control"><br>
            <label for="password" class="flex-start text-secondary">Password:</label>
            <input type="password" id="password" name="password" required class="form-control"><br>
            <button type="button" class="btn btn-info" id="loginbutton">Login</button><br>
        </form><br>
        <p id="msg" class="text-danger"></p><br>
        <!---a href="index.cfm?action=user.register" class="text-primary">new user? Register here</a><br><br--->
    </div>
</body>
</html>