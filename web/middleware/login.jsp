<%
    if (session.getAttribute("Auth-Id") == null) {
        response.sendRedirect("login.jsp");        
    }
%>
