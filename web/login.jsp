<%@include file = "middleware/guest.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Page</title>
    <style>
        form {
            padding: 10px;
        }
        .form-input {
            margin-bottom: 15px;
        }
        .form-input label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-input input[type='text'], .form-input input[type='password'] {
            padding: 5px;
            width: 200px;
        }
        .form-input button {
            padding: 5px;
            text-transform: uppercase;
            width: 215px;
        }
        .error {
            color: red;
            font-weight: bold;

        }
    </style>
</head>
<body>
    <form method="POST" action="controller/LoginController.jsp">
        <div class="form-input">
            <label>Username</label>
            <input type="text" name="username" value="${cookie['username'].getValue()}">
        </div>
        <div class="form-input">
            <label>Password</label>
            <input type="password" name="password">
        </div>
        <div class="form-input">
            <input type="checkbox" name="remember" value="remember">
            <span>Remember Me!</span>
        </div>
        <div class="form-input">
            <button>Login</button>
        </div>
        <%
            if (request.getParameter("err") != null) {
        %>
            <div class="error">
        <%
                out.print("<span>" + request.getParameter("err") + "</span>");
        %>
            </div>
        <%
            }
        %>
    </form>
</body>
</html>