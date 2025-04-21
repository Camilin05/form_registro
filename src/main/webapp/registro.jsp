<%-- 
    Document   : registro
    Created on : 21/04/2025, 10:08:54 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
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
