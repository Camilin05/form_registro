<%-- 
    Document   : resultado
    Created on : 11/04/2025, 11:07:42 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado validación</title>
        
    </head>
    <body>
        <% 
        Boolean valido = (Boolean)request.getAttribute("esValido");
        Boolean esRegistro = (Boolean)request.getAttribute("esRegistro");
        String redirectUrl = (String)session.getAttribute("redirectAfterLogin");
        %>
        
        <div class="result-container">
            <div class="<%= (valido != null && valido) ? "success-message" : "error-message" %>">
                <h1>${mensaje}</h1>
                
                <% if(esRegistro != null && esRegistro) { %>
                    <% if(valido != null && valido) { %>
                        <p>¡Registro completado correctamente!</p>
                        <a href="login.jsp">Ir a iniciar sesión</a>
                    <% } else { %>
                        <p>Hubo un problema con el registro.</p>
                        <a href="registro.jsp">Volver a intentar</a>
                    <% } %>
                <% } else { %>
                    <% if(valido != null && valido) { %>
                        <p>Bienvenido, ${usuario}!</p>
                        <p>Has iniciado sesión correctamente.</p>
                        <p>Selecciona una de las siguientes opciones para comenzar:</p>
                        <script>
                            // Establecer la variable de sesión cuando el login es exitoso
                            sessionStorage.setItem('userLoggedIn', 'true');
                            sessionStorage.setItem('username', '${usuario}');
                            
                            // Verificar si hay una redirección pendiente
                            var redirectUrl = sessionStorage.getItem('redirectAfterLogin');
                            if (redirectUrl && redirectUrl !== 'null' && redirectUrl !== '') {
                                // Limpiar la variable de redirección
                                sessionStorage.removeItem('redirectAfterLogin');
                                // Redirigir después de un breve retraso
                                setTimeout(function() {
                                    window.location.href = redirectUrl;
                                }, 2000);
                            }
                        </script>
                    <% } else { %>
                        <p>Usuario o contraseña incorrectos.</p>
                        <a href="login.jsp">Volver a intentar</a>
                    <% } %>
                <% } %>
            </div>
        </div>
        
        <% if(valido != null && valido && (esRegistro == null || !esRegistro)) { %>
        <div class="container">
            <h1>Bienvenido a nuestro proyecto</h1>

            <div class="main-options">
                <button class="btn" onclick="location.href='inicioInicio.jsp'">Inicio</button>            
                <button class="btn" onclick="location.href='more_folders/contacto.jsp'">Contacto</button>
                <button class="btn" onclick="location.href='more_folders/ayuda.jsp'">Acerca de nosotros</button>
            </div>
        </div>
        <% } %>
    </body>
</html>