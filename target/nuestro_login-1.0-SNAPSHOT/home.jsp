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
                background-color: rgba(23, 23, 23, 0.9);
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
            
            .auth-container {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-top: 40px;
            }
            
            .auth-box {
                flex: 1;
                max-width: 200px;
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
                width: 100%;
                font-weight: 500;
            }
            
            .btn:hover {
                background-color: rgba(255, 255, 255, 0.3);
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            #messageBox {
                background-color: rgba(255, 0, 0, 0.2);
                color: white;
                padding: 15px;
                border-radius: 8px;
                margin-bottom: 20px;
                display: none;
            }
            
            @media (max-width: 768px) {
                .main-options, .auth-container {
                    flex-direction: column;
                    gap: 15px;
                }
                
                .auth-box {
                    max-width: 100%;
                }
            }
        </style>
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
                    }, 1000);
                }
            }
        </script>
    </body>
</html>