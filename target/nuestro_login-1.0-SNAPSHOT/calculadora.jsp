<%-- 
    Document   : calculadora
    Created on : 10/04/2025, 11:35:59 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora JSP</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            
            .container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 380px;
                margin-top: 20px;
                text-align: center;
            }
            
            h1 {
                color: #3f51b5;
                text-align: center;
                margin-bottom: 20px;
                
            }
            
            h2 {
                color: #555;
                font-size: 1.2rem;
                border-bottom: 1px solid #eee;
                padding-bottom: 10px;
                margin-top: 25px;
                text-align: center;
            }
            
            .calc-display {
                width: 100%;
                padding: 15px;
                font-size: 1.2rem;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f8f9fa;
                text-align: right;
                box-sizing: border-box;
            }
            
            .form-group {
                margin-bottom: 15px;
                
            }
            
            label {
                display: block;
                margin-bottom: 5px;
                color: #666;
                font-weight: 500;
            }
            
            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 1rem;
            }
            
            select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: white;
                font-size: 1rem;
            }
            
            .btn {
                background-color: #3f51b5;
                color: white;
                border: none;
                padding: 12px 20px;
                width: 100%;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1rem;
                font-weight: 500;
                margin-top: 10px;
                transition: background-color 0.3s;
            }
            
            .btn:hover {
                background-color: #303f9f;
            }
            
            .result {
                margin-top: 20px;
                padding: 15px;
                background-color: #e8f5e9;
                border-radius: 5px;
                text-align: center;
                font-weight: 500;
            }
            
            .error {
                background-color: #ffebee;
                color: #c62828;
                padding: 15px;
                border-radius: 5px;
                text-align: center;
                margin-top: 20px;
                font-weight: 500;
            }
            
            .examples {
                background-color: #e3f2fd;
                padding: 15px;
                border-radius: 5px;
                margin-top: 20px;
            }
            
            .examples p {
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <h1>Calculadora en JSP</h1>
        
        <%! 
            private int total;
            public int metodoSuma(int a, int b){
                return a + b;  
            }
            public int metodoResta(int a, int b){
                return a - b;  
            }
            public int metodoMultiplicacion(int a, int b){
                return a * b;  
            }
            public int metodoDivision(int a, int b){
                if (b != 0) {
                    return a / b;
                } else {
                    return 0; // Código de error
                }
            }
            
            // Método para verificar si es división por cero
            public boolean esDivisionPorCero(int b){
                return b == 0;
            }
        %>
        
        <div class="container">
            
            
            <h2>Calculadora</h2>
            <form method="post">
                <div class="form-group">
                    <label for="num1">Primer número:</label>
                    <input type="number" id="num1" name="num1" value="0"/>
                </div>
                
                <div class="form-group">
                    <label for="num2">Segundo número:</label>
                    <input type="number" id="num2" name="num2" value="0"/>
                </div>
                
                <div class="form-group">
                    <label for="operacion">Operación:</label>
                    <select id="operacion" name="operacion">
                        <option value="suma">Suma</option>
                        <option value="resta">Resta</option>
                        <option value="multiplicacion">Multiplicación</option> 
                        <option value="division">División</option>
                    </select>
                </div>
                
                <button type="submit" class="btn">Calcular</button>
            </form>
            
            <%
                if(request.getMethod().equals("POST")){
                    try{
                        int num1 = Integer.parseInt(request.getParameter("num1"));
                        int num2 = Integer.parseInt(request.getParameter("num2"));
                        String operacion = request.getParameter("operacion");
                        int resultado = 0;
                        boolean hayError = false;
                        String mensajeError = "";
                        
                        if("suma".equals(operacion)){
                            resultado = metodoSuma(num1, num2);
                        } else if("resta".equals(operacion)){
                            resultado = metodoResta(num1, num2); 
                        } else if("multiplicacion".equals(operacion)){
                            resultado = metodoMultiplicacion(num1, num2); 
                        } else if("division".equals(operacion)){
                            if(esDivisionPorCero(num2)){
                                hayError = true;
                                mensajeError = "Error: No se puede dividir entre cero";
                            } else {
                                resultado = metodoDivision(num1, num2);
                            }
                        }
                        
                        if(hayError){
                        %>
                            <div class="error"><%= mensajeError %></div>
                        <% 
                        } else {
                        %>
                            <div class="result">
                                <p>El resultado de la operación es: <%= resultado%></p>
                            </div>
                        <%
                        }
                            
                    } catch(Exception e){
                        %>
                            <div class="error">Error en los datos ingresados</div>
                        <%
                    }
                }
            %>
        </div>
    </body>
</html>