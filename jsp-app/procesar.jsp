<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 1. Validar método POST
    if (!"POST".equals(request.getMethod())) {
        response.setStatus(405);
        out.println("<h3>Método no permitido (405)</h3>");
        return;
    }

    // 2. Obtener y validar parámetros
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");

    if (nombre == null || correo == null || nombre.isEmpty() || correo.isEmpty()) {
        response.setStatus(400);
        out.println("<h3>Datos inválidos (400)</h3>");
        return;
    }

    // 3. Guardar en sesión
    HttpSession sesion = request.getSession();
    List<String[]> registros = (List<String[]>) sesion.getAttribute("registros");
    if (registros == null) {
        registros = new ArrayList<>();
    }
    registros.add(new String[]{nombre, correo});
    sesion.setAttribute("registros", registros);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado JSP</title>
</head>
<body>
    <h3>Registros almacenados (JSP)</h3>
    <table border="1" cellpadding="10" style="border-collapse: collapse;">
        <tr><th>Nombre</th><th>Correo</th></tr>
        <%-- Iteración usando scriptlet --%>
        <% for (String[] reg : registros) { %>
            <tr>
                <td><%= reg[0] %></td>
                <td><%= reg[1] %></td>
            </tr>
        <% } %>
    </table>
    <br><a href="index.jsp">Volver al formulario</a>
</body>
</html>