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
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author Personal
 */
@WebServlet(name = "procesarRegistros", urlPatterns = {"/procesarRegistro"}) 
public class procesarRegistros extends HttpServlet {
   

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String nombre = request.getParameter("txtnombre");
        String apellido = request.getParameter("txtapellido");
        String email = request.getParameter("txtemail");
        String edad = request.getParameter("txtedad");
        
        response.setContentType("text/html;charset=UTF-8");
        
        
        try (PrintWriter out = response.getWriter()){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Resultado del Registro</title>");
            out.println("</head>");
            out.println("<body>");
            if("null".equals(nombre) || nombre.isBlank() || "null".equals(apellido)|| apellido.isBlank() || "null".equals(email)|| apellido.isBlank() || "null".equals(edad)|| apellido.isBlank()){
            out.println("<h1>ERROR 404</h1>" );
            out.println("<a href='index.jsp'>Back</a>");
            }else{
            out.println("<h1>Registro procesado.</h1>");
            out.println("<p>Nombre: " + nombre + "</p>");
            out.println("<p>Apellido: " + apellido + "</p>");
            out.println("<p>Email: " + email + "</p>");
            out.println("<p>Edad: " + edad + "</p>");         
            
            out.println("</body>");
            out.println("</html>");
        } 
        }
       
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

    

}
