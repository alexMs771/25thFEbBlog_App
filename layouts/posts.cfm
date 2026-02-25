<!DOCTYPE html>
<html>
<head>
    <title>CFPothys's Blog</title>
    <style>
        .mydiv:hover {
            color: #379087;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/script.js"></script>
    <script src="https://kit.fontawesome.com/your-kit-code.js" crossorigin="anonymous"></script>
</head>
<body class="text-secondary">
    <div>
        <nav class="navbar  "style="background-color: #379087;">
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
        </div>
        <cfoutput>
            #body#
        </cfoutput>
    </div><hr>
    <footer class="bg-white text-center text-secondary p-3" style="font-family: 'Times New Roman', Times, serif;">
        <p class="mb-0">Copyright © 2024 CF Mitrah Blog. </p>
    </footer>
</body>
</html>