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
        String password = request.getParameter("txtpassword");
        HttpSession session = request.getSession();
        
        Integer intentosF = (Integer) session.getAttribute("Intentos fallidos");
        if (intentosF == null){
            intentosF = 0;
        }
        
        boolean esValido = false;
        
        if("Admin1".equals(user) && "1234".equals(password)||
                ("Admin2".equals(user) && "1234".equals(password)) || 
                    ("Admin3".equals(user) && "1234".equals(password))){
        esValido = true;
        session.setAttribute("Intentos fallidos", 0);
        }else{
        intentosF++;
        session.setAttribute("Intentos fallidos", intentosF);
        }
        
                        
        
        response.setContentType("text/html;charset=UTF-8");
        
        try(PrintWriter out = response.getWriter()){
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Resultado de la validacion</title>");
            out.println("</head>");
            out.println("<body>");
            if(esValido){
            out.println("<h1> Regitro exitoso </h1>");                    
            out.println("<p> Bienvenido, " + user + "!</p>");     
            out.println("<a href='login.jsp'>Back.</a>");
            }else {
            out.println("<h1>Registro inválido</h1>");           
            out.println("<p> Usuario o contraseña incorrectos.</p>");
            out.println("<a href='login.jsp'>Volver a intentar.</a> <br><br>");
            out.println("<p>Llevas estos intentos: " + intentosF + "</p>");
            if (intentosF >= 3){
            
                out.println("<p style='color=red'> Has superado el número máximo de intentos.");
              }
            }                    
            out.println("</body>");
            out.println("</html>");
      }
        
  

   }
}
