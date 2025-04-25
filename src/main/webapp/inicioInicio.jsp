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
                margin-bottom: 15px;
                font-size: 1.2em;
            }
            
            .session-info {
                color: white;
                margin-bottom: 30px;
                font-size: 1em;
                background-color: rgba(0, 0, 0, 0.2);
                padding: 15px;
                border-radius: 10px;
            }
            
            .timer {
                font-weight: bold;
                color: #61dafb;
            }
            
            .timeout-warning {
                color: #ff8a8a;
                font-size: 0.9em;
                margin-top: 5px;
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
            
            <div class="session-info">
                <p>Tiempo de sesión activa: <span class="timer" id="sessionTimer">0 segundos</span></p>
                <p class="timeout-warning" id="timeoutWarning" style="display: none;">
                    La sesión se cerrará automáticamente después de <span id="timeoutCounter">60</span> segundos de inactividad
                </p>
            </div>

            <div class="main-options">
                <button class="btn" onclick="location.href='more_folders/productos.jsp'; resetInactivityTimer();">Productos</button>
                <button class="btn" onclick="location.href='more_folders/contacto.jsp'; resetInactivityTimer();">Contacto</button>
                <button class="btn" onclick="location.href='more_folders/ayuda.jsp'; resetInactivityTimer();">Acerca de nosotros</button>
                <button class="btn" onclick="location.href='sesiones.jsp'; resetInactivityTimer();">Acerca sobre inicios de sesión</button>
            </div>

            <button class="btn logout-btn" onclick="logout()">Cerrar sesión</button>
        </div>
        
        <script>
            // Variables para el control de la sesión
            let sessionStartTime;
            let sessionTimer;
            let inactivityTimer;
            let countdownTimer;
            const INACTIVITY_TIMEOUT = 60000; // 60 segundos de inactividad antes de cerrar sesión
            let remainingTime = INACTIVITY_TIMEOUT / 1000;
            
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
                    
                    // Iniciar el contador de tiempo de sesión
                    startSessionTimer();
                    
                    // Iniciar el timer de inactividad
                    resetInactivityTimer();
                }
            };
            
            // Función para iniciar el contador de tiempo de sesión
            function startSessionTimer() {
                // Obtener la hora de inicio de sesión o establecerla si no existe
                sessionStartTime = sessionStorage.getItem('sessionStartTime');
                if (!sessionStartTime) {
                    sessionStartTime = Date.now();
                    sessionStorage.setItem('sessionStartTime', sessionStartTime);
                }
                
                // Actualizar el contador cada segundo
                sessionTimer = setInterval(function() {
                    const currentTime = Date.now();
                    const elapsedTimeInSeconds = Math.floor((currentTime - sessionStartTime) / 1000);
                    
                    let displayText = elapsedTimeInSeconds + " segundos";
                    if (elapsedTimeInSeconds >= 60) {
                        const minutes = Math.floor(elapsedTimeInSeconds / 60);
                        const seconds = elapsedTimeInSeconds % 60;
                        displayText = minutes + " minuto" + (minutes !== 1 ? "s" : "") + 
                                    " y " + seconds + " segundo" + (seconds !== 1 ? "s" : "");
                    }
                    
                    document.getElementById('sessionTimer').textContent = displayText;
                }, 1000);
            }
            
            // Función para reiniciar el timer de inactividad
            function resetInactivityTimer() {
                // Limpiar timers existentes
                clearTimeout(inactivityTimer);
                clearInterval(countdownTimer);
                
                // Ocultar advertencia y reiniciar contador
                document.getElementById('timeoutWarning').style.display = 'none';
                remainingTime = INACTIVITY_TIMEOUT / 1000;
                
                // Configurar nuevo timer de inactividad
                inactivityTimer = setTimeout(function() {
                    // Mostrar advertencia de timeout
                    document.getElementById('timeoutWarning').style.display = 'block';
                    
                    // Iniciar cuenta regresiva
                    countdownTimer = setInterval(function() {
                        remainingTime--;
                        document.getElementById('timeoutCounter').textContent = remainingTime;
                        
                        if (remainingTime <= 0) {
                            // Cerrar sesión por inactividad
                            clearInterval(countdownTimer);
                            logout('La sesión ha sido cerrada por inactividad');
                        }
                    }, 1000);
                }, INACTIVITY_TIMEOUT);
            }
            
            // Escuchar eventos de actividad del usuario
            document.addEventListener('mousemove', resetInactivityTimer);
            document.addEventListener('keypress', resetInactivityTimer);
            document.addEventListener('click', resetInactivityTimer);
            document.addEventListener('scroll', resetInactivityTimer);
            
            // Función para cerrar sesión
            function logout(message) {
                // Limpiar timers
                clearInterval(sessionTimer);
                clearTimeout(inactivityTimer);
                clearInterval(countdownTimer);
                
                // Eliminar las variables de sesión
                sessionStorage.removeItem('userLoggedIn');
                sessionStorage.removeItem('username');
                sessionStorage.removeItem('redirectAfterLogin');
                sessionStorage.removeItem('sessionStartTime');
                
                // Informar al usuario si hay mensaje
                if (message) {
                    alert(message);
                } else {
                    alert('Has cerrado sesión correctamente');
                }
                
                // Redirigir a la página de inicio
                window.location.href = 'home.jsp';
            }
        </script>
    </body>
</html>