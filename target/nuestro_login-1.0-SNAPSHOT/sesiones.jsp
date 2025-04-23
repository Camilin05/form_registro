<%-- 
    Document   : sesiones
    Created on : 23/04/2025, 10:45:59 a. m.
    Author     : Personal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Manejo de Sesiones</title>
    <style>
        /* Estilos modernos para la página de sesiones */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #4b6cb7, #182848);
            color: #fff;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            background-color: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            color: #fff;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        h2 {
            margin: 25px 0 15px;
            font-size: 20px;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.9);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding-bottom: 8px;
        }

        p {
            margin: 10px 0;
            font-size: 16px;
            line-height: 1.6;
        }

        .session-data {
            background-color: rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }

        form {
            margin: 20px 0;
            background-color: rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            padding: 20px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            margin: 8px 0;
            border: none;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]:focus {
            background-color: rgba(255, 255, 255, 0.3);
            box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
        }

        input[type="submit"] {
            background-color: #fff;
            color: #4b6cb7;
            border: none;
            padding: 12px 20px;
            margin-top: 15px;
            border-radius: 8px;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            background-color: #f8f9fa;
        }

        .stored-data {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
        }

        .nav-buttons {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .nav-button {
            background-color: rgba(255, 255, 255, 0.15);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 10px 20px;
            margin: 0 10px;
            border-radius: 8px;
            font-weight: 500;
            font-size: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .nav-button:hover {
            background-color: rgba(255, 255, 255, 0.25);
            transform: translateY(-2px);
        }

        .danger-button {
            background-color: rgba(220, 53, 69, 0.7);
            border-color: rgba(220, 53, 69, 0.3);
        }

        .danger-button:hover {
            background-color: rgba(220, 53, 69, 0.9);
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
                margin: 20px 10px;
            }
            
            h1 {
                font-size: 24px;
            }
            
            h2 {
                font-size: 18px;
            }
            
            input[type="submit"] {
                width: 100%;
            }
            
            .nav-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .nav-button {
                margin: 5px 0;
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manejo de Sesiones en JSP</h1>
        
        <%
            // Incrementar contador de visitas
            Integer visitas = (Integer) session.getAttribute("contadorVisitas");
            if (visitas == null) {
                visitas = 1;
            } else {
                visitas++;
            }
            session.setAttribute("contadorVisitas", visitas);
            
            // Obtener datos del cliente
            String navegador = request.getHeader("User-Agent");
        %>
        
        <h2>Información de sesión</h2>
        <div class="session-data">
            <p><strong>ID de sesión:</strong> <%= session.getId() %></p>
            <p><strong>Número de visitas:</strong> <%= visitas %></p>
            <p><strong>Fecha de primera visita:</strong> 
            <% 
                if(session.getAttribute("primeraVisita") == null) {
                    session.setAttribute("primeraVisita", new java.util.Date());
                }
                out.print(session.getAttribute("primeraVisita"));
            %>
            </p>
        </div>
        
        <h2>Información del cliente</h2>
        <div class="session-data">
            <p><strong>Tu navegador es:</strong> <%= navegador %></p>
            <p><strong>Tu dirección IP es:</strong> <%= request.getRemoteAddr() %></p>
        </div>
        
        <h2>Formulario para agregar datos a la sesión</h2>
        <form method="post">
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" >
            </div>
            
            <div class="form-group">
                <label for="color">Color favorito:</label>
                <input type="text" id="color" name="color" >
            </div>
            
            <input type="submit" value="Guardar en sesión">
        </form>
        
        <%
            // Procesar formulario
            if(request.getMethod().equals("POST")) {
                String nombre = request.getParameter("nombre");
                String color = request.getParameter("color");
                
                if(nombre != null && !nombre.trim().isEmpty()) {
                    session.setAttribute("nombreUsuario", nombre);
                }
                
                if(color != null && !color.trim().isEmpty()) {
                    session.setAttribute("colorFavorito", color);
                }
            }
            
            // Mostrar datos guardados
            String nombreGuardado = (String) session.getAttribute("nombreUsuario");
            String colorGuardado = (String) session.getAttribute("colorFavorito");
        %>
        
        <% if(nombreGuardado != null || colorGuardado != null) { %>
            <h2>Datos guardados en sesión</h2>
            <div class="stored-data">
                <% if(nombreGuardado != null) { %>
                    <p><strong>Nombre:</strong> <%= nombreGuardado %></p>
                <% } %>
                <% if(colorGuardado != null) { %>
                    <p><strong>Color favorito:</strong> <%= colorGuardado %></p>
                <% } %>
                <form method="post" action="?accion=limpiar">
                    <input type="hidden" name="accion" value="limpiar">
                    <input type="submit" value="Limpiar sesión" class="danger-button">
                </form>
            </div>
        <% } %>
        
        <%
            // Limpiar sesión
            if("limpiar".equals(request.getParameter("accion"))) {
                session.invalidate();
                response.sendRedirect("sesiones.jsp");
            }
        %>
        
        <div class="nav-buttons">
            <a href="home.jsp" class="nav-button">Volver al inicio</a>
        </div>
    </div>
</body>
</html>