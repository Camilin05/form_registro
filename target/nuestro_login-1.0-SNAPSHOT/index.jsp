<%-- 
    Document   : index
    Created on : 9/04/2025, 10:31:56 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi proyecto</title>
    </head>
    <body>
        <div>Ingreso usuario</div>
        
        <form name="Registro" action="procesarRegistros" method="get">
            <br><br>
            Nombre:   <input type="text" name="txtnombre" value="" />
            <br><br>
            Apellido:   <input type="text" name="txtapellido" value="" />                      
            <br><br><!-- comment -->
            Email: <input type="email" name="txtemail" value="" />                                   
            <br><br>                
            Edad: <input type="number" name="txtedad" min="0" />
            <br> <br><!-- comment -->
            <input type="submit" value="Enviar"/>  
        </form>
    </body>
</html>
