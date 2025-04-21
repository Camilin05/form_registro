<%-- 
    Document   : registro
    Created on : 21/04/2025, 10:08:54 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <style>
            /* Estilos modernos para página de registro */
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
                max-width: 500px;
                width: 90%;
            }

            .form {
                display: flex;
                flex-direction: column;
            }

            #heading {
                font-size: 28px;
                font-weight: 600;
                margin-bottom: 30px;
                text-align: center;
                color: #fff;
            }

            .form-group {
                margin-bottom: 20px;
                position: relative;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                font-size: 16px;
            }

            input[type="text"],
            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                border: none;
                background-color: rgba(255, 255, 255, 0.2);
                border-radius: 8px;
                color: #fff;
                font-size: 16px;
                transition: all 0.3s ease;
                outline: none;
            }

            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="password"]:focus {
                background-color: rgba(255, 255, 255, 0.3);
                box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
            }

            input::placeholder {
                color: rgba(255, 255, 255, 0.7);
            }

            .error {
                color: #ffb4b4;
                font-size: 14px;
                margin-top: 5px;
                display: none;
            }

            .register-btn {
                background-color: #fff;
                color: #764ba2;
                border: none;
                padding: 14px 20px;
                border-radius: 50px;
                font-weight: 600;
                font-size: 16px;
                cursor: pointer;
                transition: all 0.3s ease;
                margin-top: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .register-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
                background-color: #f8f9fa;
            }

            .login-link {
                margin-top: 30px;
                text-align: center;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .login-link p {
                margin-bottom: 10px;
                font-size: 15px;
            }

            .login-btn {
                background: transparent;
                color: #fff;
                border: 2px solid rgba(255, 255, 255, 0.5);
                padding: 10px 20px;
                border-radius: 50px;
                font-weight: 500;
                font-size: 15px;
                cursor: pointer;
                transition: all 0.3s ease;
                width: fit-content;
            }

            .login-btn:hover {
                background-color: rgba(255, 255, 255, 0.1);
                transform: translateY(-2px);
            }

            @media (max-width: 768px) {
                .container {
                    padding: 30px 20px;
                }
                
                #heading {
                    font-size: 24px;
                }
                
                input[type="text"],
                input[type="email"],
                input[type="password"] {
                    padding: 10px 12px;
                }
                
                .register-btn, .login-btn {
                    padding: 12px 18px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form class="form" action="validarUsuario" method="post">
                <!-- Campo oculto para indicar la acción de registro -->
                <input type="hidden" name="accion" value="registro">
                
                <p id="heading">Crear una cuenta</p>
                
                <div class="form-group">
                    <label for="nombre">Nombre completo</label>
                    <input type="text" id="nombre" name="txtnombre" required>
                    <div class="error" id="nombre-error">Por favor ingresa tu nombre completo</div>
                </div>
                
                <div class="form-group">
                    <label for="email">Correo electrónico</label>
                    <input type="email" id="email" name="txtemail" required>
                    <div class="error" id="email-error">Por favor ingresa un correo electrónico válido</div>
                </div>
                
                <div class="form-group">              
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="txtcontrasenia" required>
                    <div class="error" id="password-error">La contraseña debe tener al menos 8 caracteres</div>
                </div>
                
                <div class="form-group">
                    <label for="confirm-password">Confirmar contraseña</label>
                    <input type="password" id="confirm-password" name="txtconfirm-contrasenia" required>
                    <div class="error" id="confirm-password-error">Las contraseñas no coinciden</div>
                </div>
                
                <button type="submit" class="register-btn">Registrarse</button>
                
                <div class="login-link">
                    <p>¿Ya tienes cuenta?</p>
                    <button type="button" onclick="location.href='login.jsp'" class="login-btn">Iniciar sesión</button>
                </div>
            </form>
        </div>
                
        <script>
            // Validación del formulario
            document.querySelector('.form').addEventListener('submit', function(e) {
                let valid = true;
                
                // Validar nombre
                const nombre = document.getElementById('nombre');
                if (nombre.value.trim() === '') {
                    document.getElementById('nombre-error').style.display = 'block';
                    valid = false;
                } else {
                    document.getElementById('nombre-error').style.display = 'none';
                }
                
                // Validar email
                const email = document.getElementById('email');
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email.value)) {
                    document.getElementById('email-error').style.display = 'block';
                    valid = false;
                } else {
                    document.getElementById('email-error').style.display = 'none';
                }
                
                // Validar contraseña
                const password = document.getElementById('password');
                if (password.value.length < 8) {
                    document.getElementById('password-error').style.display = 'block';
                    valid = false;
                } else {
                    document.getElementById('password-error').style.display = 'none';
                }
                
                // Validar confirmación de contraseña
                const confirmPassword = document.getElementById('confirm-password');
                if (password.value !== confirmPassword.value) {
                    document.getElementById('confirm-password-error').style.display = 'block';
                    valid = false;
                } else {
                    document.getElementById('confirm-password-error').style.display = 'none';
                }
                
                if (!valid) {
                    e.preventDefault();
                }
            });
        </script>
    </body>
</html>