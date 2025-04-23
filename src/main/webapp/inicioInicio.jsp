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
            
            .container {
                background-color: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 40px;
                width: 90%;
                max-width: 800px;
                text-align: center;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            }
            
            h1 {
                color: white;
                margin-bottom: 30px;
                font-size: 2.5em;
            }
            
            .main-options {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
                margin-bottom: 40px;
            }
            
            .user-info {
                color: white;
                margin-bottom: 30px;
                font-size: 1.2em;
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
                min-width: 180px;
                font-weight: 500;
            }
            
            .btn:hover {
                background-color: rgba(255, 255, 255, 0.3);
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .logout-btn {
                background-color: rgba(220, 53, 69, 0.5);
                margin-top: 30px;
            }
            
            .logout-btn:hover {
                background-color: rgba(220, 53, 69, 0.7);
            }
            
            @media (max-width: 768px) {
                .main-options {
                    flex-direction: column;
                    gap: 15px;
                }
            }
        </style>
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
                <button class="btn" onclick="location.href='sesiones.jsp'">Acerca sobre inicios de sesión</button>
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