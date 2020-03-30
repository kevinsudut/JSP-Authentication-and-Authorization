<%@include file = "middleware/login.jsp" %>

<%
    Integer online = (Integer) application.getAttribute("online");
    online = (online == null) ? 0 : online;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home Page</title>
    <style>
        .info {
            display: block;
            margin-bottom: 20px;
        }
        a {
            padding: 8px;
            text-transform: uppercase;
            text-decoration: none;
            color: black;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <div class="info">
        <b>Welcome, <% out.print(session.getAttribute("Auth-Name")); %></b>
    </div>
    <div class="info">
        <span>Total online user: <% out.print(online); %> </span> 
    </div>
    <div class="info">
        <a href="logout.jsp">Logout</a>
    </div>
</body>
</html>