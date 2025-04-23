<%-- 
    Document   : productos
    Created on : 23/04/2025, 8:05:56 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        
    </head>
    <body>
        <div class="container">
            <h1>Productos</h1>
            <p>Aquí se mostrarán los productos disponibles en nuestra tienda.</p>
            <p>Esta página sólo es accesible para usuarios que han iniciado sesión.</p>
            
            <button class="btn" onclick="window.history.back()">Volver</button>
        </div>
        
        <script>
            // Verificar si el usuario ha iniciado sesión
            window.onload = function() {
                var isLoggedIn = sessionStorage.getItem('userLoggedIn');
                
                if (isLoggedIn !== 'true') {
                    // Si no está logueado, redirigir a la página de inicio
                    alert('Necesitas iniciar sesión para acceder a esta página');
                    window.location.href = '../home.jsp';
                }
            };
        </script>
    </body>
</html>