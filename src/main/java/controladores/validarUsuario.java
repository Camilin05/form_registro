/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;



/**
 *
 * @author Personal
 */

@WebServlet(name = "validarUsuario", urlPatterns = {"/validarUsuario"})
public class validarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("txtusuario");
        String pass = request.getParameter("txtpassword");
        
        
        boolean esValido = false;
        String mensaje = "";
        
        if("admin".equals(user) && "1234".equals(pass)) {
            esValido = true;
        }
        
        
        response.setContentType("text/html;charset=UTF-8");
        
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Resultado de la Validación</title>");
            out.println("</head>");
            out.println("<body>");
            
            if(esValido) {
                out.println("<h1>Registro Exitoso</h1>");
                out.println("<p>Bienvenido, " + user + "!</p>");
            } else {
                out.println("<h1>Registro Inválido</h1>");
                out.println("<p>Usuario o contraseña incorrectos.</p>");
                out.println("<a href='login.jsp'>Volver a intentar</a>");
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }
}

