<%@include file = "../util/Connect.jsp" %>
<%@page import="java.sql.*" %>

<%
    final String USERNAME = request.getParameter("username");
    final String PASSWORD = request.getParameter("password");
    final String REMEMBER = request.getParameter("remember");

    final String QUERY = String.format("SELECT * FROM users WHERE username = '%s' AND password = '%s' LIMIT 1", USERNAME, PASSWORD);

    final Connect con = new Connect();
    try {
        ResultSet rs = con.executeQuery(QUERY);

        if (rs.next()) {
            
            if(REMEMBER != null){
                Cookie cookie = new Cookie("username", USERNAME);
                cookie.setPath("/");
                
                cookie.setMaxAge(60 * 60 * 24);
                response.addCookie(cookie);
            }
            
            Integer online = (Integer) application.getAttribute("online");
            online = (online == null) ? 1 : online + 1;
            application.setAttribute("online", online);

            session.setAttribute("Auth-Id", rs.getInt("id"));
            session.setAttribute("Auth-Name", rs.getString("name"));
            session.setAttribute("Auth-Username", rs.getString("username"));

            response.sendRedirect("../login.jsp");
        } else {
            response.sendRedirect("../login.jsp?err=Invalid Username or Password");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
