<%-- 
    Document   : home
    Created on : 23/04/2025, 7:48:47 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        
    </head>
    <body>
        <div class="container">
            <h1>Inicio</h1>
            
            <div id="messageBox">
                Necesitas iniciar sesión primero para acceder a esta sección.
            </div>

            <div class="main-options">
                <button class="btn" onclick="checkAccess('more_folders/productos.jsp')">Productos</button>
                <button class="btn" onclick="checkAccess('more_folders/contacto.jsp')">Contacto</button>
                <button class="btn" onclick="checkAccess('more_folders/ayuda.jsp')">Acerca de nosotros</button>
            </div>

            <div class="auth-container">
                <div class="auth-box login-box">
                    <button class="btn" onclick="location.href='login.jsp'">Iniciar sesión</button>
                </div>

                <div class="auth-box register-box">
                    <button class="btn" onclick="location.href='registro.jsp'">Registrarse</button>
                </div>
            </div>
        </div>
        
        <script>
            // Función para verificar si el usuario ha iniciado sesión
            function checkAccess(destination) {
                // Comprobamos si hay una sesión activa (simulado con localStorage)
                var isLoggedIn = sessionStorage.getItem('userLoggedIn');
                
                if (isLoggedIn === 'true') {
                    // Si está logueado, permitir acceso
                    location.href = destination;
                } else {
                    // Si no está logueado, mostrar mensaje y redirigir después de un tiempo
                    var messageBox = document.getElementById('messageBox');
                    messageBox.style.display = 'block';
                    
                    // Guardar la página a la que quería ir
                    sessionStorage.setItem('redirectAfterLogin', destination);
                    
                    // Redirigir a la página de login después de 2 segundos
                    setTimeout(function() {
                        location.href = 'login.jsp';
                    }, 2000);
                }
            }
        </script>
    </body>
</html>