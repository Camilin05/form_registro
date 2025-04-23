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
            
            p {
                color: white;
                margin-bottom: 20px;
                font-size: 1.1em;
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
                min-width: 150px;
                font-weight: 500;
                margin-top: 20px;
            }
            
            .btn:hover {
                background-color: rgba(255, 255, 255, 0.3);
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
        </style>
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