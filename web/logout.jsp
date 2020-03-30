<%
    session.invalidate();

    Integer online = (Integer) application.getAttribute("online");
    if (online != null) online--;
    application.setAttribute("online", online);

    response.sendRedirect("login.jsp");
%>
