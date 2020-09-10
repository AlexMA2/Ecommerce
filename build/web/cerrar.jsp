
<%

    if (session.getAttribute("user") != null) {
        session.setAttribute("cerrarSesion", "true");
    }

    response.sendRedirect("index.jsp");
%>