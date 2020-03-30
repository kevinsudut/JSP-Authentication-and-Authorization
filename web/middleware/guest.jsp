<%
    if (session.getAttribute("Auth-Id") != null) {
        response.sendRedirect("index.jsp");        
    }
%>
