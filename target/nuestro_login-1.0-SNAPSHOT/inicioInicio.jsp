<%-- 
    Document   : inicioInicio
    Created on : 23/04/2025, 9:00:06 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio exitoso</title>
        
    </head>
    <body>
        <div class="container">
            <h1>Inicio</h1>
            
            <div class="user-info" id="userWelcome">
                <!-- El nombre de usuario se insertará aquí con JavaScript -->
            </div>

            <div class="main-options">
                <button class="btn" onclick="location.href='more_folders/productos.jsp'">Productos</button>
                <button class="btn" onclick="location.href='more_folders/contacto.jsp'">Contacto</button>
                <button class="btn" onclick="location.href='more_folders/ayuda.jsp'">Acerca de nosotros</button>
            </div>

            <button class="btn logout-btn" onclick="logout()">Cerrar sesión</button>
        </div>
        
        <script>
            // Verificar si el usuario ha iniciado sesión
            window.onload = function() {
                var isLoggedIn = sessionStorage.getItem('userLoggedIn');
                var username = sessionStorage.getItem('username');
                
                if (isLoggedIn !== 'true') {
                    // Si no está logueado, redirigir a la página de inicio
                    alert('Necesitas iniciar sesión para acceder a esta página');
                    window.location.href = 'home.jsp';
                } else {
                    // Mostrar mensaje de bienvenida
                    document.getElementById('userWelcome').textContent = '¡Bienvenido, ' + username + '!';
                }
            };
            
            // Función para cerrar sesión
            function logout() {
                // Eliminar las variables de sesión
                sessionStorage.removeItem('userLoggedIn');
                sessionStorage.removeItem('username');
                sessionStorage.removeItem('redirectAfterLogin');
                
                // Redirigir a la página de inicio
                window.location.href = 'home.jsp';
                
                // Informar al usuario
                alert('Has cerrado sesión correctamente');
            }
        </script>
    </body>
</html>