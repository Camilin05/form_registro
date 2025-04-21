<%-- 
    Document   : resultado
    Created on : 11/04/2025, 11:07:42 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            /* Estilos modernos para página de resultado */
            

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

            .result-container {
                background-color: rgba(255, 255, 255, 0.15);
                backdrop-filter: blur(10px);
                border-radius: 16px;
                padding: 40px;
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
                text-align: center;
                max-width: 500px;
                width: 90%;
                margin-bottom: 20px;
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

            .icon {
                font-size: 64px;
                margin-bottom: 20px;
            }

            .success-icon {
                color: #48bb78;
            }

            .error-icon {
                color: #f56565;
            }

            .welcome-message {
                margin-bottom: 30px;
            }

            .options-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                width: 90%;
                max-width: 900px;
            }

            .option-card {
                display: flex;
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 12px;
                padding: 20px;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .option-card:hover {
                transform: translateY(-5px);
                background-color: rgba(255, 255, 255, 0.2);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }

            .option-icon {
                font-size: 24px;
                margin-right: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .option-icon input[type="submit"] {
                background: none;
                border: none;
                font-size: 24px;
                cursor: pointer;
            }

            .option-content {
                flex: 1;
            }

            .option-title {
                font-weight: 600;
                margin-bottom: 5px;
                font-size: 18px;
            }

            .option-description {
                font-size: 14px;
                opacity: 0.8;
            }

            @media (max-width: 768px) {
                .result-container {
                    padding: 30px;
                }
                
                h1 {
                    font-size: 24px;
                }
                
                p {
                    font-size: 16px;
                }
                
                .options-container {
                    grid-template-columns: 1fr;
                }
            }
        </style>
        <title>Resultado validación</title>
    </head>
    <body>
        <% 
        Boolean valido = (Boolean)request.getAttribute("esValido");
        Boolean esRegistro = (Boolean)request.getAttribute("esRegistro");
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
                    <% } else { %>
                        <p>Usuario o contraseña incorrectos.</p>
                        <a href="registro.jsp">Volver a intentar</a>
                    <% } %>
                <% } %>
            </div>
        </div>
        
        <% if(valido != null && valido && (esRegistro == null || !esRegistro)) { %>
        <form action="opciones" method="post">
            <div class="options-container">
                <div class="option-card">
                    <div class="option-icon"><input type="submit" value="" name="btn-dashboard" /></div>
                    <div class="option-content">
                        <div class="option-title">Dashboard Principal</div>
                        <div class="option-description">Accede a tu panel de control con estadísticas, notificaciones y actividades recientes.</div>
                    </div>
                </div>
                
                <div class="option-card">
                    <div class="option-icon"><input type="submit" value="" name="btn-perfilUser" /></div>
                    <div class="option-content">
                        <div class="option-title">Mi Perfil</div>
                        <div class="option-description">Edita tu información personal, preferencias y configuración de seguridad.</div>
                    </div>
                </div>
                
                <div class="option-card">
                    <div class="option-icon"><input type="submit" value="" name="btn-cerrarSesion" /></div>
                    <div class="option-content">
                        <div class="option-title">Cerrar Sesión</div>
                        <div class="option-description">Finaliza tu sesión actual de manera segura.</div>
                    </div>
                </div>
            </div>
        </form>
        <% } %>
    </body>
</html>