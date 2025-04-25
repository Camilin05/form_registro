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
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                min-height: 100vh;
                background: linear-gradient(135deg, #4b6cb7, #182848);
                padding: 20px;
            }
            
            .container, .result-container {
                background-color: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 40px;
                width: 90%;
                max-width: 800px;
                text-align: center;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                margin-bottom: 20px;
            }
            
            h1 {
                color: white;
                margin-bottom: 30px;
                font-size: 2em;
            }
            
            p {
                color: white;
                margin-bottom: 15px;
                font-size: 1.1em;
            }
            
            .success-message {
                background-color: rgba(40, 167, 69, 0.2);
                padding: 20px;
                border-radius: 10px;
            }
            
            .error-message {
                background-color: rgba(220, 53, 69, 0.2);
                padding: 20px;
                border-radius: 10px;
            }
            
            a {
                color: #61dafb;
                text-decoration: none;
                transition: color 0.3s;
            }
            
            a:hover {
                color: #39a8d5;
                text-decoration: underline;
            }
            
            .main-options {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                margin-top: 30px;
            }
            
            .btn {
                padding: 12px 25px;
                background-color: rgba(255, 255, 255, 0.2);
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
                width: 180px;
                font-weight: 500;
            }
            
            .btn:hover {
                background-color: rgba(255, 255, 255, 0.3);
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
        </style>
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
                            
                            // Establecer el tiempo de inicio de sesión
                            sessionStorage.setItem('sessionStartTime', Date.now());
                            
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
                <button class="btn" onclick="location.href='inicioInicio.jsp'">Entrar</button>            
            <button class="btn" onclick="location.href='home.jsp'">Volver al inicio</button>     
            </div>
            <div class="main-options">
            
        </div>
        </div>
        <% } %>
    </body>
</html>