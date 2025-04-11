<%-- 
    Document   : login
    Created on : 10/04/2025, 10:07:02 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ingreso de usuario</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">       
    </head>
    <body>
        <div>Ingresa el usuario.</div>
        <form name="Login" action="validarUsuario" method="post">
            <br><br>
            Usuario: <input type="text" name="txtusuario" value=""/>
            <br><br>
            Contraseña: <input type="password" name="txtpassword" value=""/>
            <br><br>
            <input type="submit" value="Entrar"/>
        </form>        
    </body>
</html>
