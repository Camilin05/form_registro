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
        <style>/* Estilos modernos para página de resultado - Login */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: #fff;
    padding: 20px;
}

.container {
    background-color: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    border-radius: 16px;
    padding: 40px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-align: center;
    max-width: 800px;
    width: 90%;
}

.welcome-message {
    margin-bottom: 30px;
}

h1 {
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #fff;
}

p {
    font-size: 18px;
    margin-bottom: 16px;
    line-height: 1.6;
}

.success-message {
    background-color: rgba(72, 187, 120, 0.2);
    border-left: 4px solid #48bb78;
    padding: 15px;
    border-radius: 8px;
    margin: 20px 0;
}

.error-message {
    background-color: rgba(245, 101, 101, 0.2);
    border-left: 4px solid #f56565;
    padding: 15px;
    border-radius: 8px;
    margin: 20px 0;
}

a {
    display: inline-block;
    background-color: #fff;
    color: #764ba2;
    text-decoration: none;
    padding: 12px 24px;
    border-radius: 50px;
    font-weight: 500;
    margin-top: 20px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

a:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    background-color: #f8f9fa;
}

.options-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 30px;
}

.option-card {
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    overflow: hidden;
    width: 100%;
    max-width: 320px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    padding: 15px;
    cursor: pointer;
}

.option-card:hover {
    transform: translateY(-5px);
    background-color: rgba(255, 255, 255, 0.2);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.option-icon {
    margin-right: 15px;
}

.option-icon input[type="submit"] {
    background: none;
    border: none;
    font-size: 30px;
    cursor: pointer;
    padding: 10px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.2);
    width: 60px;
    height: 60px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 0.3s ease;
}

.option-icon input[type="submit"]:hover {
    background-color: rgba(255, 255, 255, 0.3);
    transform: scale(1.1);
}

.option-content {
    text-align: left;
    flex: 1;
}

.option-title {
    font-weight: 600;
    font-size: 18px;
    margin-bottom: 5px;
}

.option-description {
    font-size: 14px;
    opacity: 0.8;
}

@media (max-width: 768px) {
    .container {
        padding: 30px;
    }
    
    h1 {
        font-size: 24px;
    }
    
    p {
        font-size: 16px;
    }

    .options-container {
        flex-direction: column;
        align-items: center;
    }

    .option-card {
        max-width: 100%;
        width: 100%;
    }
}</style>
        <title>Resultado validación</title>
    </head>
    <body>
        <div class="container">
            <div class="welcome-message">
                <h1>${mensaje}</h1>   
                <% 
                Boolean valido = (Boolean)request.getAttribute("esValido");
                if(valido != null && valido) { 
                %>
                    <p>Bienvenido, ${usuario}!</p>
                    <p>Has iniciado sesión correctamente.</p>
                <% } else { %>
                    <p>Usuario o contraseña incorrectos.</p>
                    <a href="login.jsp">Volver a intentar</a>
                <% } %>
                <p>Selecciona una de las siguientes opciones para comenzar:</p>
            </div>
            
            <div class="options-container">
                <div class="option-card">
                    <div class="option-icon">
                        <input type="submit" value="📊" name="btn-dashboard" />
                    </div>
                    <div class="option-content">
                        <div class="option-title">Dashboard Principal</div>
                        <div class="option-description">Accede a tu panel de control con estadísticas, notificaciones y actividades recientes.</div>
                    </div>
                </div>
                
                <div class="option-card">
                    <div class="option-icon">
                        <input type="submit" value="👤" name="btn-perfilUser" />
                    </div>
                    <div class="option-content">
                        <div class="option-title">Mi Perfil</div>
                        <div class="option-description">Edita tu información personal, preferencias y configuración de seguridad.</div>
                    </div>
                </div>
                
                <div class="option-card">
                    <div class="option-icon">
                        <input type="submit" value="🚪" name="btn-cerrarSesion" />
                    </div>
                    <div class="option-content">
                        <div class="option-title">Cerrar Sesión</div>
                        <div class="option-description">Finaliza tu sesión actual de manera segura.</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>